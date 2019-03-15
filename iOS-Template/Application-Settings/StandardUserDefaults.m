//
//  StandardUserDefaults.m
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

#import "StandardUserDefaults.h"

#define BOOLEAN_STRING_YES @"YES"
#define BOOLEAN_STRING_NO @"NO"

#define USER_DEFAULTS_APPLICATION_RUNS_FOR_FIRST_TIME_KEY @"ios-template.application-runs-for-first-time"
#define USER_DEFAULTS_INTRO_WAS_DISPLAYED_KEY @"ios-template.intro-was-displayed"

#define USER_DEFAULTS_BACKEND_ENABLED_KEY @"ios-template.backend-enabled"
#define USER_DEFAULTS_BACKEND_IDENTITY_TOKEN_KEY @"ios-template.backend-identity-token"
#define USER_DEFAULTS_BACKEND_USERNAME_KEY @"ios-template.backend-username"

#define USER_DEFAULTS_DEVICE_ID_KEY @"ios-template.device-id"
#define USER_DEFAULTS_DEVICE_NAME_KEY @"ios-template.device-name"
#define USER_DEFAULTS_DEVICE_MODEL_KEY @"ios-template.device-model"
#define USER_DEFAULTS_SYSTEM_NAME_KEY @"ios-template.system-name"
#define USER_DEFAULTS_SYSTEM_VERSION_KEY @"ios-template.system-version"
#define USER_DEFAULTS_DEVICE_DESCRIPTION_KEY @"ios-template.device-description"

#define USER_DEFAULTS_LAST_SYNCHRONIZED_TIMESTAMP_KEY @"ios-template.last-synchronized-timestamp"
#define USER_DEFAULTS_SYNC_INTERVAL_SECONDS_KEY @"ios-template.sync-interval-seconds"

#define USER_DEFAULTS_LOG_LEVEL_KEY @"ios-template.log-level"
#define USER_DEFAULTS_LOG_LOCAL_STORAGE_ENABLED_KEY @"ios-template.log-local-storage-enabled"
#define USER_DEFAULTS_LOG_SIZE_DAYS_KEY @"ios-template.log-size-days"

#define USER_DEFAULTS_XXX_KEY @"ios-template."

@implementation StandardUserDefaults

#pragma mark - application runs for the first time ------

+ (BOOL)getApplicationRunsForFirstTimeWithDefaultValue:(BOOL)defaultValue
{
    BOOL applicationRunsForFirstTime = defaultValue;
    
    NSString *stringValue = [[NSUserDefaults standardUserDefaults]
                             stringForKey:USER_DEFAULTS_APPLICATION_RUNS_FOR_FIRST_TIME_KEY];
    if (stringValue)
    {
        applicationRunsForFirstTime = [stringValue isEqualToString:BOOLEAN_STRING_YES];
    }
    
    return applicationRunsForFirstTime;
}

+ (void)setApplicationRunsForFirstTime:(BOOL)applicationRunsForFirstTime
{
    [[NSUserDefaults standardUserDefaults]
     setObject:(applicationRunsForFirstTime)?(BOOLEAN_STRING_YES):(BOOLEAN_STRING_NO)
     forKey:USER_DEFAULTS_APPLICATION_RUNS_FOR_FIRST_TIME_KEY];
}

+ (void)nukeApplicationRunsForFirstTime
{
    [[NSUserDefaults standardUserDefaults]
     removeObjectForKey:USER_DEFAULTS_APPLICATION_RUNS_FOR_FIRST_TIME_KEY];
}

#pragma mark - intro was displayed

+ (BOOL)getIntroWasDisplayedWithDefaultValue:(BOOL)defaultValue
{
    BOOL introWasDisplayed = defaultValue;
    
    NSString *stringValue = [[NSUserDefaults standardUserDefaults]
                             stringForKey:USER_DEFAULTS_INTRO_WAS_DISPLAYED_KEY];
    if (stringValue)
    {
        introWasDisplayed = [stringValue isEqualToString:BOOLEAN_STRING_YES];
    }
    
    return introWasDisplayed;
}

+ (void)setIntroWasDisplayed:(BOOL)introWasDisplayed
{
    [[NSUserDefaults standardUserDefaults]
     setObject:(introWasDisplayed)?(BOOLEAN_STRING_YES):(BOOLEAN_STRING_NO)
     forKey:USER_DEFAULTS_INTRO_WAS_DISPLAYED_KEY];
}

+ (void)nukeIntroWasDisplayed
{
    [[NSUserDefaults standardUserDefaults]
     removeObjectForKey:USER_DEFAULTS_INTRO_WAS_DISPLAYED_KEY];
}

