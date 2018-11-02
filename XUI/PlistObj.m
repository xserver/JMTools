//
//  PlistObj.m
//  Learning
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import "PlistObj.h"

@implementation PlistObj
{
    NSString *_path;
    
    NSMutableDictionary *_dic;
    BOOL changeFlag;
}

- (void)loadPlistWithFilePath:(NSString *)path {
    
    if (path == nil || [path isEqualToString:@""]) {
        return;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        _dic = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        changeFlag = NO;
    }
    else {
        _dic = [[NSMutableDictionary alloc] initWithCapacity:64];
        changeFlag = YES;
    }
    _path = path;
}

- (void)dealloc {
    [self synchronize];
    _dic = nil;
    _path = nil;
}

- (void)synchronize {
    if (changeFlag == NO) {
        return;
    }
    
    [_dic writeToFile:_path atomically:YES];
    changeFlag = NO;
}

- (void)cleanAll {
    [_dic removeAllObjects];
    changeFlag = YES;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if (value == nil) {
        value = [NSNull null];
    }
    
    [_dic setObject:value forKey:key];
    
    changeFlag = YES;
}

- (id)valueForKey:(NSString *)key {
    //  是否存在
    id obj = [_dic objectForKey:key];
    return obj;
}



@end
