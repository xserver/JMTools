//
//  XUIProgress.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XUIProgress : NSObject

+ (instancetype)sharedInstance;
- (void)showInView:(UIView *)view;
- (void)showInWindow;
- (void)hide;

@end
