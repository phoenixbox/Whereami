//
//  WhereamiAppDelegate.h
//  Whereami
//
//  Created by Shane Rogers on 11/18/13.
//  Copyright (c) 2013 Shane Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
//
//@interface WhereamiAppDelegate : UIResponder <UIApplicationDelegate>
//
//@property (strong, nonatomic) UIWindow *window;
//
//@end
//
//#import <UIKit/UIKit.h>

@class WhereamiViewController;

@interface WhereamiAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) WhereamiViewController *viewController;

@end