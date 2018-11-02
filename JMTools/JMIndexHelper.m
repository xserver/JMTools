//
//  JMIndexHelper.m
//  JMTools
//
//  Created by xserver on 16/3/19.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "JMIndexHelper.h"
#import <objc/message.h>

@implementation JMIndexHelper

+ (NSMutableDictionary *)indexsOfModelArray:(NSArray *)array property:(SEL)property {
    
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:26];
    static NSString * numbers = @"1234567890 !$%^&*(){}[]<>"; // 数字等符号归类为 #
    
    id (*getPropertySend)(id, SEL) = (void *)objc_msgSend;
    
    for (id aObject in array) {
        
        NSString *name = getPropertySend(aObject, property);
//        NSString *name = objc_msgSend(aObject, property);
        
        NSString *key;
        
        NSString *firstCharacter = name.length < 1 ? @"#" : [name substringToIndex:1];
        const char *utfString = [firstCharacter UTF8String];
        
        if (strlen(utfString) > 1) {
            //  汉字
            NSMutableString *mutableString = [NSMutableString stringWithString:firstCharacter];
            CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
            NSString *pingyin = [mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
            key = [pingyin substringToIndex:1];
        } else {
            key = firstCharacter;
        }
        
        if ([numbers containsString:key]) {
            key = @"#";
        }
        
        key = [key uppercaseString];
        
        NSMutableArray *section = [result objectForKey:key];
        if (section == nil) {
            section = [[NSMutableArray alloc] init];
            [result setObject:section forKey:key];
        }
        [section addObject:aObject];
    }
    
    //  对 # 内容排序
    NSArray *jinghao = [result objectForKey:@"#"];
    if (jinghao) {
        
        jinghao = [jinghao sortedArrayUsingComparator:^(id obj1, id obj2) {
            
            
            NSString *name1 = getPropertySend(obj1, property);
            NSString *name2 = getPropertySend(obj2, property);
            
            NSString *key1 = name1.length < 1 ? @"#" : [name1 substringToIndex:1];
            NSString *key2 = name2.length < 1 ? @"#" : [name2 substringToIndex:1];
            
            if ([key1 characterAtIndex:0] > [key2 characterAtIndex:0]) {
                return NSOrderedDescending;
            } else {
                return NSOrderedAscending;
            }
        }];
        
        [result setObject:jinghao forKey:@"#"];
    }
    
    return result;
}

+ (NSMutableArray *)sortKeysWithDictionary:(NSDictionary *)sections {
    
    if (sections) {
        NSMutableArray *keys = [NSMutableArray arrayWithArray:[[sections allKeys] sortedArrayUsingSelector:@selector(compare:)]];
        if ([keys containsObject:@"#"]) {
            [keys removeObject:@"#"];
            [keys addObject:@"#"];
        }
        return keys;
    }
    
    return nil;
}

@end
