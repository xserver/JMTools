//
//  PlistObj.h
//  Learning
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistObj : NSObject

@property(nonatomic, copy, readonly) NSString *path;

- (void)loadPlistWithFilePath:(NSString *)path;

- (void)setValue:(id)value forKey:(NSString *)key;
- (id)valueForKey:(NSString *)key;


- (void)synchronize;
- (void)cleanAll;

@end
