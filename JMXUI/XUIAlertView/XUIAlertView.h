////
////  XUIAlertView.h
////  JMXUI
////
////  Created by xserver on 13/3/13.
////  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
////
//
//#import <UIKit/UIKit.h>
//
////typedef void(^AlertNosBlock)(void);
////typedef void(^AlertYesBlock)(void);
//
//@interface XUIAlertView : UIView
//
//@property (copy, nonatomic) dispatch_block_t yesAction;
//@property (copy, nonatomic) dispatch_block_t nosAction; //cancle
//
//@property (strong, nonatomic) XUIe *titleIJMXUIe;
//@property (strong, nonatomic) XUIe *contentIJMXUIe;
//@property (strong, nonatomic) XUIe *buttonIJMXUIe;
//
////+ (void)setTitleIJMXUIe:(XUIe *)iJMXUIe;
////+ (void)setContentIJMXUIe:(XUIe *)iJMXUIe;
//
////  yesTitle 优先使用
//+ (instancetype)makeObjWithTitle:(NSString *)title
//                         message:(NSString *)message
//                        yesTitle:(NSString *)yes
//                        nosTitle:(NSString *)nos;
//
//- (void)show;
//- (void)hide;
//@end
//
//
//@interface XUIAlertView (business)
//
//+ (instancetype)businesWithTitle:(NSString *)title
//                         message:(NSString *)message
//                        yesTitle:(NSString *)yes
//                        nosTitle:(NSString *)nos;
//
//
//@end