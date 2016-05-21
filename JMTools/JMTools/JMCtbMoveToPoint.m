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
    
    UIView *fromView = [[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey] view];
    UIView *toView = [[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey] view];
    UIView *containerView = [transitionContext containerView];  //  转场中间视图
    
    UIView *bg = [[UIView alloc] init];
    bg.backgroundColor = [UIColor blackColor];
    bg.frame = fromView.bounds;
    [containerView addSubview:bg];
    
    toView.frame = [[UIScreen mainScreen] bounds];
    
    [containerView addSubview:toView];
    [containerView addSubview:self.view];
    toView.hidden = YES;
    [UIView animateWithDuration:[self animationDuration] animations:^{
        
        CGFloat w0 = self.view.frame.size.width;
        CGFloat h0 = self.view.frame.size.height;
        CGFloat w1, h1;
        
        if (w0 > h0) {
            w1 = [[UIScreen mainScreen] bounds].size.width;
            h1 = h0/w0 * w1;
        } else {
            h1 = [[UIScreen mainScreen] bounds].size.height;
            w1 = w0/h0 * h1;
        }
        
        self.view.bounds = CGRectMake(0, 0, w1, h1);
        self.view.center = self.center;
        
    } completion:^(BOOL finished) {
        toView.hidden = NO;
        [self.view removeFromSuperview];
        self.view = nil;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
