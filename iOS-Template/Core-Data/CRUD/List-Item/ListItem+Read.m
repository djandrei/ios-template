//
//  ListItem+Read.m
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

#import "ListItem+Read.h"

@implementation ListItem (Read)

+ (NSFetchRequest *)fetchRequestWithBatchSize:(NSUInteger)batchSize
                               withFetchLimit:(NSUInteger)fetchLimit
                               withResultType:(NSFetchRequestResultType)resultType
                                  withOptions:(NSDictionary *)options
                            onBackgroundQueue:(BOOL)useBackgroundQueue
{
    AppModel *appModel = [AppModel sharedInstance];
    
    NSManagedObjectContext *managedObjectContext = [appModel queueManagedObjectContextWithPrivateContext:useBackgroundQueue];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:LIST_ITEM_ENTITY_NAME
                                              inManagedObjectContext:managedObjectContext];
    
    [fetchRequest setEntity:entityDescription];
    [fetchRequest setFetchBatchSize:batchSize];
    [fetchRequest setFetchLimit:fetchLimit];
    [fetchRequest setResultType:resultType];
    
    NSString *searchText = [options objectForKey:FETCH_PARAMETER_SEARCH_TEXT];
    if ([searchText isEqual:[NSNull null]])
    {
        searchText = nil;
    }
    
    NSDictionary *filters = [options objectForKey:FETCH_PARAMETER_FILTERS];
    
    NSString *titleOperator = FETCH_OPERATOR_FILTER_IGNORE_NIL;
    NSString *titleValue = nil;
    NSArray *titleFilter = [filters objectForKey:LIST_ITEM_PROPERTY_TITLE];
    if (titleFilter)
    {
        titleOperator = [titleFilter objectAtIndex:0];
        titleValue = [titleFilter objectAtIndex:1];
    }
    
    NSString *backendIdOperator = FETCH_OPERATOR_FILTER_IGNORE_NIL;
    NSString *backendIdValue = nil;
    NSArray *backendIdFilter = [filters objectForKey:LOG_RECORD_PROPERTY_BACKEND_ID];
    if (backendIdFilter)
    {
        backendIdOperator = [backendIdFilter objectAtIndex:0];
        backendIdValue = [backendIdFilter objectAtIndex:1];
    }
    
    NSString *createdTimestampOperator = FETCH_OPERATOR_FILTER_IGNORE_NIL;
    NSDate *createdTimestampValue = nil;
    NSArray *createdTimestampFilter = [filters objectForKey:LOG_RECORD_PROPERTY_CREATED_TIMESTAMP];
    if (createdTimestampFilter)
    {
        createdTimestampOperator = [createdTimestampFilter objectAtIndex:0];
        createdTimestampValue = [createdTimestampFilter objectAtIndex:1];
    }
    
    NSString *predicateFormatString = @"(nil == %@ OR %K OPERATOR_TITLE %@) AND (nil == %@ OR %K OPERATOR_BACKEND_ID %@) AND (nil == %@ OR %K OPERATOR_CREATED_TIMESTAMP %@) AND (nil == %@ OR %K CONTAINS[cd] %@ OR %K CONTAINS[cd] %@ OR %K CONTAINS[cd] %@)";
    predicateFormatString = [predicateFormatString
                             stringByReplacingOccurrencesOfString:@"OPERATOR_TITLE"
                             withString:titleOperator];
    predicateFormatString = [predicateFormatString
                             stringByReplacingOccurrencesOfString:@"OPERATOR_BACKEND_ID"
                             withString:backendIdOperator];
    predicateFormatString = [predicateFormatString
                             stringByReplacingOccurrencesOfString:@"OPERATOR_CREATED_TIMESTAMP"
                             withString:createdTimestampOperator];
    
    NSPredicate *predicate = [NSPredicate
                              predicateWithFormat:predicateFormatString,
                              titleValue,
                              LIST_ITEM_PROPERTY_TITLE, titleValue,
                              backendIdValue,
                              LIST_ITEM_PROPERTY_BACKEND_ID, backendIdValue,
                              createdTimestampValue,
                              LIST_ITEM_PROPERTY_CREATED_TIMESTAMP, createdTimestampValue,
                              searchText,
                              LIST_ITEM_PROPERTY_TITLE, searchText,
                              LIST_ITEM_PROPERTY_SUBTITLE, searchText,
                              LIST_ITEM_PROPERTY_DETAILS, searchText];
    
    [fetchRequest setPredicate:predicate];
    
    NSArray *sorters = [options objectForKey:FETCH_PARAMETER_SORTERS];
    
    if (0 != [sorters count])
    {
        NSMutableArray *sortDescriptors = [NSMutableArray array];
        
        for (NSArray *sorter in sorters)
        {
            NSString *sortPropertyName = [sorter objectAtIndex:0];
            NSString *sortIsAscendingString = [sorter objectAtIndex:1];
            NSString *sortIsCaseInsensitiveString = [sorter objectAtIndex:2];
            
            BOOL sortIsAscending = [sortIsAscendingString isEqualToString:FETCH_OPERATOR_SORTER_ASCENDING];
            BOOL sortIsCaseInsensitive = [sortIsCaseInsensitiveString isEqualToString:FETCH_OPERATOR_SORTER_CASE_INSENSITIVE];
            
            NSSortDescriptor *sortDescriptor = nil;
            if (sortIsCaseInsensitive)
            {
                sortDescriptor = [NSSortDescriptor
                                  sortDescriptorWithKey:sortPropertyName
                                  ascending:sortIsAscending
                                  selector:@selector(localizedCaseInsensitiveCompare:)];
            }
            else
            {
                sortDescriptor = [NSSortDescriptor
                                  sortDescriptorWithKey:sortPropertyName
                                  ascending:sortIsAscending];
            }
            
            [sortDescriptors addObject:sortDescriptor];
        }
        
        [fetchRequest setSortDescriptors:sortDescriptors];
    }
    
    return fetchRequest;
}

@end
