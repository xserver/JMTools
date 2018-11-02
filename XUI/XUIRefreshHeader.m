//
//  XUIRefreshHeader.m
//  XUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2012年 xserver. All rights reserved.
//

#import "XUIRefreshHeader.h"

//#define TEXT_COLOR	[UIColor whiteColor]
#define TEXT_COLOR	 [UIColor colorWithRed:87.0/255.0 green:108.0/255.0 blue:137.0/255.0 alpha:1.0]
#define FLIP_ANIMATION_DURATION 0.18f

CGFloat maxValuePullHeader = -65.0f;

@interface XUIRefreshHeader ()

@property (strong, nonatomic) UIScrollView *tab;
@property (strong, nonatomic) UILabel *lastUpdatedLabel;
@property (strong, nonatomic) UILabel *statusLabel;
@property (strong, nonatomic) CALayer *arrowImage;
@property (strong, nonatomic) UIActivityIndicatorView *activityView;

@property (assign, nonatomic) XUIPullRefreshState state;
- (void)setState:(XUIPullRefreshState)aState;

@end

@implementation XUIRefreshHeader

+ (instancetype)makeWithTableView:(UITableView *)tableView {
    
    CGRect rect = CGRectMake(0.0f, 0.0f - tableView.bounds.size.height,
                             tableView.frame.size.width,
                             tableView.frame.size.height);

    XUIRefreshHeader * header = [[XUIRefreshHeader alloc] initWithFrame:rect];
    header.tab = tableView;
    return header;
}

- (void)setTab:(UIScrollView *)tab {

    if (_tab != nil) {
        
        [self removeFromSuperview];
        [_tab removeObserver:self forKeyPath:@"contentOffset" context:NULL];
        _tab = nil;
    }
    
    if (tab != nil) {
        _tab = tab;
        [_tab addSubview:self];
        [_tab addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:NULL];
    }
}

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor clearColor];
        
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 30.0f, self.frame.size.width, 20.0f)];
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		label.font = [UIFont systemFontOfSize:13.0f];
		label.textColor = TEXT_COLOR;
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
		[self addSubview:label];
		_lastUpdatedLabel=label;
		
		label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 48.0f, self.frame.size.width, 20.0f)];
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		label.font = [UIFont boldSystemFontOfSize:14.0f];
		label.textColor = TEXT_COLOR;
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
		[self addSubview:label];
		_statusLabel=label;
		
		CALayer *layer = [CALayer layer];
		layer.frame = CGRectMake(25.0f, frame.size.height - 65.0f, 30.0f, 55.0f);
		layer.contentsGravity = kCAGravityResizeAspect;
		layer.contents = (id)[UIImage imageNamed:@"blueArrowHeader.png"].CGImage;
		
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
		if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
			layer.contentsScale = [[UIScreen mainScreen] scale];
		}
#endif
		
		[[self layer] addSublayer:layer];
		_arrowImage=layer;
		
		UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		view.frame = CGRectMake(25.0f, frame.size.height - 38.0f, 20.0f, 20.0f);
		[self addSubview:view];
		_activityView = view;
		
		[self setState:XUIPullRefreshNormal];
    }
	
    return self;
}

- (void)dealloc {

    self.tab = nil;
    
	_activityView = nil;
	_statusLabel = nil;
	_arrowImage = nil;
	_lastUpdatedLabel = nil;
}

//  刷新最后记录时间
- (void)refreshLastUpdatedDate {
    
    [NSDateFormatter setDefaultFormatterBehavior:NSDateFormatterBehaviorDefault];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setAMSymbol:@"AM"];
//    [formatter setPMSymbol:@"PM"];
//    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:a"];
    
    
    NSString *time = [formatter stringFromDate:[NSDate date]];
    _lastUpdatedLabel.text = [NSString stringWithFormat:@"上一次更新时间: %@", time];

    [[NSUserDefaults standardUserDefaults] setObject:_lastUpdatedLabel.text
                              forKey:@"EGORefreshTableView_LastRefresh"];

    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setStatusText:(NSString *)text {
    
    _statusLabel.text = text;
    [_activityView startAnimating];
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    _arrowImage.hidden = YES;
    [CATransaction commit];
}

- (void)setState:(XUIPullRefreshState)state {
    
    if (_state == state) {
        return;
    }
    
	switch (state)
    {
		case XUIPullRefreshPulling: {
            
			_statusLabel.text = NSLocalizedString(@"松开加载..", @"Release to refresh status");
            [self arrowUp];
			break;
        }
		case XUIPullRefreshNormal:{
            
            if (_state == XUIPullRefreshPulling) {
                [self arrowDown];
			}
            
			_statusLabel.text = NSLocalizedString(@"下拉刷新..", @"Pull down to refresh status");
            
			[_activityView stopAnimating];
            _arrowImage.hidden = NO;
            [self arrowDefault];
			[self refreshLastUpdatedDate];
			break;
        }
			
		case XUIPullRefreshLoading:
            [self setStatusText:NSLocalizedString(@"加载中", @"Loading Status")];
			break;
            
		case XUIPullRefreshFailed:
            [self setStatusText:NSLocalizedString(@"加载失败！", @"Loading Status")];
			break;
            
		case XUIPullRefreshFinished:
			_statusLabel.text = NSLocalizedString(@"加载成功！", @"Loading Status");
			break;
            
		default:
			break;
	}
	
	_state = state;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"contentOffset"]) {

//            CGPoint point = [change [NSKeyValueChangeNewKey] CGPointValue];
//        UIScrollView *scroll = object;
        
        //  拖动中
        if (_tab.isDragging) {
            
            CGFloat offsetY = _tab.contentOffset.y;

            if (_state == XUIPullRefreshNormal && offsetY < maxValuePullHeader) {
                [self setState:XUIPullRefreshPulling];
                return;
            }
            
            if (_state == XUIPullRefreshPulling && offsetY > maxValuePullHeader) {
                [self setState:XUIPullRefreshNormal];
                return;
            }
        }
        
        //  松手，惯性中
        if (_tab.isDecelerating && _state == XUIPullRefreshPulling) {

            if ([_delegate respondsToSelector:@selector(pullHeaderEvent:)]) {
                [_delegate pullHeaderEvent:self];
                
                [self setState:XUIPullRefreshLoading];
                [self show];
            }
        }
    }
}

- (void)close {
    if (_state != XUIPullRefreshNormal) {
        [self setState:XUIPullRefreshNormal];
        [self hide];
    }
}

- (void)closeAfterFinished {
    [self setState:XUIPullRefreshFinished];
    [self performSelector:@selector(close) withObject:nil afterDelay:0.3];
}
- (void)closeAfterFailed {
    [self setState:XUIPullRefreshFailed];
    [self performSelector:@selector(close) withObject:nil afterDelay:0.3];
}

#pragma mark - animation
- (void)hide {
    [UIView animateWithDuration:0.5 animations:^{
        [_tab setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
    }];
}

- (void)show {
    [UIView animateWithDuration:0.2 animations:^{
        [_tab setContentInset:UIEdgeInsetsMake(60.0f, 0.0f, 0.0f, 0.0f)];
    }];
}

- (void)arrowUp {
    [CATransaction begin];
    [CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
    _arrowImage.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180.0f, 0.0f, 0.0f, 1.0f);
    [CATransaction commit];
}
- (void)arrowDown {
    [CATransaction begin];
    [CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
    _arrowImage.transform = CATransform3DIdentity;
    [CATransaction commit];
}
- (void)arrowDefault {
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    _arrowImage.transform = CATransform3DIdentity;
    [CATransaction commit];
}
@end
