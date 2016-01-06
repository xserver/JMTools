//
//  JMFileStorage.m
//  JMTools
//
//  Created by jim on 16/1/6.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "JMFileStorage.h"
#import <UIKit/UIKit.h>

@interface JMFileStorage ()

@property (nonatomic, copy) NSString *directory;

@end


@implementation JMFileStorage

- (instancetype)initWithDirectory:(NSString *)path {
    if (self = [super init]) {
        self.directory = path;
    }
    return self;
}

#pragma mark == path
+ (NSString *)createTempFilePath {
    
    NSString *library = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //  NSTemporaryDirectory()
    return [self createTempFilePathWithDirectory:library];
}

+ (NSString *)createTempFilePathWithSuffix:(NSString *)suffix {
    return [NSString stringWithFormat:@"%@.%@", [self createTempFilePath], suffix];
}

+ (NSString *)createTempFilePathWithDirectory:(NSString *)directory {
    
    NSString *path = nil;
    NSFileManager *fm = [NSFileManager defaultManager];
    
    while(path == nil || [fm fileExistsAtPath:path]) {
        path = [NSString stringWithFormat:@"%@/%@", directory, [[NSUUID UUID] UUIDString]];
    }
    
    return path;
}

+ (BOOL)createDirectory:(NSString *)path {
    
    if ( ![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:path
                                                 withIntermediateDirectories:YES
                                                                  attributes:nil
                                                                       error:nil];
        return success;
    }
    return NO;
}

+ (NSArray *)listDirectory:(NSString *)path {
    NSMutableArray *filenamelist = [NSMutableArray arrayWithCapacity:10];
    NSArray *tmplist = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    
    for (NSString *filename in tmplist) {
        [filenamelist addObject:[path stringByAppendingPathComponent:filename]];
    }
    
    return filenamelist;
}

#pragma mark - self
- (NSString *)createFilePath {
    return [JMFileStorage createTempFilePathWithDirectory:self.directory];
}

- (NSString *)createFilePathWithSuffix:(NSString *)suffix {
    return [NSString stringWithFormat:@"%@.%@", [self createFilePath], suffix];
}

- (NSString *)copyFileToHere:(NSString *)file {
    
    NSError *error;
    NSString *path = [self createFilePath];
    if ([[NSFileManager defaultManager] copyItemAtPath:file toPath:path error:&error]) {
        return path;
    }

    NSLog(@"error copying file: %@", [error localizedDescription]);
    return nil;
}

#pragma mark == save
- (NSString *)saveObject:(id)object fileSuffix:(NSString *)suffix {

    if ([object isKindOfClass:[NSData class]]) {
        return [self saveData:object fileSuffix:suffix];
    }
    
    if ([object isKindOfClass:[UIImage class]]) {
        return [self saveData:UIImagePNGRepresentation(object) fileSuffix:suffix];
    }
    
    return nil;
}

- (NSString *)saveData:(NSData *)data fileSuffix:(NSString *)suffix {
    
    NSString *file = [self createFilePathWithSuffix:suffix];
    if ([data writeToFile:file atomically:YES]) {
        return file;
    }
    return nil;
}


- (void)copyFileToDocuments:(NSURL *)fileURL {
    
//    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];

//    NSError	*error;
//    [[NSFileManager defaultManager] copyItemAtURL:fileURL toURL:[NSURL fileURLWithPath:destinationPath] error:&error];
    
//    - (BOOL)copyItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError **)error NS_AVAILABLE(10_6, 4_0);
//    - (BOOL)moveItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError **)error NS_AVAILABLE(10_6, 4_0);
    
//    - (BOOL)copyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **)error NS_AVAILABLE(10_5, 2_0);
//    - (BOOL)moveItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **)error NS_AVAILABLE(10_5, 2_0);
}
@end
