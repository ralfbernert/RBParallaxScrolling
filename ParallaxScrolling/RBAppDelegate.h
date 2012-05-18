//
//  RBAppDelegate.h
//  ParallaxScrolling
//
//  Created by Ralf Bernert on 18.05.12.
//  Copyright (c) 2012 bernert media DIGITAL MEDIA SERVICES. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RBViewController;

@interface RBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RBViewController *viewController;

@end
