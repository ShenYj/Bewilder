//
//  JSLoginViewController.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/7.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSLoginViewController.h"
#import "JSTopLoginView.h"
#import "JSCenterLoginView.h"
#import "JSSSOLoginView.h"

static CGFloat const kTopViewMargin = 34.f;         // 顶部关闭注册视图距离父控制器View的间距

@interface JSLoginViewController () <JSTopLoginViewCloseControllerDelegate>

/** 顶部关闭&注册帐号视图 */
@property (nonatomic,strong) JSTopLoginView *closeRegisteView;
/** 中间的账号密码登录视图 */
@property (nonatomic,strong) JSCenterLoginView *centerLoginView;
/** 底部快速登录视图 */
@property (nonatomic,strong) JSSSOLoginView *ssoLoginView;

@end

@implementation JSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareView];
}

- (void)prepareView {
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"login_register_background"].CGImage);
    self.view.layer.contentsScale = [UIScreen mainScreen].scale;
    
    [self.view addSubview:self.ssoLoginView];
    [self.view addSubview:self.centerLoginView];
    [self.view addSubview:self.closeRegisteView];
    
    [self.closeRegisteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).mas_offset(kTopViewMargin);
    }];
    
    [self.centerLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.closeRegisteView.mas_bottom).mas_offset(kTopViewMargin);
        make.left.right.mas_equalTo(self.view);
    }];
    
    [self.ssoLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(self.view);
    }];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.centerLoginView endEditing:YES];
}


#pragma mark
#pragma mark - JSTopLoginViewCloseControllerDelegate

- (void)closeLoginRegisterViewControllerWithTopLoginView:(JSTopLoginView *)topLoginView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)registAccountWithTopLoginView:(JSTopLoginView *)topLoginView {
    NSLog(@"%s",__func__);
}

#pragma mark
#pragma mark - lazy

- (JSTopLoginView *)closeRegisteView {
    if (!_closeRegisteView) {
        _closeRegisteView = [[JSTopLoginView alloc] init];
        _closeRegisteView.delegate = self;
    }
    return _closeRegisteView;
}

- (JSCenterLoginView *)centerLoginView {
    if (!_centerLoginView) {
        _centerLoginView = [[JSCenterLoginView alloc] init];
    }
    return _centerLoginView;
}

- (JSSSOLoginView *)ssoLoginView {
    if (!_ssoLoginView) {
        _ssoLoginView = [[JSSSOLoginView alloc] init];
    }
    return _ssoLoginView;
}


@end
