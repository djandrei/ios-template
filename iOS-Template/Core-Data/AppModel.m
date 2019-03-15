//
//  AppModel.m
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

#import "AppModel.h"

static AppModel *_instance = nil;

@implementation AppModel

#pragma mark - public methods

+ (AppModel *)sharedInstance
{
    @synchronized([AppModel class])
    {
        if (nil == _instance)
        {
            _instance = [[AppModel alloc]
                         initWithDataModelName:[AppSettings dataModelName]
                         withDataModelExtension:[AppSettings dataModelExtension]
                         withPersistentStoreName:[AppSettings persistentStoreName]
                         withCompletionBlock:^(NSError *initError)
                         {
                             if (initError)
                             {
                                 [Logger
                                  logCriticalMessageWithCategory:@"AppModel"
                                  withError:initError
                                  withMessage:@"Failed to initialize AppModel shared instance."];
                             }
                         }];
        }
    }
    
    return _instance;
}

+ (BOOL)sharedInstanceExists
{
    BOOL instanceExists;
    @synchronized([AppModel class])
    {
        instanceExists = (nil != _instance);
    }
    
    return instanceExists;
}

+ (void)deleteSharedInstance
{
    @synchronized([AppModel class])
    {
        [_instance releaseManagedObjectContexts];
        _instance = nil;
    }
}

@end
