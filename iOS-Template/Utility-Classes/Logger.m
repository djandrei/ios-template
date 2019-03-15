//
//  Logger.m
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

#import "Logger.h"

static NSUInteger logLevelEmergencyValue = 0;
static NSUInteger logLevelAlertValue = 1;
static NSUInteger logLevelCriticalValue = 2;
static NSUInteger logLevelErrorValue = 3;
static NSUInteger logLevelWarningValue = 4;
static NSUInteger logLevelNoticeValue = 5;
static NSUInteger logLevelInfoValue = 6;
static NSUInteger logLevelDebugValue = 7;

static NSString *logLevelEmergencyString = @"LOG_LEVEL_EMERGENCY";
static NSString *logLevelAlertString = @"LOG_LEVEL_ALERT";
static NSString *logLevelCriticalString = @"LOG_LEVEL_CRITICAL";
static NSString *logLevelErrorString = @"LOG_LEVEL_ERROR";
static NSString *logLevelWarningString = @"LOG_LEVEL_WARNING";
static NSString *logLevelNoticeString = @"LOG_LEVEL_NOTICE";
static NSString *logLevelInfoString = @"LOG_LEVEL_INFO";
static NSString *logLevelDebugString = @"LOG_LEVEL_DEBUG";

@implementation Logger

#pragma mark - Log level values

+ (NSUInteger)logLevelEmergency
{
    return logLevelEmergencyValue;
}

+ (NSUInteger)logLevelAlert
{
    return logLevelAlertValue;
}

+ (NSUInteger)logLevelCritical
{
    return logLevelCriticalValue;
}

+ (NSUInteger)logLevelError
{
    return logLevelErrorValue;
}

+ (NSUInteger)logLevelWarning
{
    return logLevelWarningValue;
}

+ (NSUInteger)logLevelNotice
{
    return logLevelNoticeValue;
}

+ (NSUInteger)logLevelInfo
{
    return logLevelInfoValue;
}

+ (NSUInteger)logLevelDebug
{
    return logLevelDebugValue;
}

#pragma mark - Log level strings

+ (NSString *)logLevelEmergencyString
{
    return logLevelEmergencyString;
}

+ (NSString *)logLevelAlertString
{
    return logLevelAlertString;
}

+ (NSString *)logLevelCriticalString
{
    return logLevelCriticalString;
}

+ (NSString *)logLevelErrorString
{
    return logLevelErrorString;
}

+ (NSString *)logLevelWarningString
{
    return logLevelWarningString;
}

+ (NSString *)logLevelNoticeString
{
    return logLevelNoticeString;
}

+ (NSString *)logLevelInfoString
{
    return logLevelInfoString;
}

+ (NSString *)logLevelDebugString
{
    return logLevelDebugString;
}

#pragma mark - NSError serialization.

+ (NSString *)serializeError:(NSError *)error
{
    NSMutableString *errorInfo = [[NSMutableString alloc] init];
    
    [errorInfo appendFormat:@"domain: %@\n", [error domain]];
    [errorInfo appendFormat:@"code: %ld\n", (long)[error code]];
    for (NSString *userInfoKey in [[error userInfo] allKeys])
    {
        [errorInfo appendFormat:@"%@: %@\n", userInfoKey, [[error userInfo] objectForKey:userInfoKey]];
    }
    
    return errorInfo;
}

#pragma mark - Core logging method.

+ (NSString *)logLevelStringForLogLevel:(NSUInteger)logRecordLevel
{
    NSString *logRecordLevelString = @"LOG_LEVEL_UNDEFINED";
    
    if (logLevelEmergencyValue == logRecordLevel)
    {
        logRecordLevelString = logLevelEmergencyString;
    }
    else if (logLevelAlertValue == logRecordLevel)
    {
        logRecordLevelString = logLevelAlertString;
    }
    else if (logLevelCriticalValue == logRecordLevel)
    {
        logRecordLevelString = logLevelCriticalString;
    }
    else if (logLevelErrorValue == logRecordLevel)
    {
        logRecordLevelString = logLevelErrorString;
    }
    else if (logLevelWarningValue == logRecordLevel)
    {
        logRecordLevelString = logLevelWarningString;
    }
    else if (logLevelNoticeValue == logRecordLevel)
    {
        logRecordLevelString = logLevelNoticeString;
    }
    else if (logLevelInfoValue == logRecordLevel)
    {
        logRecordLevelString = logLevelInfoString;
    }
    else if (logLevelDebugValue == logRecordLevel)
    {
        logRecordLevelString = logLevelDebugString;
    }
    
    return logRecordLevelString;
}

