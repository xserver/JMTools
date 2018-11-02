//
//  XUINavigationBar.m
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import "XUINavigationBar.h"

@interface XUINavigationBar ()

@end


@implementation XUINavigationBar

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [_left addTarget:self action:@selector(touchLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    [_rigt addTarget:self action:@selector(touchRigtButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchTitleLabel)];
    [_titleLabel addGestureRecognizer:tap];
}

+ (instancetype)make {
    XUINavigationBar *nav = [[[NSBundle mainBundle] loadNibNamed:@"XUINavigationBar" owner:self options:nil] objectAtIndex:0];
    
    nav.frame = CGRectMake(0, 20, UIScreen.mainScreen.bounds.size.width, 64);
    return nav;
}
+ (instancetype)makeWithTitle:(NSString *)title {
    XUINavigationBar *nav = [XUINavigationBar make];
    nav.title = title;
    return nav;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

    }
    return self;
}

- (void)setTitle:(NSString *)title {
    
    _titleLabel.text = title;
    [_titleLabel sizeToFit];
    _titleLabel.center = CGPointMake(CGRectGetWidth(self.frame)/2, 22);
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    return [super hitTest:point withEvent:event];
}

#pragma mark - Event
- (IBAction)touchLeftButton:(id)sender {
    if (self.leftTapAction) {
        self.leftTapAction(sender);
    }
}

- (IBAction)touchRigtButton:(id)sender {
    if (self.rigtTapAction) {
        self.rigtTapAction(sender);
    }
}

- (void)touchTitleLabel {
    if (self.titleTapAction) {
        self.titleTapAction(self.titleLabel);
    }
}

#pragma mark - Property
- (void)setHiddenLeft:(BOOL)hiddenLeft {
    _hiddenLeft = hiddenLeft;
    self.left.hidden = hiddenLeft;
}

- (void)setHiddenRigt:(BOOL)hiddenRigt {
    _hiddenRigt = hiddenRigt;
    self.rigt.hidden = hiddenRigt;
}

- (void)setHiddenTitle:(BOOL)hiddenTitle {
    _hiddenTitle = hiddenTitle;
    self.titleLabel.hidden = hiddenTitle;
}

- (void)setLeftImage:(UIImage *)leftImage {
    _leftImage = leftImage;
    [_left setImage:leftImage forState:0];
}
- (void)setRigtImage:(UIImage *)rigtImage {
    _rigtImage = rigtImage;
    [_rigt setImage:rigtImage forState:0];
}

//- (void)setLeftImageWithName:(NSString *)name {
//    UIImage *image = [[UIImage imageNamed:name] stretchableImageWithLeftCapWidth:28 topCapHeight:2];
//    [_left setImage:image forState:0];
//}
//- (void)setRigtImageWithName:(NSString *)name {
//    UIImage *image = [[UIImage imageNamed:name] stretchableImageWithLeftCapWidth:1 topCapHeight:2];
//    [_rigt setImage:image forState:0];
//}

- (void)setLeftHidden:(BOOL)hide {
    _left.hidden = hide;
}
- (void)setRigtHidden:(BOOL)hide {
    _rigt.hidden = hide;
}


@end
