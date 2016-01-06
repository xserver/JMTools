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


//  in NSLibraryDirectory
+ (NSString *)createTempFilePath;
+ (NSString *)createTempFilePathWithSuffix:(NSString *)suffix;



//  依赖 setup directory
- (NSString *)createFilePath;
- (NSString *)createFilePathWithSuffix:(NSString *)suffix;



//  support: NSData, UIImage
- (NSString *)saveObject:(id)object fileSuffix:(NSString *)suffix;

//  
@end