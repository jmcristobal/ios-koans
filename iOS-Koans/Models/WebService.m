#import "WebService.h"

@implementation WebService

@synthesize responseData = _responseData;
@synthesize connection = _connection;
@synthesize callback = _callback;

- (id)init
{
    if (self == [super init])
    {
        self.connection = [[NSURLConnection alloc] init];
        self.responseData = [[NSMutableData alloc] init];
    }

    return self;
}

- (void)makeGetRequestWithURL:(NSURL *)url AndCallback:(void (^)(NSData *))callback
{
    self.callback = callback;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    request.HTTPMethod = @"GET";

    [self.connection initWithRequest:request delegate:self];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.callback(self.responseData);
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];
}

@end