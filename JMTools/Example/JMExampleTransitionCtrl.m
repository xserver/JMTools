//
//  JMExampleTransitionCtrl.m
//  JMTools
//
//  Created by Dragon on 16/5/20.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "JMExampleTransitionCtrl.h"

@interface JMExampleTransitionCtrl ()



@end

@implementation JMExampleTransitionCtrl

//- (instancetype)init {
//    if (self = [super init]) {
//        self.navigationController.delegate = self;
//    }
//    
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.contentImage.image = self.image;
}
#pragma mark - Propertys

//- (id)pushTransition {
//    if (!_pushTransition) {
//        _pushTransition = [[JMControllerTransitionPush alloc] init];
//    }
//    return _pushTransition;
//}

- (id)popTransition {
    if (!_popTransition) {
        _popTransition = [[NSObject alloc] init];
    }
    return _popTransition;
}

#pragma mark - UIViewControllerInteractiveTransitioning

//- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
//    if (self.panGestureRecognizerEnable) {
//        return self.interactionController;
//    } else {
//        return nil;
//    }
//}

#pragma mark - UIViewControllerAnimatedTransitioning
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    
    
    if (operation == UINavigationControllerOperationPush) {
        return self.pushTransition;
    } else if (operation == UINavigationControllerOperationPop) {
//        return self.popTransition;
    }
    return nil;
}



@end
