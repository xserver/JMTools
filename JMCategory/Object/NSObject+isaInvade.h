//
//  NSObject+isaInvade.h
//  JMCategory
//
//  Created by xserver on 2016/11/11.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (isaInvade)


/**
 @return 成员变量列表
 */
+ (NSArray *)isaArrayOfIvars;


+ (NSArray *)isaArrayOfPropertyAttributes;

/**
 *  @return 属性列表
 */
+ (NSArray *)isaArrayOfProperties;


/**
 *  @return 实例方法列表
 */
+ (NSArray *)isaArrayOfInstanceMethods;


/**
 *  @return 类方法方法列表
 */
+ (NSArray *)isaArrayOfClassMethods;


/**
 *  @return 协议列表
 */
+ (NSArray *)isaArrayOfProtocols;

/**
 *  取得该工程所有类的列表
 *
 *  @return 该工程所有类的列表
 */
//+ (NSArray *)isaArrayOfAllClass;
//
//+ (NSArray *)arrayOfClassesWithPrefixs:(NSArray *)prefixs;
//
//+ (NSArray *)arrayOfSubClasses;


/**
 *  @return 该对象中有值的的property字典
 */
- (NSDictionary *)isaDictionaryOfPropertyKeyValues;


@end
