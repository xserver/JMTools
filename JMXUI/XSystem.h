//
//  AppSystem.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
    app 的系统参数、设置
 */
@interface XSystem : NSObject

//  返回版本号整数, e.g. 6\7\8
+ (NSInteger)version;

+ (NSString *)appVersion;


//  iOS 6 、 7 的 windows 屏幕大小
+ (CGRect)applicationFrame;

//+ (BOOL)isIOS7;

@end
