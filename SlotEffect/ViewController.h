//
//  ViewController.h
//  SlotEffect
//
//  Created by Takeshi Kawai on 12/01/01.
//  Copyright (c) 2012年 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollEffectView.h"

@interface ViewController : UIViewController<ScrollEffectViewDelegate>
{
    ScrollEffectView        *effectView;
}

- (IBAction)startAction:(id)sender;

@end
