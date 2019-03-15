//
//  Logger.h
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

#import <Foundation/Foundation.h>

#import "AppSettings.h"
#import "LogRecord+Headers.h"
#import "StandardUserDefaults.h"

NS_ASSUME_NONNULL_BEGIN

@interface Logger : NSObject

+ (NSUInteger)logLevelEmergency;
+ (NSUInteger)logLevelAlert;
+ (NSUInteger)logLevelCritical;
+ (NSUInteger)logLevelError;
+ (NSUInteger)logLevelWarning;
+ (NSUInteger)logLevelNotice;
+ (NSUInteger)logLevelInfo;
+ (NSUInteger)logLevelDebug;

+ (NSString *)logLevelEmergencyString;
+ (NSString *)logLevelAlertString;
+ (NSString *)logLevelCriticalString;
+ (NSString *)logLevelErrorString;
+ (NSString *)logLevelWarningString;
+ (NSString *)logLevelNoticeString;
+ (NSString *)logLevelInfoString;
+ (NSString *)logLevelDebugString;

+ (NSString *)logLevelStringForLogLevel:(NSUInteger)logLevel;

+ (void)logEmergencyMessageWithCategory:(NSString *)category withMessage:(NSString *)message;
+ (void)logEmergencyMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...;
+ (void)logEmergencyMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message;
+ (void)logEmergencyMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...;

+ (void)logAlertMessageWithCategory:(NSString *)category withMessage:(NSString *)message;
+ (void)logAlertMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...;
+ (void)logAlertMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message;
+ (void)logAlertMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...;

+ (void)logCriticalMessageWithCategory:(NSString *)category withMessage:(NSString *)message;
+ (void)logCriticalMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...;
+ (void)logCriticalMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message;
+ (void)logCriticalMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...;

+ (void)logErrorMessageWithCategory:(NSString *)category withMessage:(NSString *)message;
+ (void)logErrorMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...;
+ (void)logErrorMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message;
+ (void)logErrorMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...;

+ (void)logWarningMessageWithCategory:(NSString *)category withMessage:(NSString *)message;
+ (void)logWarningMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...;
+ (void)logWarningMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message;
+ (void)logWarningMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...;

+ (void)logNoticeMessageWithCategory:(NSString *)category withMessage:(NSString *)message;
+ (void)logNoticeMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...;
+ (void)logNoticeMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message;
+ (void)logNoticeMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...;

+ (void)logInfoMessageWithCategory:(NSString *)category withMessage:(NSString *)message;
+ (void)logInfoMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...;
+ (void)logInfoMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message;
+ (void)logInfoMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...;

+ (void)logDebugMessageWithCategory:(NSString *)category withMessage:(NSString *)message;
+ (void)logDebugMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...;
+ (void)logDebugMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message;
+ (void)logDebugMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...;

@end

NS_ASSUME_NONNULL_END
