//
//  NSString+isaCategory.h
//  JMCategory
//
//  Created by xserver on 2016/10/29.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIImage;

@interface NSString (isaCategory)

@property (nonatomic, readonly) NSString *isaMD5;
@property (nonatomic, readonly) NSURL    *isaURL;
@property (nonatomic, readonly) NSString *isaJson;
//@property (nonatomic, readonly) UIImage  *isaBundleImagePNG;

- (NSString *)isaEncodedURLString;

+ (NSString *)isaStringWithDouble:(double)value;
+ (NSString *)isaStringWithInteger:(NSInteger)value;
+ (NSString *)isaStringWithJson:(id)json;

@end
