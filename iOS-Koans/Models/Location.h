#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (strong, nonatomic) NSString* lat;
@property (strong, nonatomic) NSString* lng;

- (id) initWithLatitude:(NSString *)latitude AndLongitude:(NSString *)longitude;

@end