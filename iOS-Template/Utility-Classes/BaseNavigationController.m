//
//  BaseNavigationController.m
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

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self navigationBar] setTranslucent:NO];
    [[self navigationBar] setBarTintColor:[AppSettings defaultPrimaryColor]];
    [[self navigationBar] setTintColor:[AppSettings lightPrimaryColor]];
    [[self navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName:[AppSettings textPrimaryColor]}];
    
    [[self navigationBar] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[self navigationBar] setShadowImage:[[UIImage alloc] init]];
    
    [[self toolbar] setTranslucent:NO];
    [[self toolbar] setBarTintColor:[AppSettings defaultPrimaryColor]];
    [[self toolbar] setTintColor:[AppSettings lightPrimaryColor]];
}

@end