#pragma mark - backend enabled ------

+ (BOOL)getBackendEnabledWithDefaultValue:(BOOL)defaultValue
{
    BOOL backendEnabled = defaultValue;
    
    NSString *stringValue = [[NSUserDefaults standardUserDefaults]
                             stringForKey:USER_DEFAULTS_BACKEND_ENABLED_KEY];
    if (stringValue)
    {
        backendEnabled = [stringValue isEqualToString:BOOLEAN_STRING_YES];
    }
    
    return backendEnabled;
}

+ (void)setBackendEnabled:(BOOL)backendEnabled
{
    [[NSUserDefaults standardUserDefaults]
     setObject:(backendEnabled)?(BOOLEAN_STRING_YES):(BOOLEAN_STRING_NO)
     forKey:USER_DEFAULTS_BACKEND_ENABLED_KEY];
}

+ (void)nukeBackendEnabled
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEFAULTS_BACKEND_ENABLED_KEY];
}

#pragma mark - backend identity token

+ (id)getBackendIdentityTokenWithDefaultValue:(id)defaultValue
{
    id backendIdentityToken = defaultValue;
    
    NSData *storedValue = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_BACKEND_IDENTITY_TOKEN_KEY];
    if (storedValue)
    {
        backendIdentityToken = [NSKeyedUnarchiver unarchiveObjectWithData:storedValue];
    }
    
    return backendIdentityToken;
}

+ (void)setBackendIdentityToken:(id)backendIdentityToken
{
    NSData *backendIdentityTokenData = [NSKeyedArchiver archivedDataWithRootObject:backendIdentityToken];
    
    [[NSUserDefaults standardUserDefaults]
     setObject:backendIdentityTokenData
     forKey:USER_DEFAULTS_BACKEND_IDENTITY_TOKEN_KEY];
}

+ (void)nukeBackendIdentityToken
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEFAULTS_BACKEND_IDENTITY_TOKEN_KEY];
}

#pragma mark - backend username

+ (NSString *)getBackendUsernameWithDefaultValue:(NSString *)defaultValue
{
    NSString *backendUsername = defaultValue;
    
    NSString *storedValue = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_BACKEND_USERNAME_KEY];
    if (storedValue)
    {
        backendUsername = storedValue;
    }
    
    return backendUsername;
}

+ (void)setBackendUsername:(NSString *)backendUsername
{
    [[NSUserDefaults standardUserDefaults]
     setObject:backendUsername
     forKey:USER_DEFAULTS_BACKEND_USERNAME_KEY];
}

+ (void)nukeBackendUsername
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEFAULTS_BACKEND_USERNAME_KEY];
}

#pragma mark - device ID ------

+ (NSString *)getDeviceIdWithDefaultValue:(NSString *)defaultValue
{
    NSString *deviceId = defaultValue;
    
    NSString *storedValue = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_DEVICE_ID_KEY];
    if (storedValue)
    {
        deviceId = storedValue;
    }
    
    return deviceId;
}

+ (void)setDeviceId:(NSString *)deviceId
{
    [[NSUserDefaults standardUserDefaults]
     setObject:deviceId
     forKey:USER_DEFAULTS_DEVICE_ID_KEY];
}

+ (void)nukeDeviceId
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEFAULTS_DEVICE_ID_KEY];
}

#pragma mark - device name

+ (NSString *)getDeviceNameWithDefaultValue:(NSString *)defaultValue
{
    NSString *deviceName = defaultValue;
    
    NSString *storedValue = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_DEVICE_NAME_KEY];
    if (storedValue)
    {
        deviceName = storedValue;
    }
    
    return deviceName;
}

+ (void)setDeviceName:(NSString *)deviceName
{
    [[NSUserDefaults standardUserDefaults]
     setObject:deviceName
     forKey:USER_DEFAULTS_DEVICE_NAME_KEY];
}

+ (void)nukeDeviceName
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEFAULTS_DEVICE_NAME_KEY];
}

#pragma mark - device model

+ (NSString *)getDeviceModelWithDefaultValue:(NSString *)defaultValue
{
    NSString *deviceModel = defaultValue;
    
    NSString *storedValue = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_DEVICE_MODEL_KEY];
    if (storedValue)
    {
        deviceModel = storedValue;
    }
    
    return deviceModel;
}

+ (void)setDeviceModel:(NSString *)deviceModel
{
    [[NSUserDefaults standardUserDefaults]
     setObject:deviceModel
     forKey:USER_DEFAULTS_DEVICE_MODEL_KEY];
}

