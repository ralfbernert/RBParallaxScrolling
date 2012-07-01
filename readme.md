# ParallaxScrolling

Ralf Bernert

Website: http://www.bernertmedia.com

Twitter: [@ralfbernert](http://twitter.com/ralfbernert)

E-Mail: ralfbernert@gmx.de 


## What is it?
ParallaxScrolling is a simple example for parallax scrolling in Cocoa Touch / Objective-C based on several [UIScrollViews](http://developer.apple.com/library/ios/#documentation/uikit/reference/UIScrollView_Class/Reference/UIScrollView.html)

Parallax scrolling is a scrolling effect where several layers lie on top of each other and creating an illusion of depth in 2D by moving front layers faster then back layers while scrolling. The effect is best known from video games but is also heavily used for website designs the last couple of years.

On the iOS platform (iPhone/iPad) scrolling is one of the key features of the UI and so it is obvious that parallax scrolling is a pretty neat effect.

I got asked a couple of times how to implement the parallax scrolling effect with UIKit. I decided to put a demo on GitHub as the code for parallax scrolling is so simple thanks to the powerful `UIScrollViews` class.


## How does it work?

The concept is pretty simple: you stack a couple of UIScrollViews with different content sizes on each other. The UIScrollViews on top receives the user touches for scrolling the UIScrollView and controls the movement of the underlying UIScrollViews. 

In the UIScrollViewDelegate method of the top UIScrollViews

``` obj-c
- (void)scrollViewDidScroll:(UIScrollView *)scrollView 
```

you calculate the factors of the scrolling speed of the underlying UIScrollViews either manually e.g.

``` obj-c
float speedFactorFirst = 3.5f; 
```

or by calculation of the ratio of the content widths (for horizontal scrolling) or heights (for vertical scrolling) of the underlying UIScrollView and the one on top:

``` obj-c
float speedFactorsecond = _secondScrollView.contentSize.width / scrollView.contentSize.width;
```

If the factor is < 1 the underlying is moved slower, if > 1 it is moved faster.