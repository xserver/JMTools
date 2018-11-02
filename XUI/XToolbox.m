////
////  Toolbox.m
////  JMXUI
////
////  Created by xserver on 13/3/13.
////  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
////
//
//#import "XToolbox.h"
//#import "MBProgressHUD.h"
//
//@implementation XToolbox
//
//+ (UIAlertView *)alertWithTitle:(NSString *)title message:(NSString *)message {
//    
//    return [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
//}
//
//+ (MBProgressHUD *)showMessage:(NSString *)message view:(UIView *)view time:(CGFloat)time
//{
//    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
//    [view addSubview:hud];
//    
//    hud.mode = MBProgressHUDModeCustomView;
//    hud.labelText = message;
//    hud.customView = [[XUIeView alloc] initWithIJMXUIe:[XUIe iJMXUIeNamed:@"37x-Checkmark.png"]];
//    
//    [hud show:YES];
//    [hud hide:YES afterDelay:time];
//    
//    return hud;
//}
//
//+ (MBProgressHUD *)showMessageInWindow:(NSString *)message time:(CGFloat)time
//{
//    UIWindow *win = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
//    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:win];
//    [win addSubview:hud];
//    
//    hud.mode = MBProgressHUDModeCustomView;
//    hud.labelText = message;
//    hud.customView = [[XUIeView alloc] initWithIJMXUIe:[XUIe iJMXUIeNamed:@"37x-Checkmark.png"]];
//    
//    [hud show:YES];
//    [hud hide:YES afterDelay:time];
//    
//    return hud;
//}
//
//+ (void)showFlowerByWindowWithMessage:(NSString *)message {
//    
//    MBProgressHUD *hud = [MBProgressHUD sharedInstance];
//    [[UIApplication sharedApplication].keyWindow addSubview:hud];
//    hud.labelText = message;
//    
//    [hud show:YES];
//}
//
//+ (void)hideFlowerByWindow {
//    
//    [[MBProgressHUD sharedInstance] hide:YES];
//}
//
//+ (CGFloat)textHeight:(NSString *)text label:(UILabel *)lab {
//    
//    return [text sizeWithFont:lab.font forWidth:lab.frame.size.width lineBreakMode:lab.lineBreakMode].height;
//}
//
//+ (NSDateFormatter *)dateFormatter {
//    
//    static NSDateFormatter *df = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        df = [[NSDateFormatter alloc] init];
////        [df setDateStyle:NSDateFormatterMediumStyle];
////        [df setTimeStyle:NSDateFormatterShortStyle];
//        [df setDateFormat: @"yyyy-MM-dd"];
//    });
//    return df;
//}
//
//+ (NSDateFormatter *)dateFormatterForWeibo {
//
////    @"Mon Sep 30 14:39:27 +0800 2013"
////    星期 月 日 时分秒 时区 年
//    static NSDateFormatter *df = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        df = [[NSDateFormatter alloc] init];
//        [df setDateFormat: @"EEE MMM dd HH:mm:ss ZZ yyyy"];
//        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
//        [df setLocale:locale];
//    });
//    
//    return df;
//}
//
//+ (NSString *)niceDate:(NSTimeInterval)ti {
//    
//    NSTimeInterval ti3 = [[NSDate date] timeIntervalSince1970] - ti;
//    
//    if (ti3 < 60 ) {
//        return @"刚刚";
//    }
//    if (ti3 < 60 * 60) {
//        return [NSString stringWithFormat:@"%d 分钟前", (int)(ti3 / 60)];
//    }
//    if (ti3 < 60 * 60 * 24) {
//        return [NSString stringWithFormat:@"%d 小时前", (int)(ti3 / 3600)];
//    }
//    
//    if (ti3 < 60 * 60 * 24 * 7) {
//        return [NSString stringWithFormat:@"%d 天前", (int)(ti3 / 25200)];
//    }
//    
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:ti];
//    return [[XToolbox dateFormatter] stringFromDate:date];
//}
//
//+ (NSString *)niceDateWithWeibo:(NSString *)ts {
//    
//    NSTimeInterval ti = [XToolbox timeIntervalWithStringForSina:ts];
//    return [XToolbox niceDate:ti];
//}
//
//+ (NSTimeInterval)timeIntervalWithStringForSina:(NSString *)timeString {
//
//    NSDate *date = [[XToolbox dateFormatterForWeibo] dateFromString:timeString];
//    NSLog(@"%@", [date description]);
//    NSTimeInterval ti = [date timeIntervalSince1970];
//    return ti;
//}
//
//+ (NSMutableArray *)separatedArray:(NSArray *)array size:(NSInteger)size {
//
//    if (size <= 0 || array == nil) {
//        return nil;
//    }
//    
//    if (size >= array.count) {
//        return nil;
//    }
//    
//    NSInteger count = array.count / size;
//    if (array.count % size != 0) {
//        count++;
//    }
//
//    NSMutableArray *list = [NSMutableArray arrayWithCapacity:count];
//    for (int i = 0; i < count; i++) {
//        
//        NSMutableArray *sub = [NSMutableArray arrayWithCapacity:size];
//        for (int j = 0; j < size; j++) {
//            NSInteger index = i * size + j;
//            if (index < array.count) {
//                [sub addObject:[array objectAtIndex:index]];
//            }else{
//                break;
//            }
//        }
//        [list addObject:sub];
//    }
//    
//    return list;
//}
//@end
