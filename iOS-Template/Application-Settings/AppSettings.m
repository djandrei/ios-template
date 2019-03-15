//
//  AppSettings.m
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

#import "AppSettings.h"

@interface AppSettings ()

+ (UIColor *)generateColorFromRGB:(NSUInteger)rgbValue;

@end

@implementation AppSettings

#pragma mark - logging settings

+ (BOOL)loggingIsEnabled
{
    return YES;
}

+ (NSUInteger)logLevel
{
    // 0 emergency
    // 1 alert
    // 2 critical
    // 3 error
    // 4 warning
    // 5 notice
    // 6 info
    // 7 debug
    return 7;
}

+ (BOOL)loggingToConsoleIsEnabled
{
    return YES;
}

+ (BOOL)loggingToPersistentStoreIsEnabled
{
    return YES;
}

+ (NSUInteger)logSizeDays
{
    return 1;
}

+ (NSString *)applicationErrorDomain
{
    return @"ApplicationDomain";
}

#pragma mark - core data settings

+ (NSString *)dataModelName
{
    return @"iOS_Template";
}

+ (NSString *)dataModelExtension
{
    return @"momd";
}

+ (NSString *)persistentStoreName
{
    return @"model.sqlite";
}

#pragma mark - palette colors

+ (UIColor *)darkPrimaryColor
{
    // .dark-primary-color    { #FF0288D1; }
    return [AppSettings generateColorFromRGB:0xFF0288D1];
}

+ (UIColor *)defaultPrimaryColor
{
    // .default-primary-color { #FF03A9F4; }
    return [AppSettings generateColorFromRGB:0xFF03A9F4];
}

+ (UIColor *)lightPrimaryColor
{
    // .light-primary-color   { #FFB3E5FC; }
    return [AppSettings generateColorFromRGB:0xFFB3E5FC];
}

+ (UIColor *)textPrimaryColor
{
    // .text-primary-color    { #FFFFFFFF; }
    return [AppSettings generateColorFromRGB:0xFFFFFFFF];
}

+ (UIColor *)accentColor
{
    // .accent-color          { #FF00BCD4; }
    return [AppSettings generateColorFromRGB:0xFF00BCD4];
}

+ (UIColor *)primaryTextColor
{
    // .primary-text-color    { #FF212121; }
    return [AppSettings generateColorFromRGB:0xFF212121];
}

+ (UIColor *)secondaryTextColor
{
    // .secondary-text-color  { #FF757575; }
    return [AppSettings generateColorFromRGB:0xFF757575];
}

+ (UIColor *)dividerColor
{
    // .divider-color         { #FFBDBDBD; }
    return [AppSettings generateColorFromRGB:0xFFBDBDBD];
}

#pragma mark -

#pragma mark - private methods

+ (UIColor *)generateColorFromRGB:(NSUInteger)rgbValue
{
    UIColor *color = [UIColor clearColor];
    
    CGFloat alpha = (CGFloat)((rgbValue & 0xFF000000) >> 24) / 255.0;
    CGFloat red = (CGFloat)((rgbValue & 0x00FF0000) >> 16) / 255.0;
    CGFloat green = (CGFloat)((rgbValue & 0x0000FF00) >> 8) / 255.0;
    CGFloat blue = (CGFloat)(rgbValue & 0x000000FF) / 255.0;
    
    color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
    return color;
}

@end
