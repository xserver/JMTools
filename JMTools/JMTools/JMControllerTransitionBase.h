//
//  JMControllerTransitionBase.h
//  JMTools
//
//  Created by xserver on 16/5/20.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JMControllerTransitionBase : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) NSTimeInterval animationDuration;

@end
