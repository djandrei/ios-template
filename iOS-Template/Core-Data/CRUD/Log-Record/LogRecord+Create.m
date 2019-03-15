//
//  LogRecord+Create.m
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

#import "LogRecord+Create.h"

@implementation LogRecord (Create)

+ (void)createLogRecordWithLogLevel:(NSInteger)logLevel
              andWithLogLevelString:(NSString *)logLevelString
                 andWithLogCategory:(NSString *)logCategory
                  andWithLogMessage:(NSString *)logMessage
                     andWithLogData:(NSString *)logData
                    andWithDeviceId:(NSString *)deviceId
                    andWithUsername:(NSString *)username
                  onBackgroundQueue:(BOOL)useBackgroundQueue
                  andPersistContext:(BOOL)persistContext
                withCompletionBlock:(void (^ _Nullable)(LogRecord *logRecord, NSError *createError))completionBlock
{
    AppModel *appModel = [AppModel sharedInstance];
    
    NSManagedObjectContext *managedObjectContext = [appModel queueManagedObjectContextWithPrivateContext:useBackgroundQueue];
    
    [managedObjectContext performBlock:^
     {
         LogRecord *logRecord = [NSEntityDescription
                                 insertNewObjectForEntityForName:LOG_RECORD_ENTITY_NAME
                                 inManagedObjectContext:managedObjectContext];
         
         NSDate *now = [NSDate dateWithTimeIntervalSinceNow:0];
         
         [logRecord setBackendId:BACKEND_ID_DEFAULT_VALUE];
         [logRecord setSynchronizationId:SYNCHRONIZATION_ID_DEFAULT_VALUE];
         [logRecord setCreatedTimestamp:now];
         [logRecord setLastModifiedTimestamp:now];
         
         [logRecord setUsername:username];
         [logRecord setDeviceId:deviceId];
         [logRecord setLogCategory:logCategory];
         [logRecord setLogData:logData];
         [logRecord setLogLevelInteger:(int)logLevel];
         [logRecord setLogLevelString:logLevelString];
         [logRecord setLogMessage:logMessage];
         
         if (!persistContext)
         {
             completionBlock(logRecord, nil);
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
                     completionBlock(logRecord, nil);
                 }
             }
         }
     }];
}

@end
