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

@interface JSLoginViewController () <JSTopLoginViewCloseControllerDelegate,JSCenterLoginViewDelegate,JSSSOLoginViewDelegate>

/** 顶部关闭&注册帐号视图 */
@property (nonatomic,strong) JSTopLoginView *closeRegisteView;
/** 中间的账号密码登录视图 & 注册账号视图 */
@property (nonatomic,strong) JSCenterLoginView *centerLoginView;
@property (nonatomic,strong) JSCenterLoginView *centerRegistView;
@property (nonatomic,assign) CGFloat centerViewOffset;              // 中间登录视图和注册视图滚动切换偏移量(每次偏移量 = 当前值 * -1)

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
    self.centerViewOffset = SCREEN_WIDTH;
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"login_register_background"].CGImage);
    self.view.layer.contentsScale = [UIScreen mainScreen].scale;
    
    [self.view addSubview:self.ssoLoginView];
    [self.view addSubview:self.centerLoginView];
    [self.view addSubview:self.centerRegistView];
    [self.view addSubview:self.closeRegisteView];
    
    [self.closeRegisteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).mas_offset(kTopViewMargin);
    }];
    
    [self.centerLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.closeRegisteView.mas_bottom).mas_offset(kTopViewMargin);
        make.left.right.mas_equalTo(self.view);
    }];
    
    [self.centerRegistView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.centerLoginView.mas_right);
        make.top.mas_equalTo(self.centerLoginView);
        make.width.mas_equalTo(self.centerLoginView);
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
    [self.view endEditing:YES];
}


#pragma mark
#pragma mark - JSTopLoginViewCloseControllerDelegate

- (void)closeLoginRegisterViewControllerWithTopLoginView:(JSTopLoginView *)topLoginView {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)registAccountWithTopLoginView:(JSTopLoginView *)topLoginView {
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.5 delay:0.25 usingSpringWithDamping:0.5 initialSpringVelocity:1.0 options:0 animations:^{
        self.centerViewOffset *= -1;
        self.centerLoginView.transform = CGAffineTransformTranslate(self.centerLoginView.transform, self.centerViewOffset, 0);
        self.centerRegistView.transform = CGAffineTransformTranslate(self.centerRegistView.transform, self.centerViewOffset, 0);
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark
#pragma mark - JSCenterLoginViewDelegate

- (void)centerLoginView:(JSCenterLoginView *)centerLoginView viewMode:(JSCenterLoginViewMode)mode {
    switch (mode) {
        case JSCenterLoginViewModeLoginIn:
            NSLog(@"登录");
            break;
        case JSCenterLoginViewModeRegister:
            NSLog(@"注册");
            break;
        default:
            break;
    }
}

#pragma mark
#pragma mark - JSSSOLoginViewDelegate

- (void)ssoLoginView:(JSSSOLoginView *)ssoLoginView buttonType:(SSOButtonType)type {
    
    switch (type) {
        case SSOButtonTypeSinaWB:
            NSLog(@"新浪微博登录");
            break;
        case SSOButtonTypeQQ:
            NSLog(@"QQ账号登录");
            break;
        case SSOButtonTypeTencentWB:
            NSLog(@"腾讯微博登录");
            break;
        default:
            break;
    }
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
        _centerLoginView = [[JSCenterLoginView alloc] initWithCenterViewMode:JSCenterLoginViewModeLoginIn];
        _centerLoginView.delegate = self;
    }
    return _centerLoginView;
}

- (JSCenterLoginView *)centerRegistView {
    if (!_centerRegistView) {
        _centerRegistView = [[JSCenterLoginView alloc] initWithCenterViewMode:JSCenterLoginViewModeRegister];
        _centerRegistView.delegate = self;
    }
    return _centerRegistView;
}

- (JSSSOLoginView *)ssoLoginView {
    if (!_ssoLoginView) {
        _ssoLoginView = [[JSSSOLoginView alloc] init];
        _ssoLoginView.delegate = self;
    }
    return _ssoLoginView;
}


@end