+ (void)nukeDeviceModel
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEFAULTS_DEVICE_MODEL_KEY];
}

#pragma mark - system name

+ (NSString *)getSystemNameWithDefaultValue:(NSString *)defaultValue
{
    NSString *systemName = defaultValue;
    
    NSString *storedValue = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_SYSTEM_NAME_KEY];
    if (storedValue)
    {
        systemName = storedValue;
    }
    
    return systemName;
}

+ (void)setSystemName:(NSString *)systemName
{
    [[NSUserDefaults standardUserDefaults]
     setObject:systemName
     forKey:USER_DEFAULTS_SYSTEM_NAME_KEY];
}

+ (void)nukeSystemName
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEFAULTS_SYSTEM_NAME_KEY];
}

#pragma mark - system version

+ (NSString *)getSystemVersionWithDefaultValue:(NSString *)defaultValue
{
    NSString *systemVersion = defaultValue;
    
    NSString *storedValue = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_SYSTEM_VERSION_KEY];
    if (storedValue)
    {
        systemVersion = storedValue;
    }
    
    return systemVersion;
}

+ (void)setSystemVersion:(NSString *)systemVersion
{
    [[NSUserDefaults standardUserDefaults]
     setObject:systemVersion
     forKey:USER_DEFAULTS_SYSTEM_VERSION_KEY];
}

+ (void)nukeSystemVersion
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEFAULTS_SYSTEM_VERSION_KEY];
}

#pragma mark - device description

+ (NSString *)getDeviceDescriptionWithDefaultValue:(NSString *)defaultValue
{
    NSString *deviceDescription = defaultValue;
    
    NSString *storedValue = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_DEVICE_DESCRIPTION_KEY];
    if (storedValue)
    {
        deviceDescription = storedValue;
    }
    
    return deviceDescription;
}

+ (void)setDeviceDescription:(NSString *)deviceDescription
{
    [[NSUserDefaults standardUserDefaults]
     setObject:deviceDescription
     forKey:USER_DEFAULTS_DEVICE_DESCRIPTION_KEY];
}

+ (void)nukeDeviceDescription
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEFAULTS_DEVICE_DESCRIPTION_KEY];
}

#pragma mark - last synchronized timestamp ------

+ (NSDate *)getLastSynchronizedTimestampWithDefaultValue:(NSDate *)defaultValue
{
    NSDate *lastSynchronizedTimestamp = defaultValue;
    
    NSDate *storedValue = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_LAST_SYNCHRONIZED_TIMESTAMP_KEY];
    if (storedValue)
    {
        lastSynchronizedTimestamp = storedValue;
    }
    
    return lastSynchronizedTimestamp;
}

+ (void)setLastSynchronizedTimestamp:(NSDate *)lastSynchronizedTimestamp
{
    [[NSUserDefaults standardUserDefaults]
     setObject:lastSynchronizedTimestamp
     forKey:USER_DEFAULTS_LAST_SYNCHRONIZED_TIMESTAMP_KEY];
}

+ (void)nukeLastSynchronizedTimestamp
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEFAULTS_LAST_SYNCHRONIZED_TIMESTAMP_KEY];
}

#pragma amrk - sync interval seconds

+ (NSUInteger)getSyncIntervalSecondsWithDefaultValue:(NSUInteger)defaultValue
{
    NSUInteger syncIntervalSeconds = defaultValue;
    
    NSNumber *numberValue = [[NSUserDefaults standardUserDefaults]
                             objectForKey:USER_DEFAULTS_SYNC_INTERVAL_SECONDS_KEY];
    if (numberValue)
    {
        syncIntervalSeconds = [numberValue unsignedIntegerValue];
    }
    
    return syncIntervalSeconds;
}

+ (void)setSyncIntervalSeconds:(NSUInteger)syncIntervalSeconds
{
    NSNumber *syncIntervalSecondsNumber = [NSNumber numberWithUnsignedInteger:syncIntervalSeconds];
    
    [[NSUserDefaults standardUserDefaults]
     setObject:syncIntervalSecondsNumber
     forKey:USER_DEFAULTS_SYNC_INTERVAL_SECONDS_KEY];
}

+ (void)nukeSyncInterval
{
    [[NSUserDefaults standardUserDefaults]
     removeObjectForKey:USER_DEFAULTS_SYNC_INTERVAL_SECONDS_KEY];
}

#pragma mark - logging parameters ------

