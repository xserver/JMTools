//
//  AppSystem.m
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import "XSystem.h"

@implementation XSystem

+ (NSInteger)version {
    
    NSString *version = [[UIDevice currentDevice] systemVersion];
    
    NSRange range = [version rangeOfString:@"."];
    
    version = [version substringToIndex:range.location];
    
    return [version integerValue];
}

+ (NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

/*
if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
    // Load resources for iOS 6.1 or earlier
} else {
    // Load resources for iOS 7 or later
}
*/

+ (CGRect)applicationFrame {
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        return [[UIScreen mainScreen] applicationFrame];
    } else {
//        return CGRectMake(0, 0, XWidth, XHigth);
        return CGRectZero;
    }
}


@end
