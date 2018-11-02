////
////  XUIAlertView.m
////  JMXUI
////
////  Created by xserver on 13/3/13.
////  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
////
//
//#import "XUIAlertView.h"
//#import <QuartzCore/QuartzCore.h>
//
//@interface XUIAlertView ()
//{
//    CGFloat messageHeight;
//}
//
//@property (weak, nonatomic) IBOutlet UIView *bgView;
//@property (weak, nonatomic) IBOutlet UIView *contentView;
//
//@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//
//@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
//@property (weak, nonatomic) IBOutlet UIButton *yesButton;
//@property (weak, nonatomic) IBOutlet UIButton *nosButton;
//
//@property (weak, nonatomic) IBOutlet XUIeView *titleIJMXUIeView;
//@property (weak, nonatomic) IBOutlet XUIeView *contentIJMXUIeView;
//
//@end
//
//@implementation XUIAlertView
//
//- (void)dealloc {
//    NSLog(@"");
//    _yesAction = nil;
//    _nosAction = nil;
//}
//
//- (void)awakeFromNib {
//    _messageLabel.lineBreakMode = 0;
//    _messageLabel.numberOfLines = 0;
//    
//    self.frame = CGRectMake(0, 0, XWidth, XHigth + 20);
//    self.bgView.frame = CGRectMake(0, 0, XWidth, XHigth + 20);
//    
//    _yesButton.tag = 100;
//    _nosButton.tag = 60;
//    
//    [_yesButton addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
//    [_nosButton addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
//}
//
//- (void)layoutSubviews {
//    messageHeight = [self contentHeight:self.messageLabel.text];
//    [self.messageLabel setSizeHeight:messageHeight];
//
////    NSLog(@"%f  %@", messageHeight, self.messageLabel.text);
//    
//    //  一行的高度
//    CGFloat offsetY = 74 + messageHeight;
//    //  UIbutton 跟着下移
//    [_yesButton setOriginY:offsetY];
//    [_nosButton setOriginY:offsetY];
//    
//    [self.contentIJMXUIeView setSizeHeight:78 + messageHeight];
//}
//
//- (CGFloat)contentHeight:(NSString *)message {
//    
//    CGFloat height = [message sizeWithFont:self.messageLabel.font
//                             constrainedToSize:CGSizeMake(self.messageLabel.frame.size.width, 1000)
//                                 lineBreakMode:NSLineBreakByWordWrapping].height;
//    return height;
//}
//
//+ (instancetype)makeObjWithTitle:(NSString *)title message:(NSString *)message yesTitle:(NSString *)yt nosTitle:(NSString *)nt  {
//    
//    XUIAlertView *obj = [XUIAlertView viewWithNib:@"XUIAlertView"];
//    obj.titleLabel.text = title;
//    obj.messageLabel.text = message;
//    
//    //TODO:
//    [obj.yesButton setTitle:yt forState:0];
//    [obj.nosButton setTitle:nt forState:0];
//    
//    [obj.yesButton setBackgroundIJMXUIe:[XUIe iJMXUIeNamed:@"XUIAlertButtonPressed"] forState:UIControlStateHighlighted];
//    
//    [obj.nosButton setBackgroundIJMXUIe:[XUIe iJMXUIeNamed:@"XUIAlertButtonPressed"] forState:UIControlStateHighlighted];
//    return obj;
//}
//
//
//#pragma mark event
//- (void)clickedButton:(UIButton *)btn {
//    
//    if (btn.tag == 100) {
//        if (_yesAction != nil) {
//            _yesAction();
//        }
//    }else{
//        if (_nosAction != nil) {
//            _nosAction();
//        }
//    }
//    
//    [self removeFromSuperview];
//}
//
//#pragma mark animation
//- (void)showAnimation {
//    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//    popAnimation.duration = 0.5;
//    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
//                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
//                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
//                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
//    popAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f, @1.0f];
//    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
//                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
//                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//    [self.contentView.layer addAnimation:popAnimation forKey:nil];
//}
//
//- (void)hideAnimation {
//    CAKeyframeAnimation *hideAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//    hideAnimation.duration = 0.5;
//    hideAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
//                             [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)],
//                             [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.00f, 0.00f, 0.00f)]];
//    hideAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f];
//    hideAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
//                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
//                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//    hideAnimation.delegate = self;
//    [self.contentView.layer addAnimation:hideAnimation forKey:nil];
//}
//
//- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
//    [self removeFromSuperview];
//}
//
//- (void)show {
//    UIWindow *win = [UIApplication sharedApplication].keyWindow;
//    [win addSubview:self];
//    [self showAnimation];
//}
//- (void)hide {
//    [self hideAnimation];
//}
//@end
//
//
//@implementation XUIAlertView (business)
//
//+ (instancetype)businesWithTitle:(NSString *)title
//                         message:(NSString *)message
//                        yesTitle:(NSString *)yes
//                        nosTitle:(NSString *)nos {
//    
//    XUIAlertView *obj = [XUIAlertView makeObjWithTitle:title message:message yesTitle:yes nosTitle:nos];
//    
//    //  doSomething
//    return obj;
//}
//
//
//@end