//
//  JSTopLoginView.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/7.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSTopLoginView.h"

static CGFloat const kMargin = 20.f;            // 间距
static CGFloat const kSelfHeigth = 50.f;        // 自身高度

@interface JSTopLoginView ()

@property (nonatomic,strong) UIButton *closeBtn;
@property (nonatomic,strong) UIButton *registerBtn;

@end

@implementation JSTopLoginView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self prepareView];
    }
    return self;
}

- (void)prepareView {
    
    [self addSubview:self.closeBtn];
    [self addSubview:self.registerBtn];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self).mas_offset(kMargin);
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.right.mas_equalTo(self).mas_offset(-kMargin);
    }];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(kSelfHeigth);
    }];
}

#pragma mark 
#pragma mark - close button target

- (void)closeLoginAndRegisterView:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(closeLoginRegisterViewControllerWithTopLoginView:)]) {
        [self.delegate closeLoginRegisterViewControllerWithTopLoginView:self];
    }
}

- (void)clickRegistButton:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
    if ([self.delegate respondsToSelector:@selector(registAccountWithTopLoginView:)]) {
        [self.delegate registAccountWithTopLoginView:self];
    }
}

#pragma mark
#pragma mark - lazy

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [[UIButton alloc] init];
        [_closeBtn setImage:[UIImage imageNamed:@"login_close_icon"] forState:UIControlStateNormal];
        [_closeBtn setImage:[UIImage imageNamed:@"login_close_icon_click"] forState:UIControlStateHighlighted];
        [_closeBtn addTarget:self action:@selector(closeLoginAndRegisterView:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

- (UIButton *)registerBtn {
    if (!_registerBtn) {
        _registerBtn = [[UIButton alloc] init];
        [_registerBtn setTitle:@"注册账号" forState:UIControlStateNormal];
        [_registerBtn setTitle:@"登录账号" forState:UIControlStateSelected];
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_registerBtn addTarget:self action:@selector(clickRegistButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}

@end
