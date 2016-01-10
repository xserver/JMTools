//
//  JMDirectoryMan.h
//  JMTools
//
//  Created by xserver on 16/1/6.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>

//  管理一个目录
@interface JMDirectoryMan : NSObject

@property (nonatomic, copy, readonly) NSString *directory;
@property (nonatomic, assign, readonly) long long size;


- (instancetype)initWithDirectory:(NSString *)path;


//  依赖 setup directory
- (NSString *)createFilePath;
- (NSString *)createFilePathWithSuffix:(NSString *)suffix;

- (NSString *)copyFileToHere:(NSString *)file;


//  support: NSData, UIImage, 
- (NSString *)saveObject:(id)object fileSuffix:(NSString *)suffix;


@end
