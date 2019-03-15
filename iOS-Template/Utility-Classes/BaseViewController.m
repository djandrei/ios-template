//
//  BaseViewController.m
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

#import "BaseViewController.h"

@interface BaseViewController ()

- (UIView *)getFirstResponder;
- (void)handleFirstResponderShouldResignNotification:(NSNotification *)notification;

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[AppSettings lightPrimaryColor]];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(handleFirstResponderShouldResignNotification:)
     name:APPLICATION_NOTIFICATION_FIRST_RESPONDER_SHOULD_RESIGN
     object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:APPLICATION_NOTIFICATION_FIRST_RESPONDER_SHOULD_RESIGN
     object:nil];
}

- (void)displayActivityIndicator
{
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc]
                                                      initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    [activityIndicatorView setAutoresizingMask:
     UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight |
     UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
     UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth];
    
    CGFloat activityIndicatorCenterX = [[self view] center].x;
    CGFloat activityIndicatorCenterY = [[self view] center].y;
    
    [activityIndicatorView setCenter:CGPointMake(activityIndicatorCenterX, activityIndicatorCenterY)];
    [activityIndicatorView setColor:[UIColor darkGrayColor]];
    [activityIndicatorView setHidesWhenStopped:YES];
    
    [activityIndicatorView startAnimating];
    
    [[self view] addSubview:activityIndicatorView];
    
    _activityIndicatorView = activityIndicatorView;
}

- (void)hideActivityIndicator
{
    if (_activityIndicatorView)
    {
        [_activityIndicatorView stopAnimating];
        
        _activityIndicatorView = nil;
    }
}

- (UIView *)getFirstResponder
{
    // TODO: implement this in subclasses;
    
    return nil;
}

- (void)handleFirstResponderShouldResignNotification:(NSNotification *)notification
{
    UIView *firstResponder = [self getFirstResponder];
    
    [firstResponder resignFirstResponder];
}

@end
