//
//  NSDictionary+isaJson.m
//  JMCategory
//
//  Created by xserver on 2016/10/29.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "NSDictionary+isaJson.h"

@implementation NSDictionary (isaJson)

- (NSString *)isaJsonString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

@end
