//
//  JMFileStorage.h
//  JMTools
//
//  Created by jim on 16/1/6.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMFileStorage : NSObject

@property (nonatomic, copy, readonly) NSString *directory;

- (instancetype)initWithDirectory:(NSString *)path;


//  in NSLibraryDirectory + .JMStoreDir
+ (NSString *)createTempFilePath;
+ (NSString *)createTempFilePathWithSuffix:(NSString *)suffix;

+ (BOOL)createDirectory:(NSString *)path;
+ (NSArray *)listDirectory:(NSString *)path;



//  依赖 setup directory
- (NSString *)createFilePath;
- (NSString *)createFilePathWithSuffix:(NSString *)suffix;

- (NSString *)copyFileToHere:(NSString *)file;


//  support: NSData, UIImage
- (NSString *)saveObject:(id)object fileSuffix:(NSString *)suffix;

//  
@end
