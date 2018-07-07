//
//  NSString+isaJson.h
//  JMCategory
//
//  Created by xserver on 2016/10/26.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (isaJson)

- (id)isaToJSON;
+ (NSString *)isaFromJsonObject:(id)json;

@end
