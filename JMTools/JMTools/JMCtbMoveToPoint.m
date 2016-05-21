//
//  JMCtbMoveToPoint.m
//  JMTools
//
//  Created by Dragon on 16/5/21.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "JMCtbMoveToPoint.h"

@implementation JMCtbMoveToPoint

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
        UIViewController *fromCtrl = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIView *fromView = fromCtrl.view;
    
    UIViewController *toCtrl = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toCtrl.view;
    
    UIView *containerView = [transitionContext containerView];  //  转场中间视图
    
//    [containerView addSubview:fromView];
    [containerView addSubview:toView];
    [containerView addSubview:self.view];
    
    toView.hidden = YES;
    
    [UIView animateWithDuration:[self animationDuration] animations:^{
        
        self.view.center = self.center;
        
    } completion:^(BOOL finished) {
        toView.hidden = NO;
        [self.view removeFromSuperview];
        self.view = nil;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
