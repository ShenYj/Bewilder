//
//  JSBaseTop.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/21.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSBaseTop.h"
#import "JSBaseConst.h"
#import "JSTopicModel.h"

@interface JSBaseTop ()

/** 用户头像 */
@property (nonatomic,strong) UIImageView *iconImageView;
/** 用户昵称 */
@property (nonatomic,strong) UILabel *nickNameLabel;
/** 内容 */
@property (nonatomic,strong) UILabel *contentLabel;

@end

@implementation JSBaseTop

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareBaseTopView];
    }
    return self;
}

- (void)prepareBaseTopView {
    
    self.backgroundColor = [UIColor greenColor];
    [self addSubview:self.iconImageView];
    [self addSubview:self.nickNameLabel];
    [self addSubview:self.contentLabel];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self).mas_offset(kMargin);
        make.size.mas_equalTo(CGSizeMake(kIconImageViewSize, kIconImageViewSize));
    }];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(kMargin);
        make.centerY.mas_equalTo(self.iconImageView);
        make.right.mas_equalTo(self).mas_offset(-kMargin);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconImageView.mas_bottom).mas_offset(kMargin);
        make.left.mas_equalTo(self).mas_offset(kMargin);
        make.right.mas_equalTo(self).mas_offset(-kMargin);
    }];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentLabel).mas_offset(kMargin);
    }];
}

- (void)setTopicModel:(JSTopicModel *)topicModel {
    _topicModel = topicModel;
    [self.iconImageView yy_setImageWithURL:[NSURL URLWithString:topicModel.profile_image] options:YYWebImageOptionShowNetworkActivity];
    self.nickNameLabel.text = topicModel.name;
    self.contentLabel.text = topicModel.text;
    
//    CGRect bounds = [self.contentLabel.text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 2*kMargin, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11]} context:nil];
//    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(bounds.size.height);
//    }];
//
}

#pragma mark
#pragma mark - lazy

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconImageView;
}

- (UILabel *)nickNameLabel {
    if (!_nickNameLabel) {
        _nickNameLabel = [[UILabel alloc] init];
        _nickNameLabel.textColor = [UIColor blackColor];
        _nickNameLabel.font = [UIFont systemFontOfSize:13];
    }
    return _nickNameLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.font = [UIFont systemFontOfSize:11];
        _contentLabel.numberOfLines = 0;
        _contentLabel.backgroundColor = [UIColor whiteColor];
    }
    return _contentLabel;
}

@end
