//
//  JSMineSubViewController.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/12.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSMineSubViewController.h"
#import <WebKit/WebKit.h>

@interface JSMineSubViewController ()

@property (nonatomic,strong) WKWebView *webView;

@end

@implementation JSMineSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareView];
}

- (void)prepareView {
    self.view.backgroundColor = [UIColor whiteColor];
    //self.tableView.hidden = YES;
    //[self.view insertSubview:self.webView belowSubview:self.js_NavigationBar];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.js_NavigationBar.mas_bottom);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
    self.webView.backgroundColor = [UIColor lightGrayColor];
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
#pragma mark - lazy

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] init];
    }
    return _webView;
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
