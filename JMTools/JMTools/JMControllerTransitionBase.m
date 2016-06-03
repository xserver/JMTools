//
//  JMControllerTransitionBase.m
//  JMTools
//
//  Created by xserver on 16/5/20.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "JMControllerTransitionBase.h"

@implementation JMControllerTransitionBase

- (id)init {
    if (self = [super init]) {
        self.animationDuration = 0.25;
    }
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning Delegate

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return self.animationDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    //  子类覆盖
}

@end