+ (NSUInteger)getLogLevelWithDefaultValue:(NSUInteger)defaultValue
{
    NSUInteger logLevel = defaultValue;
    
    NSNumber *numberValue = [[NSUserDefaults standardUserDefaults]
                             objectForKey:USER_DEFAULTS_LOG_LEVEL_KEY];
    if (numberValue)
    {
        logLevel = [numberValue unsignedIntegerValue];
    }
    
    return logLevel;
}

+ (void)setLogLevel:(NSUInteger)logLevel
{
    NSNumber *logLevelNumber = [NSNumber numberWithUnsignedInteger:logLevel];
    
    [[NSUserDefaults standardUserDefaults]
     setObject:logLevelNumber
     forKey:USER_DEFAULTS_LOG_LEVEL_KEY];
}

+ (void)nukeLogLevel
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEFAULTS_LOG_LEVEL_KEY];
}

+ (BOOL)getLogToLocalStorageEnabledWithDefaultValue:(BOOL)defaultValue
{
    BOOL logToLocalStorageEnabled = defaultValue;
    
    NSString *stringValue = [[NSUserDefaults standardUserDefaults]
                             stringForKey:USER_DEFAULTS_LOG_LOCAL_STORAGE_ENABLED_KEY];
    if (stringValue)
    {
        logToLocalStorageEnabled = [stringValue isEqualToString:BOOLEAN_STRING_YES];
    }
    
    return logToLocalStorageEnabled;
}

+ (void)setLogToLocalStorageEnabled:(BOOL)logToLocalStorageEnabled
{
    [[NSUserDefaults standardUserDefaults]
     setObject:(logToLocalStorageEnabled)?(BOOLEAN_STRING_YES):(BOOLEAN_STRING_NO)
     forKey:USER_DEFAULTS_LOG_LOCAL_STORAGE_ENABLED_KEY];
}

+ (void)nukeLogToLocalStorageEnabled
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEFAULTS_LOG_LOCAL_STORAGE_ENABLED_KEY];
}

+ (NSUInteger)getLogSizeDaysWithDefaultValue:(NSUInteger)defaultValue
{
    NSUInteger logSizeDays = defaultValue;
    
    NSNumber *numberValue = [[NSUserDefaults standardUserDefaults]
                             objectForKey:USER_DEFAULTS_LOG_SIZE_DAYS_KEY];
    if (numberValue)
    {
        logSizeDays = [numberValue unsignedIntegerValue];
    }
    
    return logSizeDays;
}

+ (void)setLogSizeDays:(NSUInteger)logSizeDays
{
    NSNumber *logSizeDaysNumber = [NSNumber numberWithUnsignedInteger:logSizeDays];
    
    [[NSUserDefaults standardUserDefaults]
     setObject:logSizeDaysNumber
     forKey:USER_DEFAULTS_LOG_SIZE_DAYS_KEY];
}

+ (void)nukeLogSizeDays
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEFAULTS_LOG_SIZE_DAYS_KEY];
}

+ (void)nukeLogParameters
{
    [StandardUserDefaults nukeLogLevel];
    [StandardUserDefaults nukeLogToLocalStorageEnabled];
    [StandardUserDefaults nukeLogSizeDays];
}

#pragma mark - nuke methods ------

+ (void)nukeBackendParameters
{
    [StandardUserDefaults nukeBackendEnabled];
    [StandardUserDefaults nukeBackendIdentityToken];
    [StandardUserDefaults nukeBackendUsername];
    
}

+ (void)nukeDeviceParameters
{
    [StandardUserDefaults nukeDeviceId];
    [StandardUserDefaults nukeDeviceName];
    [StandardUserDefaults nukeDeviceModel];
    [StandardUserDefaults nukeSystemName];
    [StandardUserDefaults nukeSystemVersion];
    [StandardUserDefaults nukeDeviceDescription];
    
}

+ (void)nukeSynchronizationParameters
{
    [StandardUserDefaults nukeLastSynchronizedTimestamp];
    [StandardUserDefaults nukeSyncInterval];
    
}

+ (void)nukeAllParameters
{
    [StandardUserDefaults nukeApplicationRunsForFirstTime];
    
    [StandardUserDefaults nukeBackendEnabled];
    [StandardUserDefaults nukeBackendIdentityToken];
    [StandardUserDefaults nukeBackendUsername];
    
    [StandardUserDefaults nukeDeviceId];
    [StandardUserDefaults nukeDeviceName];
    [StandardUserDefaults nukeDeviceModel];
    [StandardUserDefaults nukeSystemName];
    [StandardUserDefaults nukeSystemVersion];
    [StandardUserDefaults nukeDeviceDescription];
    
    [StandardUserDefaults nukeLastSynchronizedTimestamp];
    [StandardUserDefaults nukeSyncInterval];
}

@end
