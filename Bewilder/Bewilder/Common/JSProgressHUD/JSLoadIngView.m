//
//  JSLoadIngView.m
//  JSProgressHUD
//
//  Created by ShenYj on 2017/5/27.
//  Copyright © 2017年 Auko. All rights reserved.
//

#import "JSLoadIngView.h"

static NSString * const kLogoImageName = @"ic_loading_logo";        // LOGO 图
static NSString * const kRotaImageName = @"real_short_btn2";        // 圆环  图

@interface JSLoadIngView ()

/** LOGO图片 : 不动 */
@property (nonatomic,strong) UIImageView *loadingLogoImageView;
/** LOGO外围圆环: 旋转 */
@property (nonatomic,strong) UIImageView *loadingRotationImageView;
/*** 资源bundle ***/
@property (nonatomic,strong) NSBundle    *srcBundle;

@end

@implementation JSLoadIngView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpLoadingView];
    }
    return self;
}

- (void)setUpLoadingView
{
    // 设置背景色
    self.backgroundColor = [UIColor clearColor];
    // 添加子控件
    [self addSubview:self.loadingRotationImageView];
    [self addSubview:self.loadingLogoImageView];
    [self addSubview:self.contentLabel];
    // 添加约束
    [self.loadingRotationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.mas_equalTo(self);
    }];
    [self.loadingLogoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loadingRotationImageView.mas_bottom).mas_offset(5);
        make.centerX.mas_equalTo(self);
    }];
    
    UIImage *rotationImage = [UIImage imageNamed:kLogoImageName inBundle:self.srcBundle compatibleWithTraitCollection:nil];
    UIImage *logoImage = [UIImage imageNamed:kRotaImageName inBundle:self.srcBundle compatibleWithTraitCollection:nil];
    
    __weak typeof(self) weakSelf = self;
    [logoImage js_ImageWithSize:CGSizeMake(70, 70) completion:^(UIImage *img) {
        weakSelf.loadingRotationImageView.image = img;
    }];
    [rotationImage js_ImageWithSize:CGSizeMake(50, 50) completion:^(UIImage *img) {
        weakSelf.loadingLogoImageView.image = img;
    }];
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima.byValue = @(M_PI*2);
    anima.duration = 1.0f;
    anima.repeatCount = CGFLOAT_MAX;
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    [self.loadingRotationImageView.layer addAnimation:anima forKey:nil];
}

#pragma mark
#pragma mark - lazy

- (UIImageView *)loadingLogoImageView {
    if (!_loadingLogoImageView) {
        _loadingLogoImageView = [[UIImageView alloc] init];
    }
    return _loadingLogoImageView;
}
- (UIImageView *)loadingRotationImageView {
    if (!_loadingRotationImageView) {
        _loadingRotationImageView = [[UIImageView alloc] init];
    }
    return _loadingRotationImageView;
}
- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.text = @"正在加载中...";
    }
    return _contentLabel;
}
- (NSBundle *)srcBundle {
    if (!_srcBundle) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"src.bundle" ofType:nil];
        _srcBundle = [NSBundle bundleWithPath:path];
    }
    return _srcBundle;
}

@end
