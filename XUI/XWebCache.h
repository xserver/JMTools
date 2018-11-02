//
//  XWebCache.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XWebCache : NSURLCache

+ (instancetype)sharedInstance;

- (BOOL)existsAtURL:(NSURL *)url;
- (NSData *)dataForURL:(NSURL *)url;

- (void)removeAllCached;
@end
