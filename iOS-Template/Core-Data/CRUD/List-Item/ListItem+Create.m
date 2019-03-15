//
//  ListItem+Create.m
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

#import "ListItem+Create.h"

@implementation ListItem (Create)

+ (void)createListItemWithTitle:(NSString *)listItemTitle
                andWithSubtitle:(NSString *)listItemSubtitle
                 andWithDetails:(NSString *)listItemDetails
                   andWithImage:(NSData *)listItemImage
              onBackgroundQueue:(BOOL)useBackgroundQueue
              andPersistContext:(BOOL)persistContext
            withCompletionBlock:(void (^ _Nullable)(ListItem *listItem, NSError *createError))completionBlock
{
    AppModel *appModel = [AppModel sharedInstance];
    
    NSManagedObjectContext *managedObjectContext = [appModel queueManagedObjectContextWithPrivateContext:useBackgroundQueue];
    
    [managedObjectContext performBlock:^
     {
         ListItem *listItem = [NSEntityDescription
                               insertNewObjectForEntityForName:LIST_ITEM_ENTITY_NAME
                               inManagedObjectContext:managedObjectContext];
         
         NSDate *now = [NSDate dateWithTimeIntervalSinceNow:0];
         
         [listItem setBackendId:BACKEND_ID_DEFAULT_VALUE];
         [listItem setSynchronizationId:SYNCHRONIZATION_ID_DEFAULT_VALUE];
         [listItem setCreatedTimestamp:now];
         [listItem setLastModifiedTimestamp:now];
         
         [listItem setTitle:listItemTitle];
         [listItem setSubtitle:listItemSubtitle];
         [listItem setDetails:listItemDetails];
         [listItem setImage:listItemImage];
         
         if (!persistContext)
         {
             completionBlock(listItem, nil);
         }
         else
         {
             NSError *saveError;
             BOOL savedChange = [managedObjectContext save:&saveError];
             
             if (!savedChange)
             {
                 if (completionBlock)
                 {
                     completionBlock(nil, saveError);
                 }
             }
             else
             {
                 if (completionBlock)
                 {
                     completionBlock(listItem, nil);
                 }
             }
         }
     }];
}

@end
