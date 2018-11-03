//
//  NSTimer+isaPause.m
//  JMCategory
//
//  Created by xserver on 2016/10/29.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "NSTimer+isaPause.h"
#import <objc/runtime.h>

@implementation NSTimer (isaPause)

static char isaNSTimerPauseKey;

- (void)setIsaPause:(BOOL)isaPause {
    
    objc_setAssociatedObject(self, &isaNSTimerPauseKey, [NSNumber numberWithBool:isaPause], OBJC_ASSOCIATION_COPY);
    
    if (isaPause) {
        [self setFireDate:[NSDate distantFuture]];
    }else{
        [self setFireDate:[NSDate date]];
    }
}

- (BOOL)isaPause {
    
    NSNumber *pause = objc_getAssociatedObject(self, &isaNSTimerPauseKey);
    if (pause) {
        return [pause boolValue];
    } else {
        return NO;
    }
}

@end
