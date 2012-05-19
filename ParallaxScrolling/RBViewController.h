//
//  RBViewController.h
//  ParallaxScrolling
//
//  Created by Ralf Bernert on 18.05.12.
//  Copyright (c) 2012 bernert media DIGITAL MEDIA SERVICES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBViewController : UIViewController <UIScrollViewDelegate> {
    
    UIScrollView *_firstScrollView;
    UIScrollView *_secondScrollView;
    UIScrollView *_thirdScrollView;
    
}


@end
