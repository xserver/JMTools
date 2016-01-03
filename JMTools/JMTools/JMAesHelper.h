//
//  JMAesHelper.h
//  JMCategory
//
//  Created by jim on 15/8/28.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMAesHelper : NSObject

/*
 No Padding              = 0x0000,  √
 kCCOptionPKCS7Padding   = 0x0001,
 kCCOptionECBMode        = 0x0002
 
 iv = optional
 */
+ (NSData *)encryptData:(NSData *)data aes128WithKey:(NSString *)key vector:(NSString *)iv;
+ (NSData *)decryptData:(NSData *)data aes128WithKey:(NSString *)key vector:(NSString *)iv;

@end
