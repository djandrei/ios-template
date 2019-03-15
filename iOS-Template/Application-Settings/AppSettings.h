//
//  AppSettings.h
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
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppSettings : NSObject

#pragma mark - logging settings

+ (BOOL)loggingIsEnabled;
+ (NSUInteger)logLevel;
+ (BOOL)loggingToConsoleIsEnabled;
+ (BOOL)loggingToPersistentStoreIsEnabled;
+ (NSUInteger)logSizeDays;

+ (NSString *)applicationErrorDomain;

#pragma mark - core data settings

+ (NSString *)dataModelName;
+ (NSString *)dataModelExtension;
+ (NSString *)persistentStoreName;

#pragma mark - palette colors

+ (UIColor *)darkPrimaryColor;
+ (UIColor *)defaultPrimaryColor;
+ (UIColor *)lightPrimaryColor;
+ (UIColor *)textPrimaryColor;
+ (UIColor *)accentColor;
+ (UIColor *)primaryTextColor;
+ (UIColor *)secondaryTextColor;
+ (UIColor *)dividerColor;

/*
 material design color palette
 https://www.materialpalette.com/light-blue/cyan
 ------------------------------------------------
 .dark-primary-color    { #FF0288D1; }
 .default-primary-color { #FF03A9F4; }
 .light-primary-color   { #FFB3E5FC; }
 .text-primary-color    { #FFFFFFFF; }
 .accent-color          { #FF00BCD4; }
 .primary-text-color    { #FF212121; }
 .secondary-text-color  { #FF757575; }
 .divider-color         { #FFBDBDBD; }
 */

#pragma mark -

@end

NS_ASSUME_NONNULL_END
