//
//  XUIRefreshFooter.m
//  saying
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2012年 xserver. All rights reserved.
//

#import "XUIRefreshFooter.h"

#define TEXT_COLOR	 [UIColor colorWithRed:87.0/255.0 green:108.0/255.0 blue:137.0/255.0 alpha:1.0]
#define FLIP_ANIMATION_DURATION 0.18f
CGFloat maxValueFooter = 60.0f;

@interface XUIRefreshFooter ()

@property (nonatomic, strong) UIScrollView *tab;
@property (nonatomic, assign) XUIPullRefreshState state;

@property (nonatomic, strong) UILabel *lastUpdatedLabel;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) CALayer *arrowImage;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;

- (void)setState:(XUIPullRefreshState)aState;
@end

@implementation XUIRefreshFooter


+ (id)makeWithTableView:(UITableView*)tableView {
    
    CGRect rect = CGRectMake(0.0f, tableView.contentSize.height, tableView.frame.size.width, 300);
    XUIRefreshFooter *footer = [[XUIRefreshFooter alloc] initWithFrame:rect];
    footer.tab = tableView;
    return footer;
}

- (void)dealloc {
    
    self.tab = nil;
    
	_activityView = nil;
	_statusLabel = nil;
	_arrowImage = nil;
	_lastUpdatedLabel = nil;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //                UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor clearColor];
        
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 16, self.frame.size.width, 30.0f)];
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		label.font = [UIFont boldSystemFontOfSize:16.0f];
		label.textColor = TEXT_COLOR;
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
		[self addSubview:label];
		_statusLabel=label;
		
		CALayer *layer = [CALayer layer];
		layer.frame = CGRectMake(30, 6, 30.0f, 55.0f);
		layer.contentsGravity = kCAGravityResizeAspect;
		layer.contents = (id)[UIImage imageNamed:@"blueArrowFooter"].CGImage;
		
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
		if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
			layer.contentsScale = [[UIScreen mainScreen] scale];
		}
#endif
		
		[[self layer] addSublayer:layer];
		_arrowImage=layer;
		
		UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		view.frame = CGRectMake(25.0f, 10, 20.0f, 20.0f);
		[self addSubview:view];
		_activityView = view;
		
		[self setState:XUIPullRefreshNormal];
    }
	
    return self;
}

- (void)setTab:(UITableView *)tab {
    
    if (_tab != nil) {
        
        [self removeFromSuperview];
        [_tab removeObserver:self forKeyPath:@"contentSize" context:NULL];
        [_tab removeObserver:self forKeyPath:@"contentOffset" context:NULL];
        _tab = nil;
    }
    
    if (tab != nil) {
        _tab = tab;
        [_tab addSubview:self];
        [_tab addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:NULL];
        [_tab addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:NULL];
    }
}

- (void)hide {
    [UIView animateWithDuration:0.3 animations:^{
        [_tab setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
    }];
}

- (void)show {
    [UIView animateWithDuration:0.2 animations:^{
        _tab.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 70.0f, 0.0f);
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([object isKindOfClass:[UITableView class]] && [keyPath isEqualToString:@"contentOffset"]) {
        
        //  拖动中
        if (_tab.isDragging) {
            
            CGFloat offsetY = _tab.contentOffset.y - (_tab.contentSize.height - _tab.frame.size.height);

            if (_state == XUIPullRefreshNormal && offsetY > maxValueFooter) {
                [self setState:XUIPullRefreshPulling];
                return;
            }

            if (_state == XUIPullRefreshPulling && offsetY < maxValueFooter) {
                [self setState:XUIPullRefreshNormal];
                return;
            }
        }
        
        //  松手，惯性中
        if (_tab.isDecelerating && _state == XUIPullRefreshPulling) {
            
            if ([_delegate respondsToSelector:@selector(pullHeaderEvent:)]) {
                [_delegate pullFooterEvent:self];
                
                [self setState:XUIPullRefreshLoading];
                [self show];
            }
        }
        return;
    }
    
    if ([object isKindOfClass:[UITableView class]] && [keyPath isEqualToString:@"contentSize"]) {
        
        if (_tab.contentSize.height < _tab.frame.size.height) {
            _tab.contentSize = CGSizeMake(_tab.frame.size.width, _tab.frame.size.height + 2);
        }
        
        if (_tab.contentSize.height < _tab.frame.size.height) {
            self.hidden = YES;
        }else {
            self.hidden = NO;
            self.frame = CGRectMake(0.0f, _tab.contentSize.height, _tab.frame.size.width, 600);
        }
        return;
    }
}

- (void)setStatusLabelText:(NSString *)text
{
    _statusLabel.text = text;
    [_activityView startAnimating];
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    _arrowImage.hidden = YES;
    [CATransaction commit];
}

- (void)setState:(XUIPullRefreshState)aState
{
	switch (aState)
    {
		case XUIPullRefreshPulling:
			
            //  Release to refresh..
			_statusLabel.text = NSLocalizedString(@"松开加载..", @"Release to refresh status");
			[CATransaction begin];
			[CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
			_arrowImage.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180.0f, 0.0f, 0.0f, 1.0f);
			[CATransaction commit];
			
			break;
		case XUIPullRefreshNormal:
			
			if (_state == XUIPullRefreshPulling)
            {
				[CATransaction begin];
				[CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
				_arrowImage.transform = CATransform3DIdentity;
				[CATransaction commit];
			}
			//  Pull down to refresh..
			_statusLabel.text = NSLocalizedString(@"上拉加载更多..", @"Pull down to refresh status");
			[_activityView stopAnimating];
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
			_arrowImage.hidden = NO;
			_arrowImage.transform = CATransform3DIdentity;
			[CATransaction commit];
			break;
            
		case XUIPullRefreshLoading:
            [self setStatusLabelText:NSLocalizedString(@"加载中", @"Loading Status")];
			break;
            
		case XUIPullRefreshFailed:
            [self setStatusLabelText:NSLocalizedString(@"加载失败！", @"Loading Status")];
			break;
            
		case XUIPullRefreshFinished:
			_statusLabel.text = NSLocalizedString(@"加载成功！", @"Loading Status");
			break;
            
		default:
			break;
	}
	
	_state = aState;
}

- (void)removeFromSuperview {
    [super removeFromSuperview];
    _tab.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
}

- (void)close
{
    if (_state != XUIPullRefreshNormal) {
        [self hide];
        
        [self setState:XUIPullRefreshNormal];
    }
}

@end
