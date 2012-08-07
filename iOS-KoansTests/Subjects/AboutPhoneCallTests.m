#import "AboutPhoneCallTests.h"
#import "MakePhoneCall.h"
#import "OCMockObject.h"

@implementation AboutPhoneCallTests

- (void)testMakePhoneCallWithTelephoneNumber
{
    MakePhoneCall *makePhoneCall = [[MakePhoneCall alloc] init];
    id mock = [OCMockObject partialMockForObject:makePhoneCall];
    NSURL *url = [NSURL URLWithString:@"tel://18000000000"];
    [[mock expect] openApplicationUrl:url];
    [makePhoneCall callPhoneNumber:@"18000000001"];
    [mock verify];
}

@end