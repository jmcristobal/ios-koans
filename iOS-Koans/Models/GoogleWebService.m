#import "GoogleWebService.h"

@implementation GoogleWebService

@synthesize delegate = _delegate;

- (id)initWithDelegate:(id)delegate
{
    self = [super init];
    self.delegate = delegate;

    return self;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //[self.delegate callBackWithHttpResponse:self.responseData];
}

@end