//
//  XUIScrollLabel.m
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import "XUIScrollLabel.h"
#import <QuartzCore/QuartzCore.h>

@interface XUIScrollLabel ()
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSArray *texts;
@property (strong, nonatomic) NSMutableArray *labels;
@property (strong, nonatomic) UIColor *textColor;
@property (strong, nonatomic) UIColor *textBackgroundColor;
@property (strong, nonatomic) UIColor *textBorderColor;
@property (strong, nonatomic) UIFont *font;

@property (assign, nonatomic) CGFloat labelHeight;
@property (assign, nonatomic) CGFloat beginX;
@property (assign, nonatomic) CGFloat spacingX;
@property (assign, nonatomic) CGFloat spacingY;
@property (assign, nonatomic) CGFloat spacingEnd;
@property (assign, nonatomic) CGFloat textAddWidth;
@property (assign, nonatomic) CGFloat cornerRadius;

@property (assign, nonatomic) BOOL onFirstColor;
@property (assign, nonatomic) BOOL showVertical;
@property (strong, nonatomic) UIColor *firstColor;
@end


@implementation XUIScrollLabel

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        _beginX = 10;
        _spacingX = 6;
        _spacingEnd = 20;
        _textAddWidth = 6;
        _cornerRadius = 4;
        
        _textColor = [UIColor blueColor];
        _font = [UIFont systemFontOfSize:16];
        
        CGRect rect = CGRectMake(0, 0, frame.size.width, frame.size.height);
        _scrollView = [[UIScrollView alloc] initWithFrame:rect];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.scrollsToTop = NO;
        [self addSubview:_scrollView];

        _labels = [NSMutableArray arrayWithCapacity:32];
    }
    return self;
}

#pragma mark - get
- (void)setFont:(UIFont *)font {
    _font = font;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    [self setNeedsLayout];
}

- (void)setTextBackgroundColor:(UIColor *)color {
    _textBackgroundColor = color;
}

- (void)setTextAddWidth:(CGFloat)width {
    _textAddWidth = width;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:backgroundColor];
    _scrollView.backgroundColor = backgroundColor;
}

- (void)setSpacingBegin:(CGFloat)x {
    _beginX = x;
}
- (void)setSpacingEnd:(CGFloat)x {
    _spacingEnd = x;
}

- (void)setShowVerticalLine:(BOOL)value {
    _showVertical = value;
}

- (void)setFirstTextColor:(UIColor *)color {
    _onFirstColor = YES;
    _firstColor = color;
}

- (void)setLabelHeight:(CGFloat)h {
    
}

- (void)setSpacingY:(CGFloat)y {
    _spacingY = y;
}

- (void)setSpacingX:(CGFloat)x {
    _spacingX = x;
}

- (void)setLablesBorderColor:(UIColor *)color {
    _textBorderColor = color;
}

- (void)setLablesBgColor:(UIColor *)color {
    _textBackgroundColor = color;
    [_labels makeObjectsPerformSelector:@selector(setBackgroundColor:) withObject:color];
}

- (NSArray *)subLabels {
    return _labels;
}

- (void)layoutSubviews {
    
    CGFloat offsetX = _beginX;

    for (int i = 0; i < _texts.count; i++) {
        
//        NSString *text = [NSString stringWithFormat:@" # %@ ", [_texts objectAtIndex:i]];
        NSString *text = [_texts objectAtIndex:i];
        UIButton *btn = [UIButton buttonWithType:0];
        btn.tag = i;
        [btn setTitle:text forState:0];
        [btn setTitleColor:_textColor forState:0];

        [btn.titleLabel setFont:_font];
        [btn addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
        [_labels addObject:btn];
        
        if (i == 0 && _onFirstColor) {
            [btn setTitleColor:_firstColor forState:0];
        }
        
        CGSize size = [btn sizeThatFits:CGSizeMake(1000, self.frame.size.height-_spacingY)];
        btn.frame = CGRectMake(offsetX, _spacingY, size.width + _textAddWidth, self.frame.size.height-_spacingY*2);

        if (_textBorderColor != nil) {
            CALayer *layer = [CALayer layer];
            layer.frame = CGRectMake(0, 0, btn.frame.size.width, btn.frame.size.height);
            layer.borderColor = _textBorderColor.CGColor;
            layer.borderWidth = 0.7;
            layer.cornerRadius = 4;
            [btn.layer insertSublayer:layer atIndex:0];
        }
        
        if (_textBackgroundColor != nil) {
            CALayer *layer = [CALayer layer];
            layer.frame = CGRectMake(0, 0, btn.frame.size.width, btn.frame.size.height);
            layer.backgroundColor = _textBackgroundColor.CGColor;
            layer.cornerRadius = 4;
            [btn.layer insertSublayer:layer atIndex:0];
        }
        [_scrollView addSubview:btn];
        
        offsetX += btn.frame.size.width + _spacingX;
        
        if (_showVertical) {
            CALayer *layer = [CALayer layer];
            layer.frame = CGRectMake(btn.frame.size.width + 10, 10, 1, 20);
            layer.backgroundColor = [UIColor whiteColor].CGColor;
            [btn.layer addSublayer:layer];
        }
        
    }
    offsetX += _spacingEnd;
    _scrollView.contentSize = CGSizeMake(offsetX, self.frame.size.height);
}

- (CALayer *)button:(UIButton *)btn layerType:(NSInteger)type {
    return nil;
}

- (void)setTexts:(NSArray *)texts {
    [_scrollView scrollRectToVisible:CGRectMake(0, 0, 0, 0) animated:NO];
    _texts = texts;
    [_labels makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_labels removeAllObjects];
    [self layoutSubviews];
}

- (void)touchButton:(UIButton *)btn {

    NSString *text = [_texts objectAtIndex:btn.tag];
    
//    if (btn.tag != 0) {
//        text = [[_texts objectAtIndex:0] stringByAppendingFormat:@",%@", text];
//    }
    
    if (_touchTextEvent != nil) {
        _touchTextEvent(text);
    }
    
    if ([_delegate respondsToSelector:@selector(scrollLabel:touchText:)]) {
        [_delegate scrollLabel:self touchText:text];
    }
    
    if ([_delegate respondsToSelector:@selector(scrollLabel:touchButton:)]) {
        [_delegate scrollLabel:self touchButton:btn];
    }
}

@end
