//
//  UINavigationController+isaPop.m
//  JMCategory
//
//  Created by xserver on 2016/10/29.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "UINavigationController+isaPop.h"

@implementation UINavigationController (isaPop)

- (UIViewController *)isaPopViewControllerWithCount:(NSInteger)count {
    
    if (count >= self.viewControllers.count) {
        return nil;
    }
    
    NSInteger index = self.viewControllers.count - count -1;    //  count = 1
    if (index < 0) {
        index = 0;
    }
    UIViewController *target = [self.viewControllers objectAtIndex:index];
    [self popToViewController:target animated:YES];
    return target;
}

@end
