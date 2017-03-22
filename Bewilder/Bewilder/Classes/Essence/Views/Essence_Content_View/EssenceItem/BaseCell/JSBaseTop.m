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
/** 发布时间 */
@property (nonatomic,strong) UILabel *created_atLabel;
/** 内容 */
@property (nonatomic,strong) UILabel *contentLabel;
/** 右上角的更多操作按钮 */
@property (nonatomic,strong) UIButton *moreButton;

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
    
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.iconImageView];
    [self addSubview:self.nickNameLabel];
    [self addSubview:self.created_atLabel];
    [self addSubview:self.moreButton];
    [self addSubview:self.contentLabel];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self).mas_offset(kMargin);
        make.size.mas_equalTo(CGSizeMake(kIconImageViewSize, kIconImageViewSize));
    }];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(kMargin);
        make.top.mas_equalTo(self.iconImageView);
    }];
    [self.created_atLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.iconImageView);
        make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(kMargin);
    }];
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(kMargin);
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

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setTopicModel:(JSTopicModel *)topicModel {
    _topicModel = topicModel;
    
    [self.iconImageView yy_setImageWithURL:[NSURL URLWithString:topicModel.profile_image] placeholder:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nickNameLabel.text = topicModel.name;
    self.created_atLabel.text = topicModel.create_at_formatter;
    self.contentLabel.text = topicModel.text;
    
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

- (UILabel *)created_atLabel {
    if (!_created_atLabel) {
        _created_atLabel = [[UILabel alloc] init];
        _created_atLabel.textColor = [UIColor blackColor];
        _created_atLabel.font = [UIFont systemFontOfSize:11];
    }
    return _created_atLabel;
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

- (UIButton *)moreButton {
    if (!_moreButton) {
        _moreButton = [[UIButton alloc] init];
        [_moreButton setImage:[UIImage imageNamed:@"cellmorebtnnormal"] forState:UIControlStateNormal];
        [_moreButton setImage:[UIImage imageNamed:@"cellmorebtnclick"] forState:UIControlStateHighlighted];
    }
    return _moreButton;
}

@end
