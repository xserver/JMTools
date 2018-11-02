//
//  JMExampleTextViewCtrl.m
//  JMTools
//
//  Created by Macro on 2018/11/2.
//  Copyright © 2018 pitaya. All rights reserved.
//

#import "JMExampleTextViewCtrl.h"

@interface JMExampleTextViewCtrl ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, assign) NSInteger textHeight;
@end

@implementation JMExampleTextViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.textView.delegate = self;
    
    self.textView.layer.borderColor = [UIColor grayColor].CGColor;
    self.textView.layer.borderWidth = 1.0;
    self.textView.layer.cornerRadius = 5.0;
    self.textView.layer.masksToBounds = YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView*)textView {
    _textHeight = ceil([textView sizeThatFits:CGSizeMake(320,CGFLOAT_MAX)].height);
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    CGFloat height = [textView sizeThatFits:CGSizeMake(320, CGFLOAT_MAX)].height;
    NSLog(@"自适应的高度为:%f",height);
    
    if (_textHeight != height && height < 282.0) {
        
        _textHeight = height;
        textView.frame = CGRectMake(12, 64, 320, ceil(_textHeight));
        NSLog(@"换行了");
        _textHeight = height;
    }
}

@end
