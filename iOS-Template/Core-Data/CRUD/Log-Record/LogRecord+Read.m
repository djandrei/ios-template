//
//  LogRecord+Read.m
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

#import "LogRecord+Read.h"

@implementation LogRecord (Read)

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
                                              entityForName:LOG_RECORD_ENTITY_NAME
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
    
    NSString *logLevelStringOperator = FETCH_OPERATOR_FILTER_IGNORE_NIL;
    NSString *logLevelStringValue = nil;
    NSArray *logLevelStringFilter = [filters objectForKey:LOG_RECORD_PROPERTY_LOG_LEVEL_STRING];
    if (logLevelStringFilter)
    {
        logLevelStringOperator = [logLevelStringFilter objectAtIndex:0];
        logLevelStringValue = [logLevelStringFilter objectAtIndex:1];
    }
    
    NSString *logLevelIntOperator = FETCH_OPERATOR_FILTER_IGNORE_NIL;
    NSNumber *logLevelIntValue = nil;
    NSArray *logLevelIntFilter = [filters objectForKey:LOG_RECORD_PROPERTY_LOG_LEVEL_INTEGER];
    if (logLevelIntFilter)
    {
        logLevelIntOperator = [logLevelIntFilter objectAtIndex:0];
        logLevelIntValue = [logLevelIntFilter objectAtIndex:1];
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
    
    NSString *predicateFormatString = @"(nil == %@ OR %K OPERATOR_LOG_LEVEL_STRING %@) AND (nil == %@ OR %K OPERATOR_LOG_LEVEL_INTEGER %@) AND (nil == %@ OR %K OPERATOR_BACKEND_ID %@) AND (nil == %@ OR %K OPERATOR_CREATED_TIMESTAMP %@) AND (nil == %@ OR %K CONTAINS[cd] %@ OR %K CONTAINS[cd] %@ OR %K CONTAINS[cd] %@ OR %K CONTAINS[cd] %@)";
    predicateFormatString = [predicateFormatString
                             stringByReplacingOccurrencesOfString:@"OPERATOR_LOG_LEVEL_STRING"
                             withString:logLevelStringOperator];
    predicateFormatString = [predicateFormatString
                             stringByReplacingOccurrencesOfString:@"OPERATOR_LOG_LEVEL_INTEGER"
                             withString:logLevelIntOperator];
    predicateFormatString = [predicateFormatString
                             stringByReplacingOccurrencesOfString:@"OPERATOR_BACKEND_ID"
                             withString:backendIdOperator];
    predicateFormatString = [predicateFormatString
                             stringByReplacingOccurrencesOfString:@"OPERATOR_CREATED_TIMESTAMP"
                             withString:createdTimestampOperator];
    
    NSPredicate *predicate = [NSPredicate
                              predicateWithFormat:predicateFormatString,
                              logLevelStringValue,
                              LOG_RECORD_PROPERTY_LOG_LEVEL_STRING, logLevelStringValue,
                              logLevelIntValue,
                              LOG_RECORD_PROPERTY_LOG_LEVEL_INTEGER, logLevelIntValue,
                              backendIdValue,
                              LOG_RECORD_PROPERTY_BACKEND_ID, backendIdValue,
                              createdTimestampValue,
                              LOG_RECORD_PROPERTY_CREATED_TIMESTAMP, createdTimestampValue,
                              searchText,
                              LOG_RECORD_PROPERTY_LOG_LEVEL_STRING, searchText,
                              LOG_RECORD_PROPERTY_LOG_CATEGORY, searchText,
                              LOG_RECORD_PROPERTY_LOG_MESSAGE, searchText,
                              LOG_RECORD_PROPERTY_LOG_DATA, searchText];
    
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
                sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:sortPropertyName ascending:sortIsAscending selector:@selector(localizedCaseInsensitiveCompare:)];
            }
            else
            {
                sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:sortPropertyName ascending:sortIsAscending];
            }
            
            [sortDescriptors addObject:sortDescriptor];
        }
        
        [fetchRequest setSortDescriptors:sortDescriptors];
    }
    
    return fetchRequest;
}

+ (void)logRecordsOrderedAscendingWithFetchLimit:(NSUInteger)fetchLimit
                               olderThanTimestap:(NSDate *)olderThanTimestamp
                               onBackgroundQueue:(BOOL)useBackgroundQueue
                             withCompletionBlock:(void (^)(NSArray *logRecords, NSError *fetchError))completionBlock
{
    NSDictionary *fetchOptions =
    @{
      FETCH_PARAMETER_SEARCH_TEXT: [NSNull null],
      FETCH_PARAMETER_FILTERS: @{LOG_RECORD_PROPERTY_CREATED_TIMESTAMP: @[FETCH_OPERATOR_FILTER_SMALLER_THAN, olderThanTimestamp]},
      FETCH_PARAMETER_SORTERS: @[@[LOG_RECORD_PROPERTY_CREATED_TIMESTAMP, FETCH_OPERATOR_SORTER_ASCENDING, FETCH_OPERATOR_SORTER_CASE_IGNORE]]
      };
    
    NSFetchRequest *fetchRequest =  [LogRecord
                                     fetchRequestWithBatchSize:NSUIntegerMax
                                     withFetchLimit:fetchLimit
                                     withResultType:NSManagedObjectResultType
                                     withOptions:fetchOptions
                                     onBackgroundQueue:useBackgroundQueue];
    
    AppModel *appModel = [AppModel sharedInstance];
    
    NSManagedObjectContext *managedObjectContext = [appModel queueManagedObjectContextWithPrivateContext:useBackgroundQueue];
    
    [managedObjectContext performBlock:^
     {
         NSError *fetchError = nil;
         NSArray *logRecords = [managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
         
         if (completionBlock)
         {
             completionBlock(logRecords, fetchError);
         }
     }];
}

@end
