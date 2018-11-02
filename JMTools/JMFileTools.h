//
//  JMFileTools.h
//  JMTools
//
//  Created by xserver on 16/1/10.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>

//  文件常用方法。这些不值得封装。
@interface JMFileTools : NSObject


+ (BOOL)createDirectory:(NSString *)path;
+ (BOOL)excludedBackupAtFilePath:(NSString *)path;


+ (long long)fileSizeAtPath:(NSString *)filePath;
+ (long long)directorySizeAtPath:(NSString*)dirPath;



+ (NSArray *)listDirectory:(NSString *)path;



//  in TemporaryDirectory/UUID
+ (NSString *)createTempFilePath;
+ (NSString *)createTempFilePathWithSuffix:(NSString *)suffix;

//  custom directory/UUID
+ (NSString *)createFilePathWithDirectory:(NSString *)directory;
@end
