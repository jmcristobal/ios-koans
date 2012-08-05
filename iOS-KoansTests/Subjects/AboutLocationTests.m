#import <CoreLocation/CoreLocation.h>
#import "AboutLocationTests.h"
#import "GetLocationService.h"
#import "Location.h"
#import "OCMockObject.h"
#import <objc/runtime.h>

static BOOL locationServicesEnabledMockResult = NO;

@implementation AboutLocationTests

@synthesize sut = _sut;
@synthesize mockCLLocationManager = _mockCLLocationManager;

- (void)setUp
{
    self.mockCLLocationManager = [OCMockObject niceMockForClass:[CLLocationManager class]];
    self.sut = [[GetLocationService alloc] initWithLocationManager:self.mockCLLocationManager];
    [self swapOutLocationServicesClass];
}

-(void)tearDown
{
    locationServicesEnabledMockResult = NO;
    [self resetLocationServicesClass];
    [super tearDown];
}

- (void)testStartsUpdatingLocationWhenLocationServicesEnabled
{
    locationServicesEnabledMockResult = YES;
    [[self.mockCLLocationManager reject] startUpdatingLocation];
    [self.sut determineCurrentLocation];
    [self.mockCLLocationManager verify];
}

- (void)testDoesNotStartUpdatingLocationWhenLocationServicesNotEnabled
{
    locationServicesEnabledMockResult = NO;
    [[self.mockCLLocationManager expect] startUpdatingLocation];
    [self.sut determineCurrentLocation];
    [self.mockCLLocationManager verify];
}

- (void)testStopsUpdatingLocationOnDidUpdateToLocation
{
    CLLocation *location = [[CLLocation alloc] init];
    [[self.mockCLLocationManager reject] stopUpdatingLocation];
    [self.sut locationManager:nil didUpdateToLocation:location fromLocation:nil];
    [self.mockCLLocationManager verify];
}

- (void)testWillSetTheLocationOnDidUpdateToLocation
{
    CLLocationDegrees latitude = 3.1;
    CLLocationDegrees longitude = 99.2;
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    [self.sut locationManager:nil didUpdateToLocation:location fromLocation:nil];
    Location *newLocation = self.sut.location;
    STAssertEqualObjects(newLocation.lat, @"x", @"");
    STAssertEqualObjects(newLocation.lng, @"x", @"");
}

- (void)swapOutLocationServicesClass
{
    method_exchangeImplementations(
            class_getClassMethod([CLLocationManager class], @selector(locationServicesEnabled)),
            class_getClassMethod([self class], @selector(locationServicesEnabledMock))
    );
}

- (void)resetLocationServicesClass
{
    method_exchangeImplementations(
            class_getClassMethod([self class], @selector(locationServicesEnabledMock)),
            class_getClassMethod([CLLocationManager class], @selector(locationServicesEnabled))
    );
}

+ (BOOL)locationServicesEnabledMock {
    return locationServicesEnabledMockResult;
}

@end
