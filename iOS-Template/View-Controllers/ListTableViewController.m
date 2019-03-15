//
//  ListTableViewController.m
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

#import "ListTableViewController.h"

@interface ListTableViewController ()

- (void)registerNibsForCells;
- (void) initializeNavigationBar;
- (NSFetchedResultsController *) fetchedResultsController;

- (void) configureTableViewCell:(ListTableViewCell *) tableViewCell
                   withListItem:(ListItem *)listItem;

@end

@implementation ListTableViewController

#pragma mark - initializers

+ (ListTableViewController *)tableViewControllerWithDefaultNibName
{
    return [[ListTableViewController alloc]
            initWithNibName:LIST_TABLE_VIEW_NIB_NAME
            bundle:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        // TODO: add logic here;
    }
    
    return self;
}

#pragma mark - lifecycle related methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self registerNibsForCells];
    [self initializeNavigationBar];
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

#pragma mark - table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListTableViewCell *tableViewCell = [tableView
                                        dequeueReusableCellWithIdentifier:LIST_TABLE_VIEW_CELL_NIB_NAME
                                        forIndexPath:indexPath];
    
    ListItem *listItem = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    
    [self configureTableViewCell:tableViewCell withListItem:listItem];
    
    return tableViewCell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ListItem *listItem = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    
    ListItemTableViewController *listItemTableViewController = [ListItemTableViewController
                                                                tableViewControllerWithDefaultNibNameWithManagedObjectID:[listItem objectID]];
    
    [[self navigationController]
     pushViewController:listItemTableViewController
     animated:YES];
}

#pragma mark - private methods

- (void)registerNibsForCells
{
    [[self tableView]
     registerNib:[UINib nibWithNibName:LIST_TABLE_VIEW_CELL_NIB_NAME bundle:nil]
     forCellReuseIdentifier:LIST_TABLE_VIEW_CELL_NIB_NAME];
}

- (void)initializeNavigationBar
{
    [[self navigationItem] setTitle:NSLocalizedString(@"Aircraft", nil)];
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (nil == _fetchedResultsController)
    {
        NSFetchedResultsController *fetchedResultsController;
        
        NSString *searchText = [NSNull null];
        if (_recordsSearchText && 0 != [_recordsSearchText length])
        {
            searchText = _recordsSearchText;
        }
        
        NSDictionary *fetchOptions =
        @{
          FETCH_PARAMETER_SEARCH_TEXT: searchText,
          FETCH_PARAMETER_FILTERS: @{},
          FETCH_PARAMETER_SORTERS: @[@[LIST_ITEM_PROPERTY_TITLE, FETCH_OPERATOR_SORTER_ASCENDING, FETCH_OPERATOR_SORTER_CASE_IGNORE]]
          };
        
        NSManagedObjectContext *managedObjectContext = [[AppModel sharedInstance] mainQueueManagedObjectContext];
        NSFetchRequest *fetchRequest = [ListItem
                                        fetchRequestWithBatchSize:30
                                        withFetchLimit:NSUIntegerMax
                                        withResultType:NSManagedObjectResultType
                                        withOptions:fetchOptions
                                        onBackgroundQueue:NO];
        
        fetchedResultsController = [[NSFetchedResultsController alloc]
                                    initWithFetchRequest:fetchRequest
                                    managedObjectContext:managedObjectContext
                                    sectionNameKeyPath:nil
                                    cacheName:nil];
        
        [fetchedResultsController setDelegate:self];
        
        NSError *fetchError = nil;
        BOOL performedFetch = [fetchedResultsController performFetch:&fetchError];
        if (!performedFetch)
        {
            [Logger
             logCriticalMessageWithCategory:@"ListTableViewController"
             withError:fetchError
             withMessage:@"Failed to perform initial fetch."];
        }
        
        _fetchedResultsController = fetchedResultsController;
    }
    
    return _fetchedResultsController;
}

- (void) configureTableViewCell:(ListTableViewCell *) tableViewCell
                   withListItem:(ListItem *)listItem
{
    [tableViewCell setItemImage:[UIImage imageWithData:[listItem image]]];
    [tableViewCell setItemTitle:[listItem title]];
    [tableViewCell setItemSubtitle:[listItem subtitle]];
    
    [tableViewCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
}

#pragma mark -


@end
