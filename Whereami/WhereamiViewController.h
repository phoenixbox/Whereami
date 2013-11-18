//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Shane Rogers on 11/18/13.
//  Copyright (c) 2013 Shane Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>

{
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
}

- (void)findLocation;
- (void)findLocation:(CLLocation *)loc;

@end
