//
//  ListItemTableViewCell.m
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

#import "ListItemTableViewCell.h"

@implementation ListItemTableViewCell

#pragma mark - lifecycle-related methods

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setBackgroundColor:[UIColor clearColor]];
    
    [[self itemImageView] setBackgroundColor:[UIColor clearColor]];
    [[self itemImageView] setImage:[UIImage imageNamed:@"image-stub"]];
    
    [[self itemDetailsLabel] setBackgroundColor:[UIColor clearColor]];
    [[self itemDetailsLabel] setTextColor:[AppSettings primaryTextColor]];
}

#pragma mark - public methods

- (void)setItemImage:(UIImage *)itemImage
{
    [[self itemImageView] setImage:itemImage];
}

- (void)setItemDescription:(NSString *)itemDescription
{
    [[self itemDetailsLabel] setText:itemDescription];
}

@end
