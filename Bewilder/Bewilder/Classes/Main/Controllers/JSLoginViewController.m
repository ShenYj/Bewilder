//
//  JSLoginViewController.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/7.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSLoginViewController.h"
#import "JSSSOLoginView.h"

@interface JSLoginViewController ()

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


#pragma mark
#pragma mark - lazy

- (JSSSOLoginView *)ssoLoginView {
    if (!_ssoLoginView) {
        _ssoLoginView = [[JSSSOLoginView alloc] init];
    }
    return _ssoLoginView;
}


@end
