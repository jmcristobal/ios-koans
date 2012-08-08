#import "ViewController.h"
#import "AddressAnnotation.h"
#import <MapKit/MapKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)constructMapWithAnnotations
{
    CLLocationCoordinate2D coordinate = (CLLocationCoordinate2D){41.7292217,-93.4397386};
    AddressAnnotation* annotation = [[AddressAnnotation alloc] initWithCoordinate:coordinate];
    [self.mapview addAnnotation:annotation];
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(coordinate,15000, 15000);
    viewRegion = [self.mapview regionThatFits:viewRegion];
    
    [self.mapview setDelegate:self];
    [self.mapview setRegion:viewRegion animated:YES];
    [self.mapview setShowsUserLocation:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self constructMapWithAnnotations];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
