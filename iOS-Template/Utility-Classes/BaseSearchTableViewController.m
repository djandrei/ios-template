//
//  BaseSearchTableViewController.m
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

#import "BaseSearchTableViewController.h"

@interface BaseSearchTableViewController ()

- (void) initializeTableView;
- (void) initializeSearchBar;

- (UIView *)getFirstResponder;

- (void)dismissSearchKeyboard;

@end

@implementation BaseSearchTableViewController

#pragma mark - lifecycle related methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[AppSettings lightPrimaryColor]];
    
    [self initializeTableView];
    [self initializeSearchBar];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[self navigationController] setToolbarHidden:YES animated:YES];
}

- (BOOL)hidesBottomBarWhenPushed
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    [self releaseFetchedResultsController];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    BOOL searchControllerIsActive = [_searchController isActive];
    NSString *searchText = [[_searchController searchBar] text];
    
    if (searchControllerIsActive)
    {
        [_searchController setActive:NO];
    }
    
    [coordinator
     animateAlongsideTransition:nil
     completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context)
     {
         if (searchControllerIsActive)
         {
             [self->_searchController setActive:YES];
             [[self->_searchController searchBar] setText:searchText];
         }
     }];
}

#pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger numberOfSections = [[[self fetchedResultsController] sections] count];
    if (0 == numberOfSections
        || (1 == numberOfSections && 0 == [[[[self fetchedResultsController] sections] objectAtIndex:0] numberOfObjects]))
    {
        [[self tableView] setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        NSString *noRecordsMessage = NSLocalizedString(@"No records match the filter criteria.", nil);
        if (_recordsSearchText && 0 != [_recordsSearchText length])
        {
            noRecordsMessage = NSLocalizedString(@"No records match the search criteria.", nil);
        }
        
        UILabel *noDataLabel = [[UILabel alloc]
                                initWithFrame:CGRectMake(0, 0, [self tableView].bounds.size.width, [self tableView].bounds.size.height)];
        [noDataLabel setText:noRecordsMessage];
        [noDataLabel setTextColor:[AppSettings accentColor]];
        [noDataLabel setTextAlignment:NSTextAlignmentCenter];
        [noDataLabel setBackgroundColor:[AppSettings textPrimaryColor]];
        [noDataLabel setOpaque:NO];
        
        [[self tableView] setBackgroundView:noDataLabel];
    }
    else
    {
        [[self tableView] setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
        
        [[self tableView] setBackgroundView:nil];
    }
    
    return numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[[self fetchedResultsController] sections] objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: implement in derived class;
    
    return nil;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // TODO: implement in derived class;
}

#pragma mark - NSFetchedResultsControllerDelegate methods

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [[self tableView] beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [[self tableView] endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)viewIndexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newViewIndexPath
{
    switch (type)
    {
        case NSFetchedResultsChangeInsert:
        {
            [[self tableView]
             insertRowsAtIndexPaths:[NSArray arrayWithObject:newViewIndexPath]
             withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        }
        case NSFetchedResultsChangeDelete:
        {
            [[self tableView]
             deleteRowsAtIndexPaths:[NSArray arrayWithObject:viewIndexPath]
             withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        }
        case NSFetchedResultsChangeUpdate:
        {
            [[self tableView]
             reloadRowsAtIndexPaths:[NSArray arrayWithObject:viewIndexPath]
             withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        }
        case NSFetchedResultsChangeMove:
        {
            [[self tableView]
             deleteRowsAtIndexPaths:[NSArray arrayWithObject:viewIndexPath]
             withRowAnimation:UITableViewRowAnimationFade];
            [[self tableView]
             insertRowsAtIndexPaths:[NSArray arrayWithObject:newViewIndexPath]
             withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        }
    }
}

#pragma mark - UISearchResultsUpdating methods

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    _recordsSearchText = [[searchController searchBar] text];
    
    [self releaseFetchedResultsController];
    [[self tableView] reloadData];
}

#pragma mark - UISearchBarDelegate methods

- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}

#pragma mark - private methods

- (void)initializeTableView
{
    [[self tableView] setSeparatorColor:[AppSettings dividerColor]];
    
    [[self tableView] setEstimatedRowHeight:160.0];
    [[self tableView] setRowHeight:UITableViewAutomaticDimension];
    
    [[self tableView] reloadData];
}

- (void) initializeSearchBar
{
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    [searchController setSearchResultsUpdater:self];
    [searchController setDimsBackgroundDuringPresentation:NO];
    [searchController setHidesNavigationBarDuringPresentation:NO];
    [searchController setObscuresBackgroundDuringPresentation:NO];
    
    [[searchController searchBar] setDelegate:self];
    [[searchController searchBar] setBarTintColor:[AppSettings defaultPrimaryColor]];
    [[searchController searchBar] setTintColor:[AppSettings primaryTextColor]];
    [[searchController searchBar] setBackgroundImage:[[UIImage alloc] init]];
    [[searchController searchBar] setBackgroundColor:[AppSettings defaultPrimaryColor]];
    
    UIToolbar *searchToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0, 0.0, [[self view] bounds].size.width, 44.0)];
    UIBarButtonItem *searchFlexButton = [[UIBarButtonItem alloc]
                                         initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                         target:nil
                                         action:nil];
    UIBarButtonItem *searchDoneButton = [[UIBarButtonItem alloc]
                                         initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                         target:self
                                         action:@selector(dismissSearchKeyboard)];
    [searchToolbar setItems:@[searchFlexButton,searchDoneButton]];
    [[searchController searchBar] setInputAccessoryView:searchToolbar];
    
    
    [[self tableView] setTableHeaderView:[searchController searchBar]];
    
    [self setDefinesPresentationContext:YES];
    
    _searchController = searchController;
}

- (UIView *)getFirstResponder
{
    UIView *firstResponder = nil;
    if ([[_searchController searchBar] isFirstResponder])
    {
        firstResponder = [_searchController searchBar];
    }
    
    return  firstResponder;
}

- (void)dismissSearchKeyboard
{
    [[_searchController searchBar] resignFirstResponder];
}

- (NSFetchedResultsController *)fetchedResultsController
{
    // TODO: implement in derived class;
    
    return nil;
}

- (void)releaseFetchedResultsController
{
    [_fetchedResultsController setDelegate:nil];
    _fetchedResultsController = nil;
}

#pragma mark -

@end
