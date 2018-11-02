//
//  XUISearchBar.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol XUISearchBarDelegate <NSObject>
//
//- (void)searchTextChange:(NSString *)text;
//
//@end

@interface XUISearchBar : UIView

@property (assign, nonatomic, readonly) BOOL searching;
@property (weak, nonatomic) id delegate;

+ (instancetype)makeObj;

@end
