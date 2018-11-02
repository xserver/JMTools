//
//  XUINavigationBar.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XUINavigationBar : UIView

@property (weak, nonatomic) IBOutlet UIButton *left;
@property (weak, nonatomic) IBOutlet UIButton *rigt;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;

@property (nonatomic, copy  ) NSString *title;
@property (nonatomic, copy  ) NSString *leftTitle;
@property (nonatomic, copy  ) NSString *rigtTitle;

@property (nonatomic, strong) UIImage *leftImage;
@property (nonatomic, strong) UIImage *rigtImage;

@property (nonatomic, assign) BOOL hiddenLeft;
@property (nonatomic, assign) BOOL hiddenRigt;
@property (nonatomic, assign) BOOL hiddenTitle;

@property (nonatomic, copy) void (^leftTapAction) (UIButton *);
@property (nonatomic, copy) void (^rigtTapAction) (UIButton *);
@property (nonatomic, copy) void (^titleTapAction) (UILabel *);


+ (instancetype)make;
+ (instancetype)makeWithTitle:(NSString *)title;


@end
