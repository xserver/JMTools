//
//  JMTimeHelper.m
//  JMTools
//
//  Created by xserver on 15/4/6.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import "JMTimeHelper.h"

@implementation JMTimeHelper

+ (NSDateFormatter *)YYYY_MM_DD_HH_MM_SS {
    static NSDateFormatter *df;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        df = [[NSDateFormatter alloc] init];
        [df setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    });
    return df;
}

+ (NSDateFormatter *)YYYY_MM_DD_HH_MM {
    static NSDateFormatter *df;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        df = [[NSDateFormatter alloc] init];
        [df setDateFormat: @"yyyy-MM-dd HH:mm"];
    });
    return df;
}

+ (NSDateFormatter *)MM_DD_HH_MM {
    static NSDateFormatter *df;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        df = [[NSDateFormatter alloc] init];
        [df setDateFormat: @"MM-dd HH:mm"];
    });
    return df;
}

+ (NSDateFormatter *)HH_MM_SS_MM_DDYYYY {
    static NSDateFormatter *df;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        df = [[NSDateFormatter alloc] init];
        [df setDateFormat: @"HH:mm:ss MM-dd yyyy"];
    });
    return df;
}

+ (NSDateFormatter *)YYYY {
    static NSDateFormatter *df;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        df = [[NSDateFormatter alloc] init];
        [df setDateFormat: @"yyyy"];
    });
    return df;
}

+ (NSDateFormatter *)YYYY_MM_DD {
    static NSDateFormatter *df;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        df = [[NSDateFormatter alloc] init];
        [df setDateFormat: @"yyyy-MM-dd"];
    });
    return df;
}

+ (NSDateFormatter *)HH_MM_SS {
    static NSDateFormatter *df;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        df = [[NSDateFormatter alloc] init];
        [df setDateFormat: @"HH:mm:ss"];
    });
    return df;
}
+ (NSDateFormatter *)HH_MM {
    static NSDateFormatter *df;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        df = [[NSDateFormatter alloc] init];
        [df setDateFormat: @"HH:mm"];
    });
    return df;
}

+ (NSDateFormatter *)hh12_MM {
    static NSDateFormatter *df;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        df = [[NSDateFormatter alloc] init];
        df.AMSymbol = @"上午";
        df.PMSymbol = @"下午";
        [df setDateFormat: @"a hh:mm"];
    });
    return df;
}



+ (NSString *)niceDate:(NSDate *)date {
    
    if (date == nil) {
        return @"";
    }
    
    NSTimeInterval ti3 = [[NSDate date] timeIntervalSince1970] - [date timeIntervalSince1970];
    if (ti3 < 60 ) {
        return @"刚刚";
    }
    if (ti3 < 60 * 60) {
        return [NSString stringWithFormat:@"%d 分钟前", (int)(ti3 / 60)];
    }
    if (ti3 < 60 * 60 * 24) {
        return [NSString stringWithFormat:@"%d 小时前", (int)(ti3 / 3600)];
    }
    
    if (ti3 < 60 * 60 * 24 * 7) {
        return [NSString stringWithFormat:@"%d 天前", (int)(ti3 / 25200)];
    }
    
    return [[JMTimeHelper YYYY_MM_DD] stringFromDate:date];
}

//+ (NSString *)niceDate:(NSDate *)date {
//    
//    if (Object_is_Null(date)) {
//        return @"";
//    }
//    
//    NSTimeInterval ti3 = [[NSDate date] timeIntervalSince1970] - [date timeIntervalSince1970];
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
//    return [[JMTimeHelper YYYY_MM_DD] stringFromDate:date];
//}


+ (NSString *)niceDateFromChatTimestarmp:(NSString *)str {
    
    if (str.length == 0) {
        return @"";
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[str doubleValue]];
    
    NSString *someday = [[JMTimeHelper MM_DD_HH_MM] stringFromDate:date];
    NSString *today = [[JMTimeHelper MM_DD_HH_MM] stringFromDate:[NSDate date]];
    
    NSString *dd1 = [today substringWithRange:NSMakeRange(0, 5)];
    NSString *dd2 = [someday substringWithRange:NSMakeRange(0, 5)];
    
    if ([dd1 isEqualToString:dd2]) {
        //  同一天
        return [[JMTimeHelper hh12_MM] stringFromDate:date];
    }else{
        return someday;
    }
    
    return [[JMTimeHelper YYYY_MM_DD] stringFromDate:date];
}

+ (NSString *)niceDateFrom_HH_mm_ss:(NSDate *)date {
    return [[JMTimeHelper HH_MM_SS] stringFromDate:date];
}

+ (NSString *)niceDateFrom_HH_mm:(NSDate *)date {
    return [[JMTimeHelper HH_MM] stringFromDate:date];
}

+ (NSString *)niceDateFrom_12_HH_mm:(NSDate *)date {
    return [[JMTimeHelper hh12_MM] stringFromDate:date];
}

+ (NSString *)niceDateFrom_YYYY_MM_DD_HH_mm_ss:(NSDate *)date {
    return [[JMTimeHelper YYYY_MM_DD_HH_MM_SS] stringFromDate:date];
}
+ (NSString *)niceDateFrom_YYYY_MM_DD_HH_mm:(NSDate *)date {
    return [[JMTimeHelper YYYY_MM_DD_HH_MM] stringFromDate:date];
}

+ (NSString *)niceDateFrom_HH_MM_SS_MM_DDYYYY:(NSDate *)date {
    return [[JMTimeHelper HH_MM_SS_MM_DDYYYY] stringFromDate:date];
}

+ (NSString *)niceDateFrom_MM_DD_HH_MM:(NSDate *)date {
    return [[JMTimeHelper MM_DD_HH_MM] stringFromDate:date];
}

+ (BOOL)isToday:(NSDate *)date {
    NSString *today = [[JMTimeHelper YYYY_MM_DD] stringFromDate:[NSDate date]];
    NSString *theday = [[JMTimeHelper YYYY_MM_DD] stringFromDate:date];
    return [today isEqualToString:theday];
}

+ (BOOL)isThisYear:(NSDate *)date {
    NSString *thisYear = [[JMTimeHelper YYYY] stringFromDate:[NSDate date]];
    NSString *theYear = [[JMTimeHelper YYYY] stringFromDate:date];
    return [thisYear isEqualToString:theYear];
}

@end
