//
//  XUIToolbar.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TouchedWithIndex)(NSUInteger);


//  来个 数据对象，使之关联，最加上 KVO，那么就方便了
@interface XUIToolbar : UIView

+ (instancetype)makeObjWithCount:(int)count;

+ (instancetype)businessStyleWeb;
+ (instancetype)businessStyleCell;
+ (instancetype)businessStyleByMagazine;

+ (instancetype)businessStyleTabBar;
//  [0-4]
@property (copy, nonatomic) TouchedWithIndex toolbarEvent;
@property (weak, nonatomic) IBOutlet UIImageView *bgView;
@property (strong, nonatomic) UIImage *backgroundImage;

- (void)setTitle:(NSString *)title forState:(UIControlState)state atIndex:(NSInteger)index;
- (void)setImage:(UIImage *)image  forState:(UIControlState)state atIndex:(NSInteger)index;

- (void)setTitles:(NSArray *)titles forState:(UIControlState)state;
- (void)setImages:(NSArray *)images forState:(UIControlState)state;

- (void)setState:(UIControlState)state atIndex:(NSInteger)index;

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;
- (void)setTitleFont:(UIFont *)font;


- (NSArray *)buttons;
- (UIButton *)buttonAtIndex:(NSInteger)index;

@end
