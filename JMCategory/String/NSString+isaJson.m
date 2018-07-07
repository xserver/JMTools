//
//  NSString+isaJson.m
//  JMCategory
//
//  Created by xserver on 2016/10/26.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "NSString+isaJson.h"

@implementation NSString (isaJson)

- (id)isaToJSON {
    
    if (self!= nil && self.length > 0) {
        NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error;
        
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        return json;
    }
    
    return nil;
}

+ (NSString *)isaFromJSONObject:(id)json {
    
    if (json == nil || [json isEqual:[NSNull null]]) {
        return @"";
    }
    
    if ([json respondsToSelector:@selector(length)] && [json length] < 1) {
        return @"";
    }
    
    if ([NSJSONSerialization isValidJSONObject:json] == NO) {
        return @"";
    }
    
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:json options:0 error:nil];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}

@end
