//
//  UIButton+isaCategory.m
//  JMCategory
//
//  Created by xserver on 2016/11/16.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "UIButton+isaCategory.h"

@implementation UIButton (isaCategory)

- (void)isaDisabledDelaySeconds:(NSTimeInterval)delay {

    self.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.userInteractionEnabled = YES;
    });
}

@end
