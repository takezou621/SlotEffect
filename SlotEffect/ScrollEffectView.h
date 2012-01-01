//
//  ScrollEffectView.h
//
//  Created by Takeshi Kawai on 12/01/01.
//  Copyright (c) 2012年 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kNumberOfStyles 10
#define kImageHeight    62
#define kImageWidth     62
#define kAnimationDuration  6.0

@interface ScrollEffectView : UIView
{
    UIView      *_baseView;
    int         offset;
}
- (void)initImageList;
- (void)startAnimation;
- (void)endAnimation;

@end
