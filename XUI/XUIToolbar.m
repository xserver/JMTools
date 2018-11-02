//
//  XUIToolbar.m
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import "XUIToolbar.h"
#import "XUIConfigure.h"

@interface XUIToolbar ()

@property (assign, nonatomic) int count;
@property (weak, nonatomic) IBOutlet UIButton *btn0;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;


@property (strong, nonatomic) NSArray *btns;
@end

@implementation XUIToolbar

- (void)dealloc {
    _btns = nil;
    _toolbarEvent = nil;
}

#pragma mark - System
- (void)awakeFromNib {
    _count = 5;
    _btns = @[_btn0, _btn1, _btn2, _btn3, _btn4];
    for (UIButton *btn in _btns) {
        btn.hidden = YES;
    }
}

- (void)setBackgroundImage:(UIImage *)backgroundImage {

    _backgroundImage = backgroundImage;
    self.bgView.image = _backgroundImage;
//    [self sendSubviewToBack:self.bgView];
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//}

#pragma mark - API
+ (instancetype)makeObjWithCount:(NSInteger)count {
    XUIToolbar *toolbar = [[[NSBundle mainBundle] loadNibNamed:@"XUIToolbar" owner:self options:nil] objectAtIndex:0];
//    toolbar.bounds = CGRectMake(0, XHigth - 44, 300, 44);
    [toolbar setCount:count];
    return toolbar;
}

+ (instancetype)businessStyleCell {
    XUIToolbar *_toolbar = [self makeObjWithCount:4];
    
    NSArray *images = @[[UIImage imageNamed:@"toolbar_drop"],
                        [UIImage imageNamed:@"toolbar_like"],
                        [UIImage imageNamed:@"toolbar_comment"],
                        [UIImage imageNamed:@"toolbar_more"]];
    [_toolbar setImages:images forState:UIControlStateNormal];
    
    images = @[[UIImage imageNamed:@"toolbar_drop_sel"],
               [UIImage imageNamed:@"toolbar_like_sel"],
               [UIImage imageNamed:@"toolbar_comment"],
               [UIImage imageNamed:@"toolbar_more"]];
    [_toolbar setImages:images forState:UIControlStateSelected];
    
//    NSArray *titles = @[@"推荐", @"评论", @"赞", @"更多"];
//    [_toolbar setTitles:titles forState:UIControlStateNormal];
    [_toolbar setTitleFont:[UIFont systemFontOfSize:15]];
    
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [[_toolbar buttons] objectAtIndex:i];
//        btn.clipsToBounds = NO;
//        btn.titleLabel.clipsToBounds = NO;
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 0);
        
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -12, 0, 0);
        btn.titleEdgeInsets = UIEdgeInsetsMake(6, -7, 0, 0);//(0, -58, -28, 0)
//        btn.backgroundColor = [UIColor randomColor];
#warning setSizeWidth, setOriginX, setOriginX
//        [btn setSizeWidth:84];
//        [btn setOriginX:btn.frame.origin.x + 15 + i*8];
//        btn.titleLabel.backgroundColor = [UIColor randomColor];
    }
    
    UIButton *btn = [[_toolbar buttons] objectAtIndex:3];
//    [btn setOriginX:280];
    
    return _toolbar;
}

+ (instancetype)businessStyleWeb {
    
    XUIToolbar *_toolbar = [self makeObjWithCount:4];
    NSArray *images = @[[UIImage imageNamed:@"toolbar_drop_gray"],
                        [UIImage imageNamed:@"toolbar_comment_gray"],
                        [UIImage imageNamed:@"toolbar_like_gray"],
                        [UIImage imageNamed:@"toolbar_more_grey"]];
    [_toolbar setImages:images forState:UIControlStateNormal];
    
    images = @[[UIImage imageNamed:@"toolbar_drop_green"],
               [UIImage imageNamed:@"toolbar_comment_gray"],
               [UIImage imageNamed:@"toolbar_like_green"],
               [UIImage imageNamed:@"toolbar_more_grey"]];
    [_toolbar setImages:images forState:UIControlStateSelected];
    
//    NSArray *titles = @[@"推荐", @"评论", @"喜欢", @"更多"];
//    [_toolbar setTitles:titles forState:UIControlStateNormal];
//    [_toolbar setTitleFont:[UIFont systemFontOfSize:10]];
//    
//    for (UIButton *btn in [_toolbar buttons]) {
//        btn.imageEdgeInsets = UIEdgeInsetsMake(-10, 17, 0, 0);
//        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -30, -28, 0);
//        
//        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
//        //            btn.backgroundColor = [UIColor randomColor];
//    }

    
    return _toolbar;
}

