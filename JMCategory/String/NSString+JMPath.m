//
//  NSString+JMPath.m
//  JMCategory
//
//  Created by xserver on 15/6/12.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import "NSString+JMPath.h"

@implementation NSString (JMPath)
+ (NSString *)pathDocuments {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

+ (NSString *)pathLibrary {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}


+ (NSString *)pathTemporary {
    return NSTemporaryDirectory();
}

+ (NSString *)pathCaches {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

+ (NSString *)pathPreferences {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

#pragma mark setting
+ (NSString *)pathSettingMessage {
    //    NSURL*url=[NSURL URLWithString:@"prefs:root=MESSAGES"];
    //    [[UIApplication sharedApplication] openURL:url];
    return @"prefs:root=MESSAGES";
}

- (NSString *) transformBundlePNGImage {
    return [[NSBundle mainBundle] pathForResource:self ofType:@"png"];
}
@end
