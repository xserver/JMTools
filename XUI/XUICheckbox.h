//
//  XUICheckbox.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XUICheckbox : UIView

@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *title;

//- (void)setFrame:(CGRect)frame;

@property (weak, nonatomic) id data;
@property (copy, nonatomic) void(^touchEvent)();

+ (instancetype)makeObj;
@end


@interface XUICheckbox (bus)
- (void)setTitle:(NSString *)title image:(UIImage *)image;
@end