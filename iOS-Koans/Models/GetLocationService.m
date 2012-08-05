#import "GetLocationService.h"
#import "Location.h"

@implementation GetLocationService

@synthesize location = _location;
@synthesize locationManager = _locationManager;

- (id)initWithLocationManager:(CLLocationManager *)locationManager
{
    if (self == [super init]) {
        self.locationManager = locationManager;
        self.locationManager.delegate = self;
    }

    return self;
}

- (void)determineCurrentLocation
{
    if ([CLLocationManager locationServicesEnabled])
    {
        [self.locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [self.locationManager stopUpdatingLocation];
    self.location = [self transformLocationFromLocationManager:newLocation];
}

- (Location *)transformLocationFromLocationManager:(CLLocation *)location
{
    NSString *lat = [[NSString alloc] initWithFormat:@"%g", location.coordinate.latitude];
    NSString *lng = [[NSString alloc] initWithFormat:@"%g", location.coordinate.longitude];

    return [[Location alloc] initWithLatitude:lat AndLongitude:lng];
}

@end