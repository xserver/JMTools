//
//  XUICheckbox.m
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import "XUICheckbox.h"

@interface XUICheckbox ()
@property (strong, nonatomic) UITapGestureRecognizer *tap;
@end

@implementation XUICheckbox

- (void)awakeFromNib {
    _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self addGestureRecognizer:_tap];
}

- (void)layoutSubviews {
//    [super layoutSubviews];
}

//- (void)setFrame:(CGRect)frame {
//    [super setFrame:frame];
//    NSLog(@"%@", NSStringFromCGRect(_title.frame));
//}

- (void)tapAction {
    if (self.touchEvent != nil) {
        self.touchEvent();
    }
}

+ (instancetype)makeObj {
    return [[[NSBundle mainBundle] loadNibNamed:@"XUICheckbox" owner:self options:nil] objectAtIndex:0];
}
@end


@implementation XUICheckbox (bus)
- (void)setTitle:(NSString *)title image:(UIImage *)image {
    _title.text = title;

    _imageView.image = image;
    [self setNeedsDisplay];
    [_title setNeedsDisplay];
}

@end