+ (instancetype)businessStyleByMagazine {
    
    XUIToolbar *_toolbar = [self makeObjWithCount:4];
    
    NSArray *images = @[[UIImage imageNamed:@"toolbar_shared_gray"],
                        [UIImage imageNamed:@"toolbar_comment_gray"],
                        [UIImage imageNamed:@"toolbar_like_gray"],
                        [UIImage imageNamed:@"toolbar_followed_gray"]];
    [_toolbar setImages:images forState:UIControlStateNormal];
    
    images = @[[UIImage imageNamed:@"toolbar_shared_green"],
               [UIImage imageNamed:@"toolbar_comment_green"],
               [UIImage imageNamed:@"toolbar_like_green"],
               [UIImage imageNamed:@"toolbar_following_green"]];
    [_toolbar setImages:images forState:UIControlStateSelected];
    
    return _toolbar;
}

+ (instancetype)businessStyleTabBar {
    XUIToolbar *_toolbar = [self makeObjWithCount:5];
//    NSArray *images = @[[UIImage imageNamed:@"toolbar_drop_gray"],
//                        [UIImage imageNamed:@"toolbar_comment_gray"],
//                        [UIImage imageNamed:@"toolbar_like_gray"],
//                        [UIImage imageNamed:@"toolbar_more_grey"]];
//    [_toolbar setImages:images forState:UIControlStateNormal];
//    
//    images = @[[UIImage imageNamed:@"toolbar_drop_green"],
//               [UIImage imageNamed:@"toolbar_comment_gray"],
//               [UIImage imageNamed:@"toolbar_like_green"],
//               [UIImage imageNamed:@"toolbar_more_grey"]];
//    [_toolbar setImages:images forState:UIControlStateSelected];
    
    NSArray *titles = @[@"杂志", @"圈子", @"主页", @"搜索", @"我的"];
    [_toolbar setTitles:titles forState:UIControlStateNormal];
    [_toolbar setTitleFont:[UIFont systemFontOfSize:10]];

    return _toolbar;
}

- (IBAction)touchButton:(id)sender {
    UIButton *btn = (UIButton *)sender;
    
    btn.selected = YES;
    NSUInteger tag = btn.tag - 10;
    if (_toolbarEvent != nil) {
        _toolbarEvent(tag);
    }
}

- (void)setCount:(NSInteger)count {
    if (count < 1 || count > 5) {
        return;
    }
    
    _count = count;
    
    CGFloat width = self.frame.size.width / count;
    CGFloat offset = 0;

    for (int i = 0; i < count; i++) {
        UIButton *btn = [_btns objectAtIndex:i];
        btn.hidden = NO;
        btn.frame = CGRectMake(offset, 0, width, self.frame.size.height);
        offset += width;
    }
}

- (NSArray *)buttons {
    return _btns;
}

- (UIButton *)buttonAtIndex:(NSInteger)index {
    if ([self checkIndex:index]) {
        return [_btns objectAtIndex:index];
    }
    return nil;
}

- (BOOL)checkIndex:(NSInteger)index {
    if (index >= 0 && index <_count) {
        return YES;
    }else{
        return NO;
    }
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state atIndex:(NSInteger)i {
    if ([self checkIndex:i]) {
        [[_btns objectAtIndex:i] setTitle:title forState:state];
    }
}

- (void)setImage:(UIImage *)image  forState:(UIControlState)state atIndex:(NSInteger)i {
    if ([self checkIndex:i]) {
        [[_btns objectAtIndex:i] setImage:image forState:state];
    }
}

- (void)setTitles:(NSArray *)titles forState:(UIControlState)state{

    if (titles.count == _count) {
        for (int i = 0; i < _count; i++) {
            UIButton *btn = [_btns objectAtIndex:i];
            [btn setTitle:[titles objectAtIndex:i] forState:state];
        }
    }
}

- (void)setImages:(NSArray *)images forState:(UIControlState)state{
    if (images.count == _count) {
        for (int i = 0; i < _count; i++) {
            UIButton *btn = [_btns objectAtIndex:i];
            [btn setImage:[images objectAtIndex:i] forState:state];
        }
    }
}

- (void)setState:(UIControlState)state atIndex:(NSInteger)index {
    
    if ([self checkIndex:index]) {
        
        UIButton *btn = [_btns objectAtIndex:index];
        if (state == UIControlStateSelected) {
            btn.selected = YES;
        }else{
            btn.selected = NO;
        }
    }
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state {
    for (UIButton *btn in _btns) {
        [btn setTitleColor:color forState:state];
    }
}

- (void)setTitleFont:(UIFont *)font {
    for (UIButton *btn in _btns) {
        btn.titleLabel.font = font;
    }
}

#pragma mark - Sub

#pragma mark - Delegate

@end
