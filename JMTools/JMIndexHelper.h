//
//  JMIndexHelper.h
//  JMTools
//
//  Created by xserver on 16/3/19.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  对 model 提供排序，分组
 */
@interface JMIndexHelper : NSObject

/**
 *  将一个model数组，转化为使用首字母为Key的字典
 *
 *  @param array    对象的数组
 *  @param property 名字的字段
 *
 *  @return 返回字典
 */
+ (NSMutableDictionary *)indexsOfModelArray:(NSArray *)array property:(SEL)property;


/**
 *  对索引排序，并把#移到最后
 *
 *  @param sections 数据源
 *
 *  @return 排序后的索引
 */
+ (NSMutableArray *)sortKeysWithDictionary:(NSDictionary *)sections;

@end
