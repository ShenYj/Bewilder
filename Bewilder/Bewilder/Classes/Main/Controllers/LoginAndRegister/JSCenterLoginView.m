//
//  JSCenterLoginView.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/8.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSCenterLoginView.h"
#import "JSLoginTextField.h"

static CGFloat const kBackgroundImgViewHeigth = 92.f;           // 背景图高度
static CGFloat const kBackgroundImgViewWidth = 266.f;           // 背景图宽度
static CGFloat const kMargin = 10.f;                            // 间距

@interface JSCenterLoginView ()

@property (nonatomic,assign) JSCenterLoginViewMode centerViewMode;

/** 背景图片 */
@property (nonatomic,strong) UIImageView *backgroundImgView;
/** 帐号密码输入框 */
@property (nonatomic,strong) JSLoginTextField *userAccountTF;
@property (nonatomic,strong) JSLoginTextField *userPasswordTF;

/** 登录按钮 */
@property (nonatomic,strong) UIButton *loginBtn;
/** 注册按钮 */
@property (nonatomic,strong) UIButton *forgetPWBtn;
@end

@implementation JSCenterLoginView

- (instancetype)initWithCenterViewMode:(JSCenterLoginViewMode)mode {
    self = [super init];
    if (self) {
        self.centerViewMode = mode;
        [self prepareView];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.userAccountTF resignFirstResponder];
    [self.userPasswordTF resignFirstResponder];
}

- (void)prepareView {
    
    [self addSubview: self.backgroundImgView];
    [self addSubview: self.userAccountTF];
    [self addSubview: self.userPasswordTF];
    [self addSubview: self.loginBtn];
    
    [self.backgroundImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(kBackgroundImgViewWidth, kBackgroundImgViewHeigth));
        make.centerX.equalTo(self);
        make.top.mas_equalTo(self).mas_offset(kMargin);
    }];
    [self.userAccountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.backgroundImgView);
        make.height.mas_equalTo(kBackgroundImgViewHeigth * 0.5);
    }];
    [self.userPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.backgroundImgView);
        make.top.mas_equalTo(self.userAccountTF.mas_bottom);
        make.bottom.mas_equalTo(self.backgroundImgView);
    }];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.backgroundImgView.mas_bottom).mas_offset(kMargin*2);
        make.left.right.mas_equalTo(self.backgroundImgView);
    }];
    
    // 登录视图
    if (self.centerViewMode == JSCenterLoginViewModeLoginIn) {
        
        [self addSubview: self.forgetPWBtn];
        [self.forgetPWBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.loginBtn.mas_bottom).mas_offset(kMargin);
            make.right.mas_equalTo(self.backgroundImgView);
        }];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.forgetPWBtn).mas_offset(kMargin);
        }];
        
        [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    } else {
        // 注册视图
        [self.loginBtn setTitle:@"注册" forState:UIControlStateNormal];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.loginBtn).mas_offset(kMargin);
        }];
    }
    
    // 通过 自定义textfield KVC方式设置占位label的文本颜色
    self.userAccountTF.placeholder = [self placeholderText:@"账号"];
    self.userPasswordTF.placeholder = [self placeholderText:@"密码"];
    
}

/** 设置占位文字 */
- (NSString *)placeholderText:(NSString *)text {
    if (self.centerViewMode == JSCenterLoginViewModeRegister) {
        return [NSString stringWithFormat:@"请输入%@",text];
    }
    return text;
}

#pragma mark
#pragma mark - target

- (void)clickLoginBtn:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(centerLoginView:viewMode:)]) {
        [self.delegate centerLoginView:self viewMode:self.centerViewMode];
    }
    
}
- (void)clickForgetPWBtn:(UIButton *)sender {
    
}


#pragma mark
#pragma mark - lazy

- (UIImageView *)backgroundImgView {
    if (!_backgroundImgView) {
        _backgroundImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_rgister_textfield_bg"]];
    }
    return _backgroundImgView;
}

- (JSLoginTextField *)userAccountTF {
    if (!_userAccountTF) {
        _userAccountTF = [[JSLoginTextField alloc] init];
        _userAccountTF.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _userAccountTF;
}

- (JSLoginTextField *)userPasswordTF {
    if (!_userPasswordTF) {
        _userPasswordTF = [[JSLoginTextField alloc] init];
        _userPasswordTF.secureTextEntry = YES;
    }
    return _userPasswordTF;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"login_register_button"] forState:UIControlStateNormal];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"login_register_button_click"] forState:UIControlStateHighlighted];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn sizeToFit];
        _loginBtn.layer.cornerRadius = 5;
        _loginBtn.layer.masksToBounds = YES;
        [_loginBtn addTarget:self action:@selector(clickLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (UIButton *)forgetPWBtn {
    if (!_forgetPWBtn) {
        _forgetPWBtn = [[UIButton alloc] init];
        [_forgetPWBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
        _forgetPWBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_forgetPWBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_forgetPWBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_forgetPWBtn sizeToFit];
        [_forgetPWBtn addTarget:self action:@selector(clickForgetPWBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetPWBtn;
}

@end
