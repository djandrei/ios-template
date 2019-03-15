//
//  ListItem+Delete.m
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

#import "ListItem+Delete.h"

@implementation ListItem (Delete)

+ (void)deleteListItem:(ListItem *)listItem
     onBackgroundQueue:(BOOL)useBackgroundQueue
     andPersistContext:(BOOL)persistContext
   withCompletionBlock:(void (^ _Nullable)(NSError *deleteError))completionBlock
{
    AppModel *appModel = [AppModel sharedInstance];
    
    NSManagedObjectContext *managedObjectContext = [appModel queueManagedObjectContextWithPrivateContext:useBackgroundQueue];
    
    [managedObjectContext performBlock:^
     {
         [managedObjectContext deleteObject:listItem];
         
         if (!persistContext)
         {
             completionBlock(nil);
         }
         else
         {
             NSError *saveError;
             BOOL savedChange = [managedObjectContext save:&saveError];
             
             if (!savedChange)
             {
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
     }];
}

@end
