//
//  TextEditorViewController.m
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

#import "TextEditorViewController.h"

@interface TextEditorViewController ()

- (void) initializeNavigationBar;
- (void) initializeToolBar;
- (void) initializeTabBar;

- (void)handleDeleteButtonTap:(id)sender;
- (void)handleSaveButtonTap:(id)sender;

- (void)dismissKeyboard;

- (void)keyboardWasShown:(NSNotification*)notification;
- (void)keyboardWillBeHidden:(NSNotification*)notification;

@end

@implementation TextEditorViewController

#pragma mark - initializers

+ (TextEditorViewController *)viewControllerWithDefaultNibNameWithTitle:(NSString *)title
                                                               withText:(NSString *)text
                                                                withTag:(NSUInteger)tag
{
    return [[TextEditorViewController alloc]
            initWithNibName:TEXT_EDITOR_VIEW_CONTROLLER_NIB_NAME
            bundle:nil
            title:title
            text:text
            tag:tag];
}

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
                title:(NSString *)title
                 text:(NSString *)text
                  tag:(NSUInteger)tag
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        _title = [title copy];
        _text = [text copy];
        _tag = tag;
    }
    
    return self;
}

#pragma mark - lifecycle-related methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initializeNavigationBar];
    [self initializeToolBar];
    [self initializeTabBar];
    
    [[self view] setBackgroundColor:[AppSettings lightPrimaryColor]];
    
    [[self editorTextView] setBackgroundColor:[UIColor clearColor]];
    [[self editorTextView] setTextColor:[AppSettings primaryTextColor]];
    [[self editorTextView] setText:_text];
    
    UIToolbar *textToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0, 0.0, [[self view] bounds].size.width, 44.0)];
    UIBarButtonItem *textFlexButton = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                       target:nil
                                       action:nil];
    UIBarButtonItem *textDoneButton = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                       target:self
                                       action:@selector(dismissKeyboard)];
    [textToolbar setItems:@[textFlexButton,textDoneButton]];
    [textToolbar setBackgroundColor:[AppSettings defaultPrimaryColor]];
    [[self editorTextView] setInputAccessoryView:textToolbar];
    
    [[self keyboardLabel] setText:@""];
    [[self keyboardLabelHeightConstraint] setConstant:0.0];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[self navigationController] setToolbarHidden:NO animated:NO];
    
    [[self editorTextView] becomeFirstResponder];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(keyboardWasShown:)
     name:UIKeyboardDidShowNotification
     object:nil];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(keyboardWillBeHidden:)
     name:UIKeyboardWillHideNotification
     object:nil];
}

- (BOOL)hidesBottomBarWhenPushed
{
    return NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:UIKeyboardDidShowNotification
     object:nil];
    
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:UIKeyboardWillHideNotification
     object:nil];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:nil
                                 completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context)
     {
         [[self editorTextView] resignFirstResponder];
     }];
}

#pragma amrk - public methods

#pragma mark - private methods

- (void) initializeNavigationBar
{
    [[self navigationItem] setTitle:_title];
}

- (void) initializeToolBar
{
    UIBarButtonItem *flexibleSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                       target:nil
                                       action:nil];
    
    UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc]
                                     initWithImage:[UIImage imageNamed:@"ToolbarCancelImage"]
                                     style:UIBarButtonItemStylePlain
                                     target:self
                                     action:@selector(handleDeleteButtonTap:)];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
                                   initWithImage:[UIImage imageNamed:@"ToolbarSaveImage"]
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(handleSaveButtonTap:)];
    
    [self
     setToolbarItems:[NSArray arrayWithObjects:
                      flexibleSpacer,
                      deleteButton,
                      flexibleSpacer,
                      saveButton,
                      flexibleSpacer,
                      nil]
     animated:YES];
}

- (void) initializeTabBar
{
    // TODO: add logic here;
}

- (void)handleDeleteButtonTap:(id)sender
{
    [[self delegate] cancelledTextUpdate];
}

- (void)handleSaveButtonTap:(id)sender
{
    [[self delegate] updatedTextWithText:[[self editorTextView] text] withTag:_tag];
}

- (void)dismissKeyboard
{
    [[self editorTextView] resignFirstResponder];
}

- (void)keyboardWasShown:(NSNotification*)notification
{
    NSDictionary* info = [notification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    
    [[self keyboardLabelHeightConstraint]
     setConstant:keyboardSize.height
     - [[[self tabBarController] tabBar] frame].size.height
     - [[[self navigationController] toolbar] frame].size.height
     + 2.0];
    
    [UIView commitAnimations];
}

- (void)keyboardWillBeHidden:(NSNotification*)notification
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    
    [[self keyboardLabelHeightConstraint] setConstant:0.0];
    
    [UIView commitAnimations];
}

#pragma mark -

@end

