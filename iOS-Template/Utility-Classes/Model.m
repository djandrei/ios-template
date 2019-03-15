//
//  Model.m
//
//  Copyright (c) 2019 andrei.dimitrief.jianu@gmail.com. All rights reserved.
//
//  The above copyright notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "Model.h"

@interface Model ()

- (void)privateQueueManagedObjectContextDidSaveNotificationHandler:(NSNotification *)notification;
- (void)mainQueueManagedObjectContextDidSaveNotificationHandler:(NSNotification *)notification;

@end

@implementation Model

#pragma mark - lifecycle related methods

- (id) initWithDataModelName:(NSString *)dataModelName
      withDataModelExtension:(NSString *)dataModelExtension
     withPersistentStoreName:(NSString *)persistentStoreName
         withCompletionBlock:(void (^)(NSError *initError))completionBlock
{
    self = [super init];
    if (self)
    {
        _dataModelName = dataModelName;
        _dataModelExtension = dataModelExtension;
        _persistentStoreName = persistentStoreName;
        
        NSURL *managedObjectModelURL = [[NSBundle mainBundle]
                                        URLForResource:dataModelName
                                        withExtension:dataModelExtension];
        
        NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:managedObjectModelURL];
        
        NSURL *persistentStoreDirectoryURL = [[[NSFileManager defaultManager]
                                               URLsForDirectory:NSDocumentDirectory
                                               inDomains:NSUserDomainMask] lastObject];
        
        NSURL *persistentStoreURL = [persistentStoreDirectoryURL
                                     URLByAppendingPathComponent:persistentStoreName];
        
        NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
                                                                    initWithManagedObjectModel:managedObjectModel];
        
        NSDictionary *options = @
        {
            NSIgnorePersistentStoreVersioningOption:@NO,
            NSMigratePersistentStoresAutomaticallyOption:@YES,
            NSInferMappingModelAutomaticallyOption:@YES,
            NSSQLitePragmasOption: @{@"journal_mode": @"DELETE"}
        };
        NSError *persistentStoreError;
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                 configuration:nil
                                                           URL:persistentStoreURL
                                                       options:options
                                                         error:&persistentStoreError];
        
        if (persistentStoreError && completionBlock)
        {
            completionBlock(persistentStoreError);
        }
        else
        {
            NSManagedObjectContext *privateQueueManagedObjectContext = [[NSManagedObjectContext alloc]
                                                                        initWithConcurrencyType:NSPrivateQueueConcurrencyType];
            [privateQueueManagedObjectContext
             setPersistentStoreCoordinator:persistentStoreCoordinator];
            
            NSManagedObjectContext *mainQueueManagedObjectContext = [[NSManagedObjectContext alloc]
                                                                     initWithConcurrencyType:NSMainQueueConcurrencyType];
            [mainQueueManagedObjectContext
             setPersistentStoreCoordinator:persistentStoreCoordinator];
            
            _privateQueueManagedObjectContext = privateQueueManagedObjectContext;
            _mainQueueManagedObjectContext = mainQueueManagedObjectContext;
            
            [[NSNotificationCenter defaultCenter]
             addObserver:self
             selector:@selector(privateQueueManagedObjectContextDidSaveNotificationHandler:)
             name:NSManagedObjectContextDidSaveNotification
             object:privateQueueManagedObjectContext];
            
            [[NSNotificationCenter defaultCenter]
             addObserver:self
             selector:@selector(mainQueueManagedObjectContextDidSaveNotificationHandler:)
             name:NSManagedObjectContextDidSaveNotification
             object:mainQueueManagedObjectContext];
            
            if (completionBlock)
            {
                completionBlock(nil);
            }
        }
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - public methods

- (NSManagedObjectContext *)privateQueueManagedObjectContext
{
    return _privateQueueManagedObjectContext;
}

- (NSManagedObjectContext *)mainQueueManagedObjectContext
{
    return _mainQueueManagedObjectContext;
}

- (NSManagedObjectContext *)queueManagedObjectContextWithPrivateContext:(BOOL)privateContext
{
    NSManagedObjectContext *queueManagedObjectContext = (privateContext)?(_privateQueueManagedObjectContext):(_mainQueueManagedObjectContext);
    
    return queueManagedObjectContext;
}

- (void)persistBackgroundManagedObjectContextWithCompletionBlock:(void (^)(NSError *saveError))completionBlock
{
    if ([_privateQueueManagedObjectContext hasChanges])
    {
        NSError *saveError = nil;
        [_privateQueueManagedObjectContext save:&saveError];
        
        if (completionBlock)
        {
            completionBlock(saveError);
        }
    }
    else
    {
        if (completionBlock)
        {
            completionBlock(nil);
        }
    }
}

- (void)persistMainManagedObjectContextWithCompletionBlock:(void (^)(NSError *saveError))completionBlock
{
    if ([_mainQueueManagedObjectContext hasChanges])
    {
        NSError *saveError = nil;
        [_mainQueueManagedObjectContext save:&saveError];
        
        if (completionBlock)
        {
            completionBlock(saveError);
        }
    }
    else
    {
        if (completionBlock)
        {
            completionBlock(nil);
        }
    }
}

- (void)persistManagedObjectContextsWithCompletionBlock:(void (^)(NSError *saveError))completionBlock
{
    NSError *saveError = nil;
    [_privateQueueManagedObjectContext save:&saveError];
    
    if (saveError && completionBlock)
    {
        completionBlock(saveError);
    }
    else
    {
        [_mainQueueManagedObjectContext save:&saveError];
        
        if (completionBlock)
        {
            completionBlock(saveError);
        }
    }
}

- (void)releaseManagedObjectContexts
{
    _privateQueueManagedObjectContext = nil;
    _mainQueueManagedObjectContext = nil;
}

#pragma mark - private methods

- (void)privateQueueManagedObjectContextDidSaveNotificationHandler:(NSNotification *)notification
{
    @synchronized ([Model class])
    {
        [_mainQueueManagedObjectContext performBlock:^
         {
             [self->_mainQueueManagedObjectContext mergeChangesFromContextDidSaveNotification:notification];
         }];
    }
}

- (void)mainQueueManagedObjectContextDidSaveNotificationHandler:(NSNotification *)notification
{
    @synchronized ([Model class])
    {
        [_privateQueueManagedObjectContext performBlock:^
         {
             [self->_privateQueueManagedObjectContext mergeChangesFromContextDidSaveNotification:notification];
         }];
    }
}

- (NSString *)dataModelName
{
    return _dataModelName;
}

- (NSString *)dataModelExtension
{
    return _dataModelExtension;
}

- (NSString *)persistentStoreName
{
    return _persistentStoreName;
}

@end
