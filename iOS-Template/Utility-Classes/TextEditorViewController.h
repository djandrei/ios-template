//
//  TextEditorViewController.h
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

#import <UIKit/UIKit.h>

#import "AppSettings.h"
#import "BaseViewController.h"

#define TEXT_EDITOR_VIEW_CONTROLLER_NIB_NAME @"TextEditorViewController"

NS_ASSUME_NONNULL_BEGIN

@protocol TextEditorViewControllerDelegate <NSObject>

- (void)updatedTextWithText:(NSString *)text withTag:(NSUInteger)tag;
- (void)cancelledTextUpdate;

@end

@interface TextEditorViewController : BaseViewController
{
    NSString *_title;
    NSString *_text;
    NSUInteger _tag;
}

+ (TextEditorViewController *)viewControllerWithDefaultNibNameWithTitle:(NSString *)title
                                                               withText:(NSString *)text
                                                                withTag:(NSUInteger)tag;

@property (nonatomic, weak) id<TextEditorViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextView *editorTextView;

@property (weak, nonatomic) IBOutlet UILabel *keyboardLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *keyboardLabelHeightConstraint;

@end

NS_ASSUME_NONNULL_END