+ (void)logWithLogLevel:(NSUInteger)logRecordLevel withCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message
{
    BOOL loggingIsEnabled = [AppSettings loggingIsEnabled];
    NSUInteger logLevel = [StandardUserDefaults getLogLevelWithDefaultValue:[AppSettings logLevel]];
    BOOL loggingToConsoleIsEnabled = [AppSettings loggingToConsoleIsEnabled];
    BOOL loggingToPersistentStoreIsEnabled = [StandardUserDefaults
                                              getLogToLocalStorageEnabledWithDefaultValue:[AppSettings loggingToPersistentStoreIsEnabled]];
    
    if (loggingIsEnabled && logLevel >= logRecordLevel)
    {
        NSString *logRecordLevelString = NSLocalizedString([Logger logLevelStringForLogLevel:logRecordLevel], nil);
        
        NSString *serializedError = nil;
        if (nil != error)
        {
            serializedError = [Logger serializeError:error];
        }
        
        if(loggingToConsoleIsEnabled)
        {
            NSMutableString *nsLogMessage = [[NSMutableString alloc] init];
            [nsLogMessage appendFormat:@"\n[Log level] %@", logRecordLevelString];
            [nsLogMessage appendFormat:@"\n[Log category] %@", category];
            if (nil != message)
            {
                [nsLogMessage appendFormat:@"\n[Message] %@", message];
            }
            if (nil != serializedError)
            {
                [nsLogMessage appendFormat:@"\n[Error] %@", serializedError];
            }
            
            NSLog(@"%@", nsLogMessage);
        }
        
        if (loggingToPersistentStoreIsEnabled)
        {
            if (!category)
            {
                category = @"-";
            }
            
            if (!message)
            {
                message = @"-";
            }
            
            if (!serializedError)
            {
                serializedError = @"-";
            }
            
            [LogRecord
             createLogRecordWithLogLevel:logRecordLevel
             andWithLogLevelString:logRecordLevelString
             andWithLogCategory:category
             andWithLogMessage:message
             andWithLogData:serializedError
             andWithDeviceId:[StandardUserDefaults getDeviceIdWithDefaultValue:@"-"]
             andWithUsername:[StandardUserDefaults getBackendUsernameWithDefaultValue:@"-"]
             onBackgroundQueue:YES
             andPersistContext:YES
             withCompletionBlock:nil];
            
        }
        
    }
}

#pragma mark - Log level logging methods.

+ (void)logEmergencyMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelEmergency] withCategory:category withError:error withMessage:message];
}
+ (void)logEmergencyMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelEmergency] withCategory:category withError:error withMessage:message];
}
+ (void)logEmergencyMessageWithCategory:(NSString *)category withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelEmergency] withCategory:category withError:nil withMessage:message];
}
+ (void)logEmergencyMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelEmergency] withCategory:category withError:nil withMessage:message];
}

+ (void)logAlertMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelAlert] withCategory:category withError:error withMessage:message];
}
+ (void)logAlertMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelAlert] withCategory:category withError:error withMessage:message];
}
+ (void)logAlertMessageWithCategory:(NSString *)category withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelAlert] withCategory:category withError:nil withMessage:message];
}
+ (void)logAlertMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelAlert] withCategory:category withError:nil withMessage:message];
}

+ (void)logCriticalMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelCritical] withCategory:category withError:error withMessage:message];
}
+ (void)logCriticalMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelCritical] withCategory:category withError:error withMessage:message];
}
+ (void)logCriticalMessageWithCategory:(NSString *)category withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelCritical] withCategory:category withError:nil withMessage:message];
}
+ (void)logCriticalMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelCritical] withCategory:category withError:nil withMessage:message];
}

+ (void)logErrorMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelError] withCategory:category withError:error withMessage:message];
}
+ (void)logErrorMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelError] withCategory:category withError:error withMessage:message];
}
+ (void)logErrorMessageWithCategory:(NSString *)category withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelError] withCategory:category withError:nil withMessage:message];
}
+ (void)logErrorMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelError] withCategory:category withError:nil withMessage:message];
}

+ (void)logWarningMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelWarning] withCategory:category withError:error withMessage:message];
}
+ (void)logWarningMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelWarning] withCategory:category withError:error withMessage:message];
}
+ (void)logWarningMessageWithCategory:(NSString *)category withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelWarning] withCategory:category withError:nil withMessage:message];
}
+ (void)logWarningMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelWarning] withCategory:category withError:nil withMessage:message];
}

+ (void)logNoticeMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelNotice] withCategory:category withError:error withMessage:message];
}
+ (void)logNoticeMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelNotice] withCategory:category withError:error withMessage:message];
}
+ (void)logNoticeMessageWithCategory:(NSString *)category withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelNotice] withCategory:category withError:nil withMessage:message];
}
+ (void)logNoticeMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelNotice] withCategory:category withError:nil withMessage:message];
}

+ (void)logInfoMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelInfo] withCategory:category withError:error withMessage:message];
}
+ (void)logInfoMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelInfo] withCategory:category withError:error withMessage:message];
}
+ (void)logInfoMessageWithCategory:(NSString *)category withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelInfo] withCategory:category withError:nil withMessage:message];
}
+ (void)logInfoMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelInfo] withCategory:category withError:nil withMessage:message];
}

+ (void)logDebugMessageWithCategory:(NSString *)category withError:(NSError *)error withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelDebug] withCategory:category withError:error withMessage:message];
}
+ (void)logDebugMessageWithCategory:(NSString *)category withError:(NSError *)error withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelDebug] withCategory:category withError:error withMessage:message];
}
+ (void)logDebugMessageWithCategory:(NSString *)category withMessage:(NSString *)message
{
    [Logger logWithLogLevel:[Logger logLevelDebug] withCategory:category withError:nil withMessage:message];
}
+ (void)logDebugMessageWithCategory:(NSString *)category withFormat:(NSString *)format, ...
{
    NSString *message = nil;
    
    va_list args;
    va_start(args, format);
    message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [Logger logWithLogLevel:[Logger logLevelDebug] withCategory:category withError:nil withMessage:message];
}

@end
