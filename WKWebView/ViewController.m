//
//  ViewController.m
//  XKWebViewExample
//
//  Created by Macro on 2018/5/25.
//  Copyright © 2018年 Macro. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

#pragma mark - Object
/*
 WKWebViewConfiguration
 WKScriptMessage
 
 WKNavigation
 WKNavigationAction
 WKNavigationResponse
 
 WKPreviewElementInfo
 WKPreviewActionItem
 
 WKBackForwardList
*/



@interface ViewController ()<WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) WKUserContentController *userContentController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.webView];
    
    [self injectionJavaScript];
    
    [self load];
}

- (WKWebView *)webView {
    if (! _webView) {
        
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        config.userContentController = self.userContentController;
        
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
    }
    return _webView;
}

#pragma mark - default load
- (void)load {
//    id url = [NSURL URLWithString:@"https://www.baidu.com"];
    
    id url = [[NSBundle mainBundle] URLForResource:@"WKUIDelegateAlertConfirmPrompt" withExtension:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (WKUserContentController *)userContentController {
    
    if (! _userContentController) {
        _userContentController = [[WKUserContentController alloc] init];
        // 注入JS 对象 Native，self = js.native
        [_userContentController addScriptMessageHandler:self name:@"native"];
        // [_userContentController addScriptMessageHandler:self name:@"Pay"];  // 也可以映射为多个
        
        [_userContentController addScriptMessageHandler:self name:@"jsCallOC"];
    }
    return _userContentController;
}

- (void)reload:(id)sender {
    if (self.webView.loading) {
        [self.webView stopLoading];
    }
    
    [self.webView reload];
    
//    self.webView.canGoBack;
//    self.webView.canGoForward;
//    [self.webView goBack];
//    [self.webView goForward];
}

#pragma mark - NSURLProtocol
- (void)able {
    
}
#pragma mark - Filesystem
//Navigates to the requested file URL on the filesystem.
//  [WKWebView loadFileURL:allowingReadAccessToURL:]

#pragma mark - History
- (void)showHistory {
    // 查询历史记录
    WKBackForwardList *backForwardList = self.webView.backForwardList;
    // 历史
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"浏览记录" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    __weak WKWebView *webView = self.webView;
    
    // 后退
    for (__weak WKBackForwardListItem *backItem in backForwardList.backList) {
        [alertController addAction:[UIAlertAction actionWithTitle:backItem.title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [webView goToBackForwardListItem:backItem];
        }]];
    }
    
    // 当前页面
    [alertController addAction:[UIAlertAction actionWithTitle:backForwardList.currentItem.title style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [webView reload];
    }]];
    
    // 前进
    for (__weak WKBackForwardListItem *forwardItem in backForwardList.forwardList) {
        [alertController addAction:[UIAlertAction actionWithTitle:forwardItem.title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [webView goToBackForwardListItem:forwardItem];
        }]];
    }
    // 取消按钮
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    
    // 显示
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - 进度条
- (UIProgressView *)progressView {
    if (_progressView == nil) {
        CGRect rect = CGRectZero;
        rect.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, 2);
        
        rect.origin.y = self.navigationController.navigationBar.frame.origin.y +
                        self.navigationController.navigationBar.frame.size.height;
        
        _progressView = [[UIProgressView alloc] initWithFrame:rect];
        [_progressView setProgressViewStyle:UIProgressViewStyleDefault]; //设置进度条类型
        [self.view addSubview:_progressView];
    }
    return _progressView;
}
//kov
//[self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    // 进度条
    if ([@"estimatedProgress" isEqualToString:keyPath]) {
        NSLog(@"%f", self.webView.estimatedProgress);
        [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
        // 初始和终止状态
        if (self.progressView.progress == 0) {
            self.progressView.hidden = NO;
        } else if (self.progressView.progress == 1) {
            // 1秒后隐藏
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 再次判断，防止正在加载时隐藏
                if (self.progressView.progress == 1) {
                    self.progressView.progress = 0;
                    self.progressView.hidden = YES;
                }
            });
        }
    }
}

#pragma mark - App call JS
- (void)injectionJavaScript {
    // js注入，注入一个alert方法，页面加载完毕弹出一个对话框。
    NSString *javaScriptSource = @"alert(\"End WKUserScript 注入 js\");";
    WKUserScript *userScript = [[WKUserScript alloc] initWithSource:javaScriptSource
                                                      injectionTime:WKUserScriptInjectionTimeAtDocumentEnd
                                                   forMainFrameOnly:YES];   //NO(全局窗口)，yes（只限主窗口）
    
    [self.userContentController addUserScript:userScript];
    
    
    id start = [[WKUserScript alloc] initWithSource:@"alert(\"Start\");"
                                                      injectionTime:WKUserScriptInjectionTimeAtDocumentStart
                                                   forMainFrameOnly:YES];   //NO(全局窗口)，yes（只限主窗口）
    
    [self.userContentController addUserScript:start];
}

