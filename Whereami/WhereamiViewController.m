//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Shane Rogers on 11/18/13.
//  Copyright (c) 2013 Shane Rogers. All rights reserved.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"

@implementation WhereamiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        
        locationManager = [[CLLocationManager alloc] init];
        
        [locationManager setDelegate:self];
        
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
    }
    return self;
}
-(void) locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
    
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    
    if(t < -180){
        return;
    }
    
    [self foundLocation:newLocation];
}

-(void)locationManager:(CLLocationManager *)manager
      didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

- (void)viewDidLoad
{
    [worldView setShowsUserLocation:YES];
}

- (void)mapView:(MKMapView *)mapView
    didUpdateUserLocation:(MKUserLocation *)userLocation;
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void) findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

- (void)foundLocation:(CLLocation *)loc
{
    CLLOcationCoordinate2D coord = [loc coordinate];
    
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord
                                                        title:[locationTitleField text]];
    [worldView addAnnotation:mp];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region];
    
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

-(void)dealloc
{
    [locationManager setDelegate:nil];
}
@end
