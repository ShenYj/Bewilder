//
//  JSCenterLoginView.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/8.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSCenterLoginView.h"

static CGFloat const kBackgroundImgViewHeigth = 92.f;           // 背景图高度
static CGFloat const kBackgroundImgViewWidth = 266.f;           // 背景图宽度
static CGFloat const kMargin = 10.f;                            // 间距

@interface JSCenterLoginView ()

/** 背景图片 */
@property (nonatomic,strong) UIImageView *backgroundImgView;
/** 帐号密码输入框 */
@property (nonatomic,strong) UITextField *userAccountTF;
@property (nonatomic,strong) UITextField *userPasswordTF;


@end

@implementation JSCenterLoginView

//266 92
- (instancetype)init {
    self = [super init];
    if (self) {
        [self prepareView];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.userAccountTF resignFirstResponder];
    [self.userPasswordTF resignFirstResponder];
}

- (void)prepareView {
    [self addSubview:self.backgroundImgView];
    [self addSubview:self.userAccountTF];
    [self addSubview:self.userPasswordTF];
    
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
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.backgroundImgView).mas_offset(kMargin);
    }];
}

#pragma mark
#pragma mark - lazy

- (UIImageView *)backgroundImgView {
    if (!_backgroundImgView) {
        _backgroundImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_rgister_textfield_bg"]];
    }
    return _backgroundImgView;
}

- (UITextField *)userAccountTF {
    if (!_userAccountTF) {
        _userAccountTF = [[UITextField alloc] init];
        _userAccountTF.textColor = [UIColor whiteColor];
        _userAccountTF.borderStyle = UITextBorderStyleNone;
        _userAccountTF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2*kMargin, 0)];
        _userAccountTF.leftViewMode = UITextFieldViewModeAlways;
        NSMutableAttributedString *mAttriString = [[NSMutableAttributedString alloc] initWithString:@"手机号"];
        [mAttriString addAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} range:NSMakeRange(0, mAttriString.length)];
        _userAccountTF.attributedPlaceholder = mAttriString;
        _userAccountTF.keyboardType = UIKeyboardTypeNumberPad;
        _userAccountTF.clearButtonMode = UITextFieldViewModeAlways;
    }
    return _userAccountTF;
}

- (UITextField *)userPasswordTF {
    if (!_userPasswordTF) {
        _userPasswordTF = [[UITextField alloc] init];
        _userPasswordTF.textColor = [UIColor whiteColor];
        _userPasswordTF.borderStyle = UITextBorderStyleNone;
        _userPasswordTF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2*kMargin, 0)];
        _userPasswordTF.leftViewMode = UITextFieldViewModeAlways;
        NSMutableAttributedString *mAttriString = [[NSMutableAttributedString alloc] initWithString:@"密码"];
        [mAttriString addAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} range:NSMakeRange(0, mAttriString.length)];
        _userPasswordTF.attributedPlaceholder = mAttriString;
        _userPasswordTF.secureTextEntry = YES;
        _userPasswordTF.clearButtonMode = UITextFieldViewModeAlways;
    }
    return _userPasswordTF;
}

@end
