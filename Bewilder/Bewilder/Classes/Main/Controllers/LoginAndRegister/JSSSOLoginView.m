//
//  JSSSOLoginView.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/7.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSSSOLoginView.h"
#import "JSSSOBtn.h"


static CGFloat const kMargin = 10.f;         // 顶部间距

@interface JSSSOLoginView ()

@property (nonatomic,strong) UILabel *detailLabel;                  // 顶部说明label
@property (nonatomic,strong) UIImageView *separatorLeftImgView;     // 左侧分割线
@property (nonatomic,strong) UIImageView *separatorRightImgView;    // 右侧分割线
@property (nonatomic,strong) JSSSOBtn *sinaBtn;                     // 新浪登录登录
@property (nonatomic,strong) JSSSOBtn *qqBtn;                       // qq登录
@property (nonatomic,strong) JSSSOBtn *tencentBtn;                  // 腾讯微博登录

@end

@implementation JSSSOLoginView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self prepareView];
    }
    return self;
}

- (void)prepareView {
    [self addSubview: self.detailLabel];
    [self addSubview: self.separatorLeftImgView];
    [self addSubview: self.separatorRightImgView];
    [self addSubview: self.sinaBtn];
    [self addSubview: self.qqBtn];
    [self addSubview: self.tencentBtn];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).mas_offset(kMargin);
    }];
    
    [self.separatorLeftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.detailLabel);
        make.right.mas_equalTo(self.detailLabel.mas_left).mas_offset(-kMargin);
    }];
    [self.separatorRightImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.detailLabel);
        make.left.mas_equalTo(self.detailLabel.mas_right).mas_offset(kMargin);
    }];
    
    NSArray *btnsArr = @[self.sinaBtn,self.qqBtn,self.tencentBtn];
    [btnsArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:kMargin leadSpacing:2*kMargin tailSpacing:2*kMargin];
    [btnsArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.detailLabel.mas_bottom).mas_offset(2*kMargin);
    }];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.tencentBtn).mas_offset(2*kMargin);
    }];
}

#pragma mark
#pragma mark- target

- (void)clickSSOButton:(JSSSOBtn *)sender {
    /*
     SSOButtonTypeSinaWB         = 1001,         // 新浪微博登录
     SSOButtonTypeQQ             = 1002,         // QQ账号登录
     SSOButtonTypeTencentWB      = 1003          // 腾讯微博登录
     */
    if ([self.delegate respondsToSelector:@selector(ssoLoginView:buttonType:)]) {
        
        switch (sender.tag) {
            case 1001:
                [self.delegate ssoLoginView:self buttonType:SSOButtonTypeSinaWB];
                break;
            case 1002:
                [self.delegate ssoLoginView:self buttonType:SSOButtonTypeQQ];
                break;
            case 1003:
                [self.delegate ssoLoginView:self buttonType:SSOButtonTypeTencentWB];
                break;
            default:
                break;
        }
    }
}

#pragma mark
#pragma mark - lazy

- (UILabel *)detailLabel {
    if (_detailLabel == nil) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.text = @"快速登录";
        _detailLabel.textColor = [UIColor whiteColor];
        _detailLabel.font = [UIFont systemFontOfSize:15];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _detailLabel;
}

- (UIImageView *)separatorLeftImgView {
    if (_separatorLeftImgView == nil) {
        _separatorLeftImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_register_left_line"]];
        [_separatorLeftImgView sizeToFit];
    }
    return _separatorLeftImgView;
}

- (UIImageView *)separatorRightImgView {
    if (_separatorRightImgView == nil) {
        _separatorRightImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_register_right_line"]];
        [_separatorLeftImgView sizeToFit];
    }
    return _separatorRightImgView;
}

- (JSSSOBtn *)sinaBtn {
    if (_sinaBtn == nil) {
        _sinaBtn = [JSSSOBtn buttonWithType:UIButtonTypeCustom];
        [_sinaBtn setImage:[UIImage imageNamed:@"login_sina_icon"] forState:UIControlStateNormal];
        [_sinaBtn setImage:[UIImage imageNamed:@"login_sina_icon_click"] forState:UIControlStateHighlighted];
        [_sinaBtn setTitle:@"新浪微博登录" forState:UIControlStateNormal];
        _sinaBtn.tag = 1001;
        [_sinaBtn addTarget:self action:@selector(clickSSOButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sinaBtn;

}

- (JSSSOBtn *)qqBtn {
    if (_qqBtn == nil) {
        _qqBtn = [JSSSOBtn buttonWithType:UIButtonTypeCustom];
        [_qqBtn setImage:[UIImage imageNamed:@"login_QQ_icon"] forState:UIControlStateNormal];
        [_qqBtn setImage:[UIImage imageNamed:@"login_QQ_icon_click"] forState:UIControlStateHighlighted];
        [_qqBtn setTitle:@"QQ登录" forState:UIControlStateNormal];
        _qqBtn.tag = 1002;
        [_qqBtn addTarget:self action:@selector(clickSSOButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _qqBtn;
}

- (JSSSOBtn *)tencentBtn {
    if (_tencentBtn == nil) {
        _tencentBtn = [JSSSOBtn buttonWithType:UIButtonTypeCustom];
        [_tencentBtn setImage:[UIImage imageNamed:@"login_tecent_icon"] forState:UIControlStateNormal];
        [_tencentBtn setImage:[UIImage imageNamed:@"login_tecent_icon_click"] forState:UIControlStateHighlighted];
        [_tencentBtn setTitle:@"腾讯微博登录" forState:UIControlStateNormal];
        _tencentBtn.tag = 1003;
        [_tencentBtn addTarget:self action:@selector(clickSSOButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tencentBtn;
}

@end
