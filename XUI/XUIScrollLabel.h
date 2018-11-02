//
//  XUIScrollLabel.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XUIScrollLabel;

typedef void(^TouchTextBolck)(NSString *text);

@protocol XUIScrollLabelDelegate <NSObject>

- (void)scrollLabel:(XUIScrollLabel *)label touchText:(NSString *)text;
- (void)scrollLabel:(XUIScrollLabel *)label touchButton:(UIButton *)btn;

@end

@interface XUIScrollLabel : UIView

@property (copy, nonatomic) TouchTextBolck touchTextEvent;
@property (weak, nonatomic) id delegate;

- (void)setTexts:(NSArray *)texts;
- (void)setTextColor:(UIColor *)textColor;
- (void)setTextBackgroundColor:(UIColor *)color;
- (void)setTextAddWidth:(CGFloat)width;
- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setFont:(UIFont *)font;
- (void)setCornerRadius:(CGFloat)cornerRadius;

- (void)setSpacingY:(CGFloat)y; //    字和上边的距离
- (void)setSpacingX:(CGFloat)x;
- (void)setSpacingBegin:(CGFloat)x;
- (void)setSpacingEnd:(CGFloat)x;

- (void)setShowVerticalLine:(BOOL)value;
- (void)setFirstTextColor:(UIColor *)color;

- (void)setLablesBorderColor:(UIColor *)color;
- (void)setLablesBgColor:(UIColor *)color;
- (NSArray *)subLabels;

- (CALayer *)button:(UIButton *)btn layerType:(NSInteger)type;
@end
