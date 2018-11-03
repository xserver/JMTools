//
//  NSString+isaValid.h
//  JMCategory
//
//  Created by xserver on 2016/10/29.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (isaValid)

@property (nonatomic, assign, readonly) BOOL isaValidEmail;
@property (nonatomic, assign, readonly) BOOL isaValidPhone;

@end
