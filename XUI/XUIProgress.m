////
////  XUIProgress.m
////  JMXUI
////
////  Created by xserver on 13/3/13.
////  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
////
//
//#import "XUIProgress.h"
//#import "MBProgressHUD.h"
//
//@interface XUIProgress ()
//@property (strong, nonatomic) MBProgressHUD *hud;
//@end
//
//@implementation XUIProgress
//
//+ (instancetype)sharedInstance {
//    static id obj = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        obj = [[XUIProgress alloc] init];
//    });
//    
//    return obj;
//}
//- (id)init {
//    if (self = [super init]) {
//    }
//    return self;
//}
//
//- (void)showInView:(UIView *)view {
//    if (_hud != nil) {
//        [_hud hide:YES];
//        _hud = nil;
//    }
//
//    _hud = [[MBProgressHUD alloc] initWithView:view];
//    [view addSubview:_hud];
//    [_hud show:YES];
//}
//
//- (void)showInWindow {
//    
//    if (_hud != nil) {
//        [_hud hide:YES];
//        _hud = nil;
//    }
//    UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
//    _hud = [[MBProgressHUD alloc] initWithWindow:window];
//    [window addSubview:_hud];
//    
////    _hud.mode = MBProgressHUDModeCustomView;
////    hud.labelText = message;
////    hud.customView = [[XUIeView alloc] initWithIJMXUIe:[XUIe iJMXUIeNamed:@"37x-Checkmark.png"]];
//    
//    [_hud show:YES];
//}
//
//- (void)hide {
//    if (_hud != nil) {
//        [_hud hide:YES];
//        _hud = nil;
//    }
//}
//@end
