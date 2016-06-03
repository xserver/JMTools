//
//  JMControllerTransitionPush.m
//  JMTools
//
//  Created by xserver on 16/5/20.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "JMControllerTransitionPush.h"

@implementation JMControllerTransitionPush

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
//    UIViewController *fromCtrl = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIView *fromView = fromCtrl.view;
    
    UIViewController *toCtrl = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toCtrl.view;

    UIView *containerView = [transitionContext containerView];  //  转场中间视图
    
    [containerView addSubview:toView];
    [containerView addSubview:self.zoomView];
    
    toView.hidden = YES;
    
    [UIView animateWithDuration:[self animationDuration] animations:^{

        self.zoomView.frame = [[UIScreen mainScreen] bounds];

    } completion:^(BOOL finished) {
        toView.hidden = NO;
        [self.zoomView removeFromSuperview];
        self.zoomView = nil;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
