#import "AddressAnnotation.h"

@implementation AddressAnnotation

@synthesize coordinate = _coordinate;
@synthesize annotationTitle = _annotationTitle;
@synthesize annotationSubTitle = _annotationSubTitle;

- (NSString *)subtitle {
    return self.annotationSubTitle;
}

- (NSString *)title {
    return self.annotationTitle;
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
    self.coordinate = coordinate;
    return self;
}

@end
