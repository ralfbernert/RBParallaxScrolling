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


#pragma mark - UIViewController methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // setting background color to black
    [self.view setBackgroundColor:[UIColor blackColor]];

    
    // create first scrollview (bottom)
    _firstScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 480, 320)];
    [_firstScrollView setContentSize:CGSizeMake(3840, 320)];
    [self.view addSubview:_firstScrollView];
    
    
    // create second scrollview (middle)
    _secondScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 480, 320)];
    [_secondScrollView setContentSize:CGSizeMake(1920, 320)];
    [self.view addSubview:_secondScrollView];
    
    
    // create third scrollview (on top)
    _thirdScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 480, 320)];
    [_thirdScrollView setContentSize:CGSizeMake(960, 320)];
    
    // the UIScrollView on top gets the delegate and controls the scrolling of the 
    // underlying scrollviews
    [_thirdScrollView setDelegate:self];
    
    [self.view addSubview:_thirdScrollView];
    
    
    // load image into first scrollview
    NSString *fileLocation = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"parallax-03.png"];
    UIImage *aImage = [[UIImage alloc] initWithContentsOfFile:fileLocation];
    UIImageView *aImageView = [[UIImageView alloc] initWithImage:aImage];
    aImageView.frame = CGRectMake(-800, 0, aImage.size.width, aImage.size.height);
    [_firstScrollView addSubview:aImageView];
    [aImage release];
    aImage = nil;
    [aImageView release];
    

    // load image into second scrollview    
    fileLocation = [[NSBundle mainBundle] pathForResource:@"parallax-02.png" ofType:nil];
    aImage = [[UIImage alloc] initWithContentsOfFile:fileLocation];
    aImageView = [[UIImageView alloc] initWithImage:aImage];
    aImageView.frame = CGRectMake(0, 0, aImage.size.width, aImage.size.height);
    [_secondScrollView addSubview:aImageView];
    [aImage release];
    aImage = nil;
    [aImageView release];
    
    
    // load image into third scrollview
    fileLocation = [[NSBundle mainBundle] pathForResource:@"parallax-01.png" ofType:nil];
    aImage = [[UIImage alloc] initWithContentsOfFile:fileLocation];
    aImageView = [[UIImageView alloc] initWithImage:aImage];
    aImageView.frame = CGRectMake(0, 0, aImage.size.width, aImage.size.height);
    [_thirdScrollView addSubview:aImageView];
    [aImage release];
    aImage = nil;
    [aImageView release];
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    // setting the delegate to nil
    [_thirdScrollView setDelegate:nil];
    
    // releasing all UIScrollViews
    [_firstScrollView release], _firstScrollView = nil;
    [_secondScrollView release], _secondScrollView = nil;
    [_thirdScrollView release], _thirdScrollView = nil;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
     
    // support landscape orientation only
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
    
}



#pragma mark - UIScrollViewDelegate methods


- (void)scrollViewDidScroll:(UIScrollView *)scrollView 
{
    
    NSLog(@"Content offset x: %f", scrollView.contentOffset.x);
    NSLog(@"Content offset y: %f", scrollView.contentOffset.y);

    // speed factor could be either defined by a constant value..
    //
    // (for the scrolling of the first scrollview is a constant value used as the background
    // image is also covering the bounce areaes and should not be scrolled completely)
    float speedFactorFirst = 3.5f;
    
    // ..or by calculating the width ratio of both UIScrollViews
    //
    // (this scrolls the underlying scrollview in the same ratio as the top scrollview, e.g. if
    // the top scrollview is scrolled completely from left to right the underlying scrollview is
    // scrolled the same
    float speedFactorsecond = _secondScrollView.contentSize.width / scrollView.contentSize.width;
    
    // setting the x value of the contentOffset of the underlying scrollviews
    [_firstScrollView setContentOffset:CGPointMake(speedFactorFirst * scrollView.contentOffset.x, 0)];
    [_secondScrollView setContentOffset:CGPointMake(speedFactorsecond * scrollView.contentOffset.x, 0)];
    
}




@end
