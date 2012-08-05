#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class Location;

@interface GetLocationService : NSObject<CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) Location *location;

- (void)determineCurrentLocation;
- (id)initWithLocationManager:(CLLocationManager *)manager;

@end