//
//  AppDelegate.m
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

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // store device id and description ///////////////////////////////////
    NSString *identifierForVendor = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    NSString *deviceName = [[UIDevice currentDevice] name];
    NSString *deviceModel = [[UIDevice currentDevice] model];
    NSString *systemName = [[UIDevice currentDevice] systemName];
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    
    [StandardUserDefaults setDeviceId:identifierForVendor];
    [StandardUserDefaults setDeviceName:deviceName];
    [StandardUserDefaults setDeviceModel:deviceModel];
    [StandardUserDefaults setSystemName:systemName];
    [StandardUserDefaults setSystemVersion:systemVersion];
    [StandardUserDefaults setDeviceDescription:[NSString stringWithFormat:@"%@; %@; %@ %@", deviceName, deviceModel, systemName, systemVersion]];

    // initialize application Singletons /////////////////////////////////
    [AppModel sharedInstance];
    [BackendAdapter sharedInstance];

    // tasks to be executed when the app runs for the first time /////////
    if ([StandardUserDefaults getApplicationRunsForFirstTimeWithDefaultValue:YES])
    {
        [DataGenerator generateTestData];

        [StandardUserDefaults setApplicationRunsForFirstTime:NO];
    }

    //////////////////////////////////////////////////////////////////////
    
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    [[self window] setBackgroundColor:[UIColor whiteColor]];
    [[self window] makeKeyAndVisible];
    [[self window] setRootViewController:[ListNavigationController controllerWithDefaultRootController]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain
    // types of temporary interruptions (such as an incoming phone call or SMS message) or when the user
    // quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks.
    // Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough
    // application state information to restore your application to its current state in case it is
    // terminated later.
    // If your application supports background execution, this method is called instead of
    // applicationWillTerminate: when the user quits.
    
    [[BackendAdapter sharedInstance] disableSynchronization];
    [[AppModel sharedInstance] persistManagedObjectContextsWithCompletionBlock:^(NSError *persistError)
     {
         if (persistError)
         {
             [Logger
              logCriticalMessageWithCategory:@"AppDelegate"
              withError:persistError
              withMessage:@"Failed to persist AppModel managed object contexts on applicationDidEnterBackground."];
         }
     }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the active state; here you can undo many of
    // the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the
    // application was previously in the background, optionally refresh the user interface.
    
    [[BackendAdapter sharedInstance] enableSynchronization];
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    
    [[BackendAdapter sharedInstance] disableSynchronization];
    [[AppModel sharedInstance] persistManagedObjectContextsWithCompletionBlock:^(NSError *persistError)
     {
         if (persistError)
         {
             [Logger
              logCriticalMessageWithCategory:@"AppDelegate"
              withError:persistError
              withMessage:@"Failed to persist AppModel managed object contexts on applicationWillTerminate."];
         }
     }];
}

@end
