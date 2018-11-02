////
////  XWebCache.m
////  JMXUI
////
////  Created by xserver on 13/3/13.
////  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
////
//
//#import "XWebCache.h"
//#import "NSString+XPath.h"
//
//@interface XWebCache ()
//@property (copy, nonatomic) NSString *directory;
//@end
//
//@implementation XWebCache
//
//+ (instancetype)sharedInstance {
//    static id obj;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//
//        obj = [[XWebCache alloc] init];
//        
////        NSArray *array = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
////        NSString *path = [[array objectAtIndex:0] stringByAppendingPathComponent:@"webCache"];
////        
////        if ([[NSFileManager defaultManager] fileExistsAtPath:path] == NO) {
////            [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
////        }
////        
////        obj = [[XWebCache alloc] initWithMemoryCapacity:4 * 1024 * 1024
////                                           diskCapacity:50* 1024 * 1024 diskPath:path];
//        
//    });
//    return obj;
//}
//
//- (id)init {
//    if (self == [super init]) {
//        
//        NSArray *array = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//        NSString *path = [[array objectAtIndex:0] stringByAppendingPathComponent:@"webCache"];
//        
//        if ([[NSFileManager defaultManager] fileExistsAtPath:path] == NO) {
//            [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
//        }
//        self.directory = path;
//        [[NSURLCache sharedURLCache] setMemoryCapacity:1024*1024*10];
//        [[NSURLCache sharedURLCache] setDiskCapacity:  1024*1024*50];
//    }
//    return self;
//}
//
////- (NSString *)directory {
////    if (_directory == nil) {
////        NSArray *array = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
////        _directory = [[array objectAtIndex:0] stringByAppendingPathComponent:@"webCache"];
////    }
////    return _directory;
////}
//
//- (NSString *)filePathForURL:(NSURL *)url {
//    //缓存文件（根据url选择缓存文件名）
//    NSString *file = [url.absoluteString md5];
//    NSString *path = [self.directory stringByAppendingPathComponent:file];
//    return path;
//}
//
////判断是否存在缓存数据
//- (BOOL)existsAtURL:(NSURL *)url {
//
//    NSString *cacheFile = [self filePathForURL:url];
//    return [[NSFileManager defaultManager] fileExistsAtPath:cacheFile];
//}
//
////获取缓存数据
//- (NSData *)dataForURL:(NSURL *)url {
//
//    if ([self existsAtURL:url]) {
//        NSString *file = [self filePathForURL:url];
//        NSData *data = [NSData dataWithContentsOfFile:file];
//        return data;
//    }else{
//        return nil;
//    }
//}
//
////  保存缓存数据
//- (void)storeData:(NSData *)data forURL:(NSURL *)url {
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSString *cacheFile = [self filePathForURL:url];
////        BOOL status =
//        [data writeToFile:cacheFile atomically:YES];
////        NSLog(@"write = %d", status);
////        NSLog(@"%@",url);
//    });
//}
//
//
////  重写父类方法，在响应请求时，先判断是否有缓存，如果有的话，从缓存中读取数据。
//- (NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request {
//    
//    NSURL *url = request.URL;
//    if ([url.absoluteString isEqualToString:@"http://oc.umeng.com/check_config_update"]) {
//        return [super cachedResponseForRequest:request];
//    }
//    
//    if([self existsAtURL:url]) {
//        //  text/html;
////"Content-Type" = "iJMXUIe/jpeg";
//        NSData *data = [self dataForURL:url];
//        NSURLResponse *response = [[NSURLResponse alloc] initWithURL:url
//                                                            MIMEType:@"text/html"
//                                               expectedContentLength:[data length]
//                                                    textEncodingName:@"utf-8"];
//        return [[NSCachedURLResponse alloc] initWithResponse:response data:data];
//    }
//    
//    return [super cachedResponseForRequest:request];
//}
//
//
////重写父类方法，保存缓存数据到自己设置的缓存目录下。
//- (void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse forRequest:(NSURLRequest *)request {
////    TODO: 重要
////    NSLog(@"%@", cachedResponse.response);
//    [self storeData:cachedResponse.data forURL:request.URL];
//}
//
//- (NSURLRequest *) generateKeyForRequest:(NSURLRequest *)request {
//    return [NSURLRequest requestWithURL:request.URL cachePolicy:request.cachePolicy timeoutInterval:60];
//}
//
//- (void)removeAllCached {
//    [super removeAllCachedResponses];
//    
//    [[NSFileManager defaultManager] removeItemAtPath:self.directory error:nil];
//    [[NSFileManager defaultManager] createDirectoryAtPath:self.directory
//                              withIntermediateDirectories:YES
//                                               attributes:nil
//                                                    error:NULL];
//}
//
//
//@end
