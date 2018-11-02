//
//  XIJMXUIeView.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XIJMXUIeView : UIView

+ (instancetype)showInView:(UIView *)view iJMXUIe:(XUIe *)iJMXUIe;
+ (instancetype)showInView:(UIView *)view iJMXUIeURL:(NSURL *)url;

+ (void)close;

@end
