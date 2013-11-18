//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Shane Rogers on 11/18/13.
//  Copyright (c) 2013 Shane Rogers. All rights reserved.
//

#import "WhereamiViewController.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self) {
        locationManager = [[CLLocationManager alloc]init];
        
        [locationManager setDelegate:self];
        
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        [locationManager startUpdatingLocation];
    }
    return self;
}

-(void) locationManager:(CLLocationManager *)manager
      didUpdateLocation:(CLLocation *)oldLocation
           fromLocation:(CLLocation *)newLocation
{
    NSLog(@"%@", newLocation);
}

-(void)locationManager:(CLLocationManager *)manager
      didFailWithError:(NSError *)error
{
    NSLog(@"Could not fidn location: %@", error);
}
@end
