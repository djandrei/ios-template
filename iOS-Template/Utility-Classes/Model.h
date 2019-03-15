//
//  Model.h
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

#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>

#import "AppSettings.h"

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject
{
    NSString *_dataModelName;
    NSString *_dataModelExtension;
    NSString *_persistentStoreName;
    
    NSManagedObjectContext *_privateQueueManagedObjectContext;
    NSManagedObjectContext *_mainQueueManagedObjectContext;
}

- (id) init __attribute__((unavailable("Must use initWithDataModelName:(NSString *)withDataModelExtension:(NSString *)withPersistentStoreName:(NSString *)withCompletionBlock:(void (^)(NSError *)); instead.")));
- (id) initWithDataModelName:(NSString *)dataModelName
      withDataModelExtension:(NSString *)dataModelExtension
     withPersistentStoreName:(NSString *)persistentStoreName
         withCompletionBlock:(void (^)(NSError *initError))completionBlock;

- (NSString *)dataModelName;
- (NSString *)dataModelExtension;
- (NSString *)persistentStoreName;

- (NSManagedObjectContext *)privateQueueManagedObjectContext;
- (NSManagedObjectContext *)mainQueueManagedObjectContext;
- (NSManagedObjectContext *)queueManagedObjectContextWithPrivateContext:(BOOL)privateContext;

- (void)persistBackgroundManagedObjectContextWithCompletionBlock:(void (^)(NSError *saveError))completionBlock;
- (void)persistMainManagedObjectContextWithCompletionBlock:(void (^)(NSError *saveError))completionBlock;
- (void)persistManagedObjectContextsWithCompletionBlock:(void (^)(NSError *saveError))completionBlock;
- (void)releaseManagedObjectContexts;

@end

NS_ASSUME_NONNULL_END
