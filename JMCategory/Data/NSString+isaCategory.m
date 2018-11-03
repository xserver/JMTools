//
//  NSString+isaCategory.m
//  JMCategory
//
//  Created by xserver on 2016/10/29.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "NSString+isaCategory.h"
#import <CommonCrypto/CommonHMAC.h>

@implementation NSString (isaCategory)

#pragma mark - MD5
- (NSString *)isaMD5 {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSURL *)isaURL {
    NSString *url = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [NSURL URLWithString:url];
}

- (id)isaJson {
    
    if (self!= nil && self.length > 0) {
        NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error;
        
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        return json;
    }
    
    return nil;
}

- (NSString *)isaEncodedURLString {
    NSString * url = (__bridge_transfer  NSString*) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)self, NULL, (__bridge CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8);
    return url;
}

+ (NSString *)isaStringWithDouble:(double)value {
    return [NSString stringWithFormat:@"%f", value];
}

+ (NSString *)isaStringWithInteger:(NSInteger)value {
    return [NSString stringWithFormat:@"%ld", value];
}

+ (NSString *)isaStringWithJson:(id)json {
    
    if (json == nil || [json isEqual:[NSNull null]]) {
        return nil;
    }
    if ([json respondsToSelector:@selector(length)] && [json length] < 1) {
        return nil;
    }
    if ([NSJSONSerialization isValidJSONObject:json] == NO) {
        return nil;
    }
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:nil];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return str;
}



@end

/*
 
 - (UIImage *)imageResizableTileWithCapInsets:(UIEdgeInsets)capInsets {
 return [[UIImage imageNamed:self] resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeTile];
 }
 
 - (UIImage *)imageResizableStretchWithCapInsets:(UIEdgeInsets)capInsets {
 return [[UIImage imageNamed:self] resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch];
 }
 
 */


//- (NSArray *)findAllSubstringRange:(NSString *)sub {
//    
//    if (sub.length == 0 || self.length == 0 || sub.length > self.length) {
//        return nil;
//    }
//    
//    NSUInteger loc = 0;
//    NSInteger len = self.length;
//    NSMutableArray *ay = [NSMutableArray arrayWithCapacity:5];
//    
//    do {
//        NSRange range = [self rangeOfString:sub options:0 range:NSMakeRange(loc, len)];
//        if (range.length == 0) {
//            break;
//        }else {
//            [ay addObject:[NSValue valueWithRange:range]];
//            loc = range.length + range.location - 1;    //  NSMaxRange
//            len = len - loc;
//            
//            if (len <= 0) {
//                break;
//            }
//        }
//    } while (YES);
//    
//    return ay;
//}
