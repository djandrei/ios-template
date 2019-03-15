//
//  BackendAdapter.m
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

#import "BackendAdapter.h"

static BackendAdapter *_instance = nil;

@implementation BackendAdapter

#pragma mark - Singleton methods

- (id)initWithStrategy
{
    self = [super init];
    if (self)
    {
        _backendAdapterStrategy = [[BackendAdapterStub alloc] init];
    }
    
    return self;
}

+ (BackendAdapter *)sharedInstance
{
    @synchronized([BackendAdapter class])
    {
        if (nil == _instance)
        {
            _instance = [[BackendAdapter alloc] initWithStrategy];
        }
    }
    
    return _instance;
}

+ (BOOL)sharedInstanceExists
{
    BOOL instanceExists;
    @synchronized([BackendAdapter class])
    {
        instanceExists = (nil != _instance);
    }
    
    return instanceExists;
}

+ (void)deleteSharedInstance
{
    @synchronized([BackendAdapter class])
    {
        _instance = nil;
    }
}

#pragma mark - public methods

- (BOOL)currentUserIsLoggedIn
{
    return [_backendAdapterStrategy currentUserIsLoggedIn];
}

- (void)enableSynchronization
{
    [_backendAdapterStrategy enableSynchronization];
}

- (void)disableSynchronization
{
    [_backendAdapterStrategy disableSynchronization];
}

- (void)backendChangesAreAvailable
{
    [_backendAdapterStrategy backendChangesAreAvailable];
}

@end
