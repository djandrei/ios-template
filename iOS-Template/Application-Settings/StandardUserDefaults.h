//
//  StandardUserDefaults.h
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

NS_ASSUME_NONNULL_BEGIN

@interface StandardUserDefaults : NSObject

#pragma mark - application runs for the first time ------

+ (BOOL)getApplicationRunsForFirstTimeWithDefaultValue:(BOOL)defaultValue;
+ (void)setApplicationRunsForFirstTime:(BOOL)applicationRunsForFirstTime;
+ (void)nukeApplicationRunsForFirstTime;

#pragma mark - intro was displayed

+ (BOOL)getIntroWasDisplayedWithDefaultValue:(BOOL)defaultValue;
+ (void)setIntroWasDisplayed:(BOOL)introWasDisplayed;
+ (void)nukeIntroWasDisplayed;

#pragma mark - backend enabled ------

+ (BOOL)getBackendEnabledWithDefaultValue:(BOOL)defaultValue;
+ (void)setBackendEnabled:(BOOL)backendEnabled;
+ (void)nukeBackendEnabled;

#pragma mark - backend identity token

+ (id)getBackendIdentityTokenWithDefaultValue:(id)defaultValue;
+ (void)setBackendIdentityToken:(id)backendIdentityToken;
+ (void)nukeBackendIdentityToken;

#pragma mark - backend username

+ (NSString *)getBackendUsernameWithDefaultValue:(NSString *)defaultValue;
+ (void)setBackendUsername:(NSString *)backendUsername;
+ (void)nukeBackendUsername;

#pragma mark - device ID ------

+ (NSString *)getDeviceIdWithDefaultValue:(NSString *)defaultValue;
+ (void)setDeviceId:(NSString *)deviceId;
+ (void)nukeDeviceId;

#pragma mark - device name

+ (NSString *)getDeviceNameWithDefaultValue:(NSString *)defaultValue;
+ (void)setDeviceName:(NSString *)deviceName;
+ (void)nukeDeviceName;

#pragma mark - device model

+ (NSString *)getDeviceModelWithDefaultValue:(NSString *)defaultValue;
+ (void)setDeviceModel:(NSString *)deviceModel;
+ (void)nukeDeviceModel;

#pragma mark - system name

+ (NSString *)getSystemNameWithDefaultValue:(NSString *)defaultValue;
+ (void)setSystemName:(NSString *)systemName;
+ (void)nukeSystemName;

#pragma mark - system version

+ (NSString *)getSystemVersionWithDefaultValue:(NSString *)defaultValue;
+ (void)setSystemVersion:(NSString *)systemVersion;
+ (void)nukeSystemVersion;

#pragma mark - device description

+ (NSString *)getDeviceDescriptionWithDefaultValue:(NSString *)defaultValue;
+ (void)setDeviceDescription:(NSString *)deviceDescription;
+ (void)nukeDeviceDescription;

#pragma mark - last synchronized timestamp ------

+ (NSDate *)getLastSynchronizedTimestampWithDefaultValue:(NSDate *)defaultValue;
+ (void)setLastSynchronizedTimestamp:(NSDate *)lastSynchronizedTimestamp;
+ (void)nukeLastSynchronizedTimestamp;

#pragma amrk - sync interval seconds

+ (NSUInteger)getSyncIntervalSecondsWithDefaultValue:(NSUInteger)defaultValue;
+ (void)setSyncIntervalSeconds:(NSUInteger)syncIntervalSeconds;
+ (void)nukeSyncInterval;

#pragma mark - logging parameters ------

+ (NSUInteger)getLogLevelWithDefaultValue:(NSUInteger)defaultValue;
+ (void)setLogLevel:(NSUInteger)logLevel;
+ (void)nukeLogLevel;

+ (BOOL)getLogToLocalStorageEnabledWithDefaultValue:(BOOL)defaultValue;
+ (void)setLogToLocalStorageEnabled:(BOOL)logToLocalStorageEnabled;
+ (void)nukeLogToLocalStorageEnabled;

+ (NSUInteger)getLogSizeDaysWithDefaultValue:(NSUInteger)defaultValue;
+ (void)setLogSizeDays:(NSUInteger)logSizeDays;
+ (void)nukeLogSizeDays;

+ (void)nukeLogParameters;

#pragma mark - nuke methods ------

+ (void)nukeBackendParameters;
+ (void)nukeDeviceParameters;
+ (void)nukeSynchronizationParameters;

+ (void)nukeAllParameters;

@end

NS_ASSUME_NONNULL_END
