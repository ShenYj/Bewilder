//
//  JSMineSubViewController.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/12.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSMineSubViewController.h"
#import <WebKit/WebKit.h>
#import "JSWebViewToolBar.h"
@class JSWebViewToolBarItem;

static NSString * const kEstimatedProgress = @"estimatedProgress";

@interface JSMineSubViewController () <JSWebViewToolBarItemDelegate,WKNavigationDelegate>

@property (nonatomic,strong) UIProgressView *progressView;
@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) JSWebViewToolBar *bottomToolBar;

@end

@implementation JSMineSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareView];
}

- (void)prepareView {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.js_navigationItem.leftBarButtonItem = [[JSBaseNavBarButtonItem alloc] initWithTitle:@"返回" withFont:16 withNormalColor:nil withHighlightedColor:nil withTarget:self withAction:@selector(goBackToParentController:)isBack:YES withBackImageName:@"v2_goback"];
    
    [self.view addSubview:self.webView];
    [self.view addSubview:self.bottomToolBar];
    [self.view addSubview:self.progressView];
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.js_NavigationBar.mas_bottom);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
    [self.bottomToolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
    }];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.webView);
        make.height.mas_equalTo(2);
    }];
    
    
}

- (void)goBackToParentController:(JSBaseNavBarButtonItem *)sender {
    // Crash处理: 防止在webView页面未加载完时,点击返回按钮崩溃,判断当前webView是否在加载中,如果是停止加载,并在加载失败代理方法中移除观察者
    if (self.webView.isLoading) {
        [self.webView stopLoading];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

// KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"] && object == self.webView) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1) {
            self.progressView.hidden = YES;
            [self.progressView setProgress:0 animated:NO];
        }else {
            self.progressView.hidden = NO;
            [self.progressView setProgress:newprogress animated:YES];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([self.webView isLoading]) {
        [self.webView stopLoading];
    }
    [self.webView removeObserver:self forKeyPath:kEstimatedProgress context:nil];
    self.webView.navigationDelegate = nil;
}

- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
    
}

- (void)prepareTableView {/*空实现父类方法*/}

- (void)setUrlString:(NSString *)urlString {
    _urlString = urlString;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark - JSWebViewToolBarItemDelegate

- (void)webViewToolBar:(JSWebViewToolBar *)webViewToolbar withClickedItemMode:(JSWebViewToolBarItemMode)mode {
    
    switch (mode) {
        case JSWebViewToolBarItemModeBack:
            NSLog(@"JSWebViewToolBarItemModeBack");
            if ([self.webView canGoBack]) {
                [self.webView goBack];
            }
            break;
        case JSWebViewToolBarItemModeForward:
            NSLog(@"JSWebViewToolBarItemModeForward");
            if ([self.webView canGoForward]) {
                [self.webView goForward];
            }
            break;
        case JSWebViewToolBarItemModeRefresh:
            NSLog(@"JSWebViewToolBarItemModeRefresh");
            [self.webView reload];
            break;
        default:
            break;
    }
    
    
}

#pragma mark
#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
//    // 添加观察者
//    [self.webView addObserver:self forKeyPath:kEstimatedProgress options:NSKeyValueObservingOptionNew context:nil];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    self.bottomToolBar.canGoBack = [self.webView canGoBack];
    self.bottomToolBar.canGoForward = [self.webView canGoForward];
    // 移除观察者
//    [self.webView removeObserver:self forKeyPath:kEstimatedProgress context:nil];
    
}
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    if (error) {
        NSLog(@"加载失败:%@",error);
    }
//    [self.webView removeObserver:self forKeyPath:kEstimatedProgress context:nil];
}


#pragma mark
#pragma mark - lazy

- (UIProgressView *)progressView {
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressView.progressTintColor = [UIColor greenColor];
        _progressView.hidden = YES;
    }
    return _progressView;
}

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] init];
        _webView.backgroundColor = [UIColor lightGrayColor];
        _webView.navigationDelegate = self;
        // 添加观察者
        [_webView addObserver:self forKeyPath:kEstimatedProgress options:NSKeyValueObservingOptionNew context:nil];
    }
    return _webView;
}

- (JSWebViewToolBar *)bottomToolBar {
    if (!_bottomToolBar) {
        _bottomToolBar = [[JSWebViewToolBar alloc] init];
        _bottomToolBar.toolbarDelegate = self;
    }
    return _bottomToolBar;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
