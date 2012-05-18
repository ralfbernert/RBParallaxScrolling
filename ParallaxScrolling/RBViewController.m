//
//  RBViewController.m
//  ParallaxScrolling
//
//  Created by Ralf Bernert on 18.05.12.
//  Copyright (c) 2012 bernert media DIGITAL MEDIA SERVICES. All rights reserved.
//

#import "RBViewController.h"

@interface RBViewController ()

@end

@implementation RBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
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
