//
//  JMTools.h
//  JMTools
//
//  Created by xserver on 15/4/6.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JMChooseImageHelper : NSObject

@property (assign, nonatomic) BOOL allowsEditing;
@property (assign, nonatomic) BOOL onlyUseCamera;   //  default NO
@property (assign, nonatomic) BOOL onlyUsePhoto;    //  default NO

//  权限提醒
+ (instancetype)makeWithController:(UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate> *)ctrl;

- (void)show;

@end
