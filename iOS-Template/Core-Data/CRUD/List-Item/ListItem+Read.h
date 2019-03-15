//
//  ListItem+Read.h
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

#import "ListItem+CoreDataClass.h"

#import "AppModel.h"
#import "CRUD+Parameters.h"
#import "ListItem+Headers.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListItem (Read)

+ (NSFetchRequest *)fetchRequestWithBatchSize:(NSUInteger)batchSize
                               withFetchLimit:(NSUInteger)fetchLimit
                               withResultType:(NSFetchRequestResultType)resultType
                                  withOptions:(NSDictionary *)options
                            onBackgroundQueue:(BOOL)useBackgroundQueue;

@end

NS_ASSUME_NONNULL_END
