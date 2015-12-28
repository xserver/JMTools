//
//  JMTimeHelper.h
//  JMCategory
//
//  Created by xserver on 15/4/6.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMTimeHelper : NSObject

+ (NSString *)niceDate:(NSDate *)date;

+ (NSString *)niceDateFromChatTimestarmp:(NSString *)date;

+ (NSString *)niceDateFrom_HH_mm_ss:(NSDate *)date;
+ (NSString *)niceDateFrom_HH_mm:(NSDate *)date;
+ (NSString *)niceDateFrom_12_HH_mm:(NSDate *)date;


+ (NSString *)niceDateFrom_MM_DD_HH_MM:(NSDate *)date;


+ (NSString *)niceDateFrom_YYYY_MM_DD_HH_mm_ss:(NSDate *)date;
+ (NSString *)niceDateFrom_YYYY_MM_DD_HH_mm:(NSDate *)date;
+ (NSString *)niceDateFrom_HH_MM_SS_MM_DDYYYY:(NSDate *)date;


+ (BOOL)isToday:(NSDate *)date;
+ (BOOL)isThisYear:(NSDate *)date;

@end
