//
//  JMTools.h
//  JMTools
//
//  Created by xserver on 15/4/6.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import "JMChooseImageHelper.h"

@interface JMChooseImageHelper () <UIActionSheetDelegate>

@end;

@implementation JMChooseImageHelper
{
    UIActionSheet *_actionSheet;
}

+ (JMChooseImageHelper *)shared {
    static id obj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[self alloc] init];
    });
    return obj;
}

- (void)dealloc {
    NSLog(@"JMChooseImageHelper dealloc");
}

#pragma mark - show
- (void)show {
    
    if (_onlyUseCamera) {
        [JMChooseImageHelper openCamera];
        return;
    }
    if (_onlyUsePhoto) {
        [JMChooseImageHelper openPhoto];
        return;
    }
    
    [self.actionSheet showInView:[[UIApplication sharedApplication] keyWindow]];
}

- (void)close {
    if (self.imagePicker) {
        [self.imagePicker dismissViewControllerAnimated:YES completion:nil];
        
        self.originalImage = nil;
        self.imagePicker = nil;
    }
}

#pragma mark - auth
- (BOOL)checkPermissions {
    //dispatch_async(dispatch_get_main_queue(), ^{
    //    [[QMAlertViewTwo(@"没有权限使用相机", @"设置->隐私->相机", lls(@"取消"), lls(@"确定"))
    //      setCompleteBlock:^(UIAlertView *alertView, NSInteger index) {
    //          [self closeCamera];
    //          if (index != kAlertCancelIndex) {
    //              [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    //          }
    //      }] show];
    //    
    //});
    return YES;
}


#pragma mark - 菜单
// TODO
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

/**
 *  @return 当前Window最上面的 UIViewController
 */
+ (UIViewController *)currentWindowTopViewController {
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    
    //  normal 才是正确的 window
    if (window.windowLevel != UIWindowLevelNormal) {
        
        NSArray *windows = [[UIApplication sharedApplication] windows];
        
        for (UIWindow * win in windows) {
            if (win.windowLevel == UIWindowLevelNormal) {
                window = win;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    UIResponder *next = frontView.nextResponder;
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = next.nextResponder;
        
    } while(next != nil);
    
    return window.rootViewController;
}

+ (void)openPhoto {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = [self shared];
        picker.allowsEditing = [self shared].allowsEditing;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        

        [[self currentWindowTopViewController] presentViewController:picker animated:YES completion:nil];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"没有权限" message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
    }
}

+ (void)openCamera {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = [self shared];
            picker.allowsEditing = [self shared].allowsEditing;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            //        picker.showsCameraControls = NO;
            [[self currentWindowTopViewController] presentViewController:picker animated:YES completion:nil];
        });
    }else {
        
        [JMChooseImageHelper openPhoto];
    }
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    self.imagePicker = picker;
    self.originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];  //    UIImagePickerControllerMediaURL

    if (self.resultImage) {
        self.resultImage(self, info);
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    self.imagePicker = picker;
    if (self.resultImage) {
        self.resultImage(self, nil);
    }
}

@end
