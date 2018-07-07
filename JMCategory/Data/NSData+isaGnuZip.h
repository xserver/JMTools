//
//  NSData+isaGnuZip.h
//  JMCategory
//
//  Created by xserver on 2016/10/29.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (isaGnuZip)

- (NSData *)isaGnuZipInflate;
- (NSData *)isaGnuZipDeflate;

@end
