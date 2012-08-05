#import "Location.h"

@implementation Location

@synthesize lat = _lat;
@synthesize lng = _lng;

- (id) initWithLatitude:(NSString *)latitude AndLongitude:(NSString *)longitude
{
    if (self == [super init])
    {
        self.lat = latitude;
        self.lng = longitude;
    }
    return self;
}

@end