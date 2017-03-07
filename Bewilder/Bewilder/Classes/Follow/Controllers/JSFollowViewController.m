//
//  JSFollowViewController.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/6.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSFollowViewController.h"
#import "JSLoginViewController.h"

static NSString * const reusedIdentifier = @"followReusedIdentifier";
static CGFloat const kSubViewMargin = 20.f;                             // 内部子控件间距

@interface JSFollowViewController ()

@property (nonatomic,strong) UIImageView *top_imgV;
@property (nonatomic,strong) UILabel *center_Label;
@property (nonatomic,strong) UIButton *bottom_LoginBtn;

@end

@implementation JSFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setUpUI {
    [super setUpUI];
    [self prepareNavigationBar];
    [self prepareView];
}

/** 设置导航条 */
- (void)prepareNavigationBar {
    self.js_navigationItem.title = @"我的关注";
    
    self.js_navigationItem.leftBarButtonItem = [[JSBaseNavBarButtonItem alloc] initWithNormalImgName:@"friendsRecommentIcon" withHighlightedImgName:@"friendsRecommentIcon-click" withTarget:self withAction:@selector(clickLeftNavigationBarItem:)];
}

/** 设置主界面视图 */
- (void)prepareView {
    // 隐藏基类控制器下的tableView
    self.tableView.hidden = YES;
    
    [self.view addSubview:self.center_Label];
    [self.view addSubview:self.top_imgV];
    [self.view addSubview:self.bottom_LoginBtn];
    
    [self.center_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self.view);
    }];
    [self.top_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.center_Label.mas_top).mas_offset(-kSubViewMargin);
        make.centerX.mas_equalTo(self.center_Label);
    }];
    [self.bottom_LoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.center_Label.mas_bottom).mas_offset(kSubViewMargin);
        make.centerX.mas_equalTo(self.center_Label);
        make.left.mas_equalTo(self.view).mas_offset(kSubViewMargin);
        make.right.mas_equalTo(self.view).mas_offset(-kSubViewMargin);
    }];
}

- (void)prepareTableView {
    [super prepareTableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reusedIdentifier];
}


- (void)clickLeftNavigationBarItem:(JSBaseNavBarButtonItem *)sender {
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark - lazy

- (UIImageView *)top_imgV {
    if (_top_imgV == nil) {
        _top_imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header_cry_icon"]];
        [_top_imgV sizeToFit];
    }
    return _top_imgV;
}
- (UILabel *)center_Label {
    if (_center_Label == nil) {
        _center_Label = [[UILabel alloc] init];
        _center_Label.font = [UIFont systemFontOfSize:16];
        _center_Label.textAlignment = NSTextAlignmentCenter;
        _center_Label.textColor = [UIColor purpleColor];
        _center_Label.numberOfLines = 0;
        _center_Label.text = @"快快登录吧,关注百思最牛的人\n好友动态让你过把瘾儿~\n欧耶~~~~!\n";
    }
    return _center_Label;
}
- (UIButton *)bottom_LoginBtn {
    if (_bottom_LoginBtn == nil) {
        _bottom_LoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bottom_LoginBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_bottom_LoginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [_bottom_LoginBtn setTitle:@"立即登录/注册" forState:UIControlStateNormal];
        [_bottom_LoginBtn setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login"] forState:UIControlStateNormal];
        [_bottom_LoginBtn setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login_click"] forState:UIControlStateHighlighted];
    }
    return _bottom_LoginBtn;
}


@end