#pragma mark - WKScriptMessageHandler，JS call App
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    sleep(10);
    
    return;
    //  [WKUserContentController addScriptMessageHandler:self name:@"jsCallOC"];    对应此 name
    NSLog(@"%@", message.name);//  The name of the message handler to which the message is sent.
    NSLog(@"%@", message.body);//  Allowed types are NSNumber, NSString, NSDate, NSArray,NSDictionary, and NSNull.
    
    // 方法名
    NSString *methods = [NSString stringWithFormat:@"%@:", message.name];
    SEL selector = NSSelectorFromString(methods);
    // 调用方法
    if ([self respondsToSelector:selector]) {
        [self performSelector:selector withObject:message.body];
    } else {
        NSLog(@"未实行方法：%@", methods);
    }
}

 
#pragma mark - WKNavigationDelegate

/**
 Decides whether to allow or cancel a navigation. 是否允许或取消导航
 在发送请求之前，决定是否跳转
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    //  在发送请求之前，决定是否跳转
    decisionHandler(WKNavigationActionPolicyAllow);
//    decisionHandler(WKNavigationActionPolicyCancel);
}

/**
 Decides whether to allow or cancel a navigation after its response is known.
 在收到响应头后，决定是否跳转
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    decisionHandler(WKNavigationResponsePolicyAllow);
}

/**
 服务器重定向
 Invoked when a server redirect is received for the main frame.
 */
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    
}

#pragma mark
/**
 Invoked when a main frame navigation starts.
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    
}

/**
 Invoked when content starts arriving for the main frame.
 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation {
    //  接收正文内容
}

/**
 Invoked when an error occurs while starting to load data for the main frame.
 和 didFailNavigation 区别？
 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    //  完成
}

//  Invoked when an error occurs during a committed main frame
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    //  失败
}

/**
 身份验证
 Invoked when the web view needs to respond to an authentication challenge.
 @param challenge <#challenge description#>
 @param completionHandler <#completionHandler description#>
 */
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler {
    
    // 不要证书验证
    completionHandler(NSURLSessionAuthChallengeUseCredential, nil);
}

/**
 Invoked when the web view's web content process is terminated.
 */
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView API_AVAILABLE(macosx(10.11), ios(9.0)) {
    
}

#pragma mark - WKUIDelegate
//  Creates a new web view.
- (nullable WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
    return nil;
//    If you do not implement this method, the web view will cancel the navigation.
}

/*! @abstract Notifies your app that the DOM window object's close() method completed successfully.
 @param webView The web view invoking the delegate method.
 @discussion Your app should remove the web view from the view hierarchy and update
 the UI as needed, such as by closing the containing browser tab or window.
 */
- (void)webViewDidClose:(WKWebView *)webView {
    
}

#pragma mark JavaScript 三种弹出框 alert、confirm、prompt(带输入)
//  拦截这些弹出，使用 App 自己封装的，然后回调

//  Displays a JavaScript alert panel.
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK"
                                                          style:UIAlertActionStyleCancel
                                                        handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:message message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:alertAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

//  Displays a JavaScript confirm panel.
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler {
    
    // 按钮
    UIAlertAction *alertActionCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        // 返回用户选择的信息
        completionHandler(NO);
    }];
    UIAlertAction *alertActionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }];
    // alert弹出框
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:message message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:alertActionCancel];
    [alertController addAction:alertActionOK];
    [self presentViewController:alertController animated:YES completion:nil];
}

//  Displays a JavaScript text input panel.
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable result))completionHandler {
 
    // alert弹出框
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt message:nil preferredStyle:UIAlertControllerStyleAlert];
    // 输入框
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = defaultText;
    }];
    
    // 确定按钮
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 返回用户输入的信息
        UITextField *textField = alertController.textFields.firstObject;
        completionHandler(textField.text);
    }]];
    // 显示
    [self presentViewController:alertController animated:YES completion:nil];
}

//  预览某元素，现在只提供 links 预览
- (BOOL)webView:(WKWebView *)webView shouldPreviewElement:(WKPreviewElementInfo *)elementInfo API_AVAILABLE(ios(10.0)) {
    return YES;
}

//  Allows your app to provide a custom view controller to show when the given element is peeked.
- (nullable UIViewController *)webView:(WKWebView *)webView previewingViewControllerForElement:(WKPreviewElementInfo *)elementInfo defaultActions:(NSArray<id <WKPreviewActionItem>> *)previewActions API_AVAILABLE(ios(10.0)) {
    return nil;
}


- (void)webView:(WKWebView *)webView commitPreviewingViewController:(UIViewController *)previewingViewController API_AVAILABLE(ios(10.0)) {
    
}
@end
