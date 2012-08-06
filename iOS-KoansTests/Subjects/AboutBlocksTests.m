#import "AboutBlocksTests.h"
#import "GoogleWebService.h"
#import "WebService.h"

@implementation AboutBlocksTests

- (void)testShouldUseSubclassedWebServiceToHandleCallback
{
    GoogleWebService *legacyWebService = [[GoogleWebService alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    [legacyWebService makeGetRequestWithURL:url];
    STAssertTrue(FALSE, @""); //remove after the long-hand callback discussion
}

- (void)testShouldUseBlockInsteadOfLegacyCallback
{
    WebService *webService = [[WebService alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    [webService makeGetRequestWithURL:url AndCallback:^(NSData * response){ [self callBackWithHttpResponse:response]; }];
    STAssertTrue(FALSE, @""); //remove after the example block discussion
}

- (void)callBackWithHttpResponse:(NSData *)response
{
    NSString *responseString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"got this back from google %@", responseString);
}

@end