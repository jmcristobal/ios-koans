#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AddressAnnotation : NSObject<MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (strong, nonatomic) NSString *annotationTitle;
@property (strong, nonatomic) NSString *annotationSubTitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end
