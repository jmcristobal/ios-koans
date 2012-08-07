#import "MakePhoneCall.h"

@implementation MakePhoneCall

- (void)callPhoneNumber:(NSString *)tel
{
    NSString* phoneNumber = [NSString stringWithFormat:@"tel://%@", tel];
    NSURL *url = [NSURL URLWithString:phoneNumber];
    [self openApplicationUrl:url];
}

- (void)openApplicationUrl:(NSURL *)url
{
    [[UIApplication sharedApplication] openURL:url];
}

@end