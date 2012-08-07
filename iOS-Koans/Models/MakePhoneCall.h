#import <Foundation/Foundation.h>

@interface MakePhoneCall : NSObject

- (void)callPhoneNumber:(NSString *)tel;
- (void)openApplicationUrl:(NSURL *)url;

@end