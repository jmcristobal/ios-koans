#import "AboutBlocksTests.h"
#import "GoogleWebService.h"
#import "WebService.h"

@implementation AboutBlocksTests

BOOL (^isInputEven)(int) = ^(int input)
{
    if (input % 2 == 0)
        return YES;
    else
        return NO;
};

- (void)testTwoShouldReturnEven
{
    STAssertTrue(isInputEven(2), @"");
}

- (void)testOneShouldReturnOdd
{
    STAssertFalse(isInputEven(1), @"");
}

- (void)testShouldUseSubclassedWebServiceToHandleCallback
{
    GoogleWebService *legacyWebService = [[GoogleWebService alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    [legacyWebService makeGetRequestWithURL:url];
}

- (void)testShouldUseBlockInsteadOfLegacyCallback
{
    WebService *webService = [[WebService alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    [webService makeGetRequestWithURL:url AndCallback:^(NSData * response){ [self callBackWithHttpResponse:response]; }];
}

- (void)callBackWithHttpResponse:(NSData *)response
{
    NSString *responseString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"got this back from google %@", responseString);
}

@end