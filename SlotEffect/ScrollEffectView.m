//
//  ScrollEffectView.m
//
//  Created by Takeshi Kawai on 12/01/01.
//  Copyright (c) 2012年 None. All rights reserved.
//

#import "ScrollEffectView.h"
#import <QuartzCore/CoreAnimation.h>

@implementation ScrollEffectView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // initilize
        [self initImageList];
    }
    return self;
}

- (void)initImageList{
    _baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kImageWidth, kImageHeight)];
    
    UIImage* image;
    UIImageView* imageView;
    srand((unsigned)time(NULL));
    offset = 0;
    for (int i=1 ; i <= kNumberOfStyles*10 ; i++)
    {
        NSString *numStr = [NSString stringWithFormat:@"%02d.jpg",rand()%kNumberOfStyles+1];
        image = [UIImage imageNamed:numStr];
        imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(0, offset, kImageWidth, kImageHeight);
        
        [_baseView addSubview:imageView];        
        offset += kImageHeight;
    }
    
    [self addSubview:_baseView];
    
    // Layer
    CALayer *layer = self.layer;
    // 最終的に表示したい絵をここで設定しておく
    //layer.contents = (id)image.CGImage;
//    layer.opacity = 1.0f;
    layer.opaque = YES;
    
    layer.bounds = CGRectMake(0, 0, kImageWidth, kImageHeight);
    layer.masksToBounds = YES;
}

// start animation
- (void)startAnimation
{
    [self initImageList];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [_baseView setCenter:CGPointMake(kImageWidth/2, -kImageHeight/2)];
    
    // setting animation
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationDuration:kAnimationDuration];
    [UIView setAnimationRepeatCount:0.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
    
    [_baseView setCenter:CGPointMake(kImageWidth/2, -(kImageHeight*kNumberOfStyles*(10-1))+kImageHeight/2)];
    
    // commit animation
    [UIView commitAnimations];
}

// stop animation
- (void)endAnimation
{
    //[_baseView removeFromSuperview];
}

@end
