//
//  JMCategory.h
//  JMCategory
//
//  Created by xserver on 15/4/6.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import "JMChooseImageHelper.h"

@interface JMChooseImageHelper () <UIActionSheetDelegate>

@property (weak, nonatomic) UIViewController
    <UINavigationControllerDelegate, UIImagePickerControllerDelegate> * delegate;

@end;

@implementation JMChooseImageHelper
{
    UIActionSheet *_actionSheet;
}

- (void)dealloc {
    NSLog(@"JMChooseImageHelper dealloc");
}

- (UIActionSheet *)actionSheet {
    if (_actionSheet == nil) {
        NSString *openCamera = NSLocalizedString(@"拍照", nil);
        NSString *openPhoto = NSLocalizedString(@"从手机相册选择", nil);
        NSString *cancel = NSLocalizedString(@"取消", nil);
        
        _actionSheet = [[UIActionSheet alloc] init];
        [_actionSheet addButtonWithTitle:openCamera];
        [_actionSheet addButtonWithTitle:openPhoto];
        [_actionSheet addButtonWithTitle:cancel];
        _actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
        _actionSheet.delegate = self;
    }
    return _actionSheet;
}

- (void)show {
    
    if (_onlyUseCamera) {
        [JMChooseImageHelper openCamera];
        return;
    }
    if (_onlyUsePhoto) {
        [JMChooseImageHelper openPhoto];
        return;
    }
    
    [self.actionSheet showInView:self.delegate.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        [JMChooseImageHelper openCamera];
        return;
    }
    if (buttonIndex == 1) {
        [JMChooseImageHelper openPhoto];
        return;
    }
}

static JMChooseImageHelper *only;

+ (void)free {
    //void free() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        only = nil;
    });
}

+ (instancetype)makeWithController:(UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate> *)ctrl {
    
    only = nil;
    only = [[JMChooseImageHelper alloc] init];
    only.delegate = ctrl;
    
    return only;
}

+ (void)openPhoto {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = only.delegate;
        picker.allowsEditing = only.allowsEditing;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [only.delegate presentViewController:picker animated:YES completion:nil];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"没有权限" message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
    }
    
    [JMChooseImageHelper free];
}

+ (void)openCamera {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = only.delegate;
            picker.allowsEditing = only.allowsEditing;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            //        picker.showsCameraControls = NO;
            [only.delegate presentViewController:picker animated:YES completion:nil];
        });
    }else {
        
        [JMChooseImageHelper openPhoto];
    }
    
    [JMChooseImageHelper free];
}

@end
