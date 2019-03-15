//
//  ListItemTableViewController.m
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

#import "ListItemTableViewController.h"

@interface ListItemTableViewController ()

- (void) registerNibsForCells;
- (void) initializeTableView;
- (void) initializeNavigationBar;

- (void) configureTableViewCell:(ListItemTableViewCell *)tableViewCell;

@end

@implementation ListItemTableViewController

#pragma mark - initializers

+ (ListItemTableViewController *)tableViewControllerWithDefaultNibNameWithManagedObjectID:(NSManagedObjectID *)managedObjectID
{
    return [[ListItemTableViewController alloc]
            initWithNibName:LIST_ITEM_TABLE_VIEW_NIB_NAME
            bundle:nil
            managedObjectID:managedObjectID];
}

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
      managedObjectID:(NSManagedObjectID *)managedObjectID
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        _managedObjectID = [managedObjectID copy];
        
        NSError *fetchError;
        ListItem *listItem = [[[AppModel sharedInstance] mainQueueManagedObjectContext]
                              existingObjectWithID:_managedObjectID
                              error:&fetchError];
        if (fetchError)
        {
            [Logger
             logCriticalMessageWithCategory:@"ListItemTableViewController"
             withError:fetchError
             withMessage:@"Failed to fetch record from local storage."];
        }
        else
        {
            _itemTitle = [listItem title];
            _itemImage = [UIImage imageWithData:[listItem image]];
            _itemDescription = [listItem details];
        }
    }
    
    return self;
}

#pragma mark - lifecycle related methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self registerNibsForCells];
    [self initializeNavigationBar];
    [self initializeTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[self navigationController] setToolbarHidden:YES animated:NO];
}

- (BOOL)hidesBottomBarWhenPushed
{
    return YES;
}

#pragma mark - rotation

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:nil
                                 completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context)
     {
         [[self tableView]
          scrollToRowAtIndexPath:[[[self tableView] indexPathsForVisibleRows] objectAtIndex:0]
          atScrollPosition:UITableViewScrollPositionTop
          animated:YES];
     }];
}

#pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableViewCell = nil;
    
    switch ([indexPath row])
    {
        case 0:
        {
            tableViewCell = [tableView
                             dequeueReusableCellWithIdentifier:LIST_ITEM_TABLE_VIEW_CELL_NIB_NAME
                             forIndexPath:indexPath];
            
            [self configureTableViewCell:(ListItemTableViewCell *)tableViewCell];
            
            break;
        }
        default:
            break;
    }
    
    return tableViewCell;
}

#pragma mark - private methods

- (void)registerNibsForCells
{
    [[self tableView]
     registerNib:[UINib nibWithNibName:LIST_ITEM_TABLE_VIEW_CELL_NIB_NAME bundle:nil]
     forCellReuseIdentifier:LIST_ITEM_TABLE_VIEW_CELL_NIB_NAME];
}

- (void)initializeTableView
{
    [[self tableView] setEstimatedRowHeight:230.0];
    [[self tableView] setRowHeight:UITableViewAutomaticDimension];
    [[self tableView] setAllowsSelection:NO];
    [[self tableView] setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [[self tableView] reloadData];
}

- (void)initializeNavigationBar
{
    [[self navigationItem] setTitle:_itemTitle];
    [[[self navigationController] navigationBar] setTranslucent:NO];
}

- (void) configureTableViewCell:(ListItemTableViewCell *) tableViewCell
{
    [tableViewCell setItemImage:_itemImage];
    [tableViewCell setItemDescription:_itemDescription];
    
    [tableViewCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [tableViewCell setAccessoryType:UITableViewCellAccessoryNone];
}

@end
