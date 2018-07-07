//
//  NSObject+isaInvade.m
//  JMCategory
//
//  Created by xserver on 2016/11/11.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "NSObject+isaInvade.h"
#import <objc/runtime.h>

@implementation NSObject (isaInvade)

+ (NSArray *)isaArrayOfIvars {
    
    unsigned int count = 0;
    Ivar *ivar = class_copyIvarList([self class], &count);
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        Ivar iva = ivar[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(iva)];
        [list addObject:ivarName];
    }
    
    free(ivar);
    return list;
}

+ (NSArray *)isaArrayOfPropertyAttributes {
    
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList(self, &count);
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        
        objc_property_t property = properties[i];
        const char *attr = property_getAttributes(property);
        
        NSMutableString *strings = [NSMutableString stringWithFormat:@"%@", [NSString stringWithUTF8String:attr]];
        
        [strings replaceOccurrencesOfString:@"\"" withString:@""
                                    options:NSCaseInsensitiveSearch range:NSMakeRange(0, strings.length)];
        
        [strings replaceOccurrencesOfString:@"@" withString:@","
                                    options:NSCaseInsensitiveSearch range:NSMakeRange(0, strings.length)];
        
        [strings replaceOccurrencesOfString:@"_" withString:@","
                                    options:NSCaseInsensitiveSearch range:NSMakeRange(0, strings.length)];
        
        NSArray *attrs = [strings componentsSeparatedByString:@","];
        
        [list addObject:attrs];
    }
    
    free(properties);
    return list;
    
}

+ (NSArray *)isaArrayOfProperties {
    
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList(self, &count);
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        [list addObject:propertyName];
    }
    
    free(properties);
    return list;
}

+ (NSArray *)isaArrayOfInstanceMethods {
    
    unsigned int count = 0;
    Method *methods = class_copyMethodList(self, &count);
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:count];
    
    for (NSInteger i = 0; i < count; i++) {
        NSString *selector = NSStringFromSelector(method_getName(methods[i]));
        [list addObject:selector];
    }
    
    free(methods);
    return list;
}

+ (NSArray *)isaArrayOfClassMethods {
    
    unsigned int count = 0;
    Method *methods = class_copyMethodList(object_getClass(self), &count);
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:count];
    
    for (NSInteger i = 0; i < count; i++) {
        NSString *selector = NSStringFromSelector(method_getName(methods[i]));
        [list addObject:selector];
    }
    
    free(methods);
    return list;
}

+ (NSArray *)isaArrayOfProtocols {
    
    unsigned int count = 0;
    Protocol * __unsafe_unretained *protocols = class_copyProtocolList(self, &count);
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i++) {
        [list addObject:[NSString stringWithUTF8String:protocol_getName(protocols[i])]];   
    }
    free(protocols);
    return list;
}

- (NSDictionary *)isaDictionaryOfPropertyKeyValues {
    
    NSArray *properties = [[self class] isaArrayOfProperties];
    NSMutableDictionary *info = [NSMutableDictionary dictionaryWithCapacity:properties.count];
    
    for (NSInteger i = 0; i < properties.count; i++) {
        if ([self valueForKey:properties[i]]) {
            [info setObject:[self valueForKey:properties[i]] forKey:properties[i]];
        }
    }
    return info;
}

@end
