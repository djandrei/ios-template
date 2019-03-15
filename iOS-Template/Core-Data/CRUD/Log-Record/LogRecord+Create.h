//
//  LogRecord+Create.h
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

#import "LogRecord+CoreDataClass.h"

#import "AppModel.h"
#import "CRUD+Parameters.h"
#import "LogRecord+Headers.h"

NS_ASSUME_NONNULL_BEGIN

@interface LogRecord (Create)

+ (void)createLogRecordWithLogLevel:(NSInteger)logLevel
              andWithLogLevelString:(NSString *)logLevelString
                 andWithLogCategory:(NSString *)logCategory
                  andWithLogMessage:(NSString *)logMessage
                     andWithLogData:(NSString *)logData
                    andWithDeviceId:(NSString *)deviceId
                    andWithUsername:(NSString *)username
                  onBackgroundQueue:(BOOL)useBackgroundQueue
                  andPersistContext:(BOOL)persistContext
                withCompletionBlock:(void (^ _Nullable)(LogRecord *logRecord, NSError *createError))completionBlock;

@end

NS_ASSUME_NONNULL_END
