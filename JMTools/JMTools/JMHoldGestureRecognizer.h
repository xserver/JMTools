//
//  JMHoldGestureRecognizer.h
//  JMTools
//
//  Created by xserver on 15/12/29.
//  Copyright © 2015年 pitaya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface JMHoldGestureRecognizer : UIGestureRecognizer

@property (nonatomic) CFTimeInterval minimumPressDuration;

@end
