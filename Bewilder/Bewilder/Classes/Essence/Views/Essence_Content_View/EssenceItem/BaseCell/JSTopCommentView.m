//
//  JSTopCommentView.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/24.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSTopCommentView.h"
#import "JSTopCmtModel.h"
#import "JSBaseConst.h"
#import "JSUserModel.h"

@interface JSTopCommentView ()

@property (nonatomic,strong) UILabel *content_label;
@property (nonatomic,strong) UILabel *userName_Label;

@end

@implementation JSTopCommentView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self prepareTopCommentView];
    }
    return self;
}

- (void)prepareTopCommentView {
    self.backgroundColor = [UIColor lightTextColor];
    [self addSubview:self.userName_Label];
    [self addSubview:self.content_label];
    
    [self.userName_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self);
        //make.height.mas_equalTo(20);
    }];
    [self.content_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userName_Label.mas_bottom);
        make.left.mas_equalTo(self).mas_offset(kMargin);
        make.right.mas_equalTo(self).mas_offset(-kMargin);
    }];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.content_label);
    }];
}

- (void)setTopCmtModel:(JSTopCmtModel *)topCmtModel {
    _topCmtModel = topCmtModel;
    self.userName_Label.text = [NSString stringWithFormat:@"最热评论: %@",topCmtModel.user.username];
    self.content_label.text = topCmtModel.content;
}

#pragma mark
#pragma mark - lazy

- (UILabel *)content_label {
    if (!_content_label) {
        _content_label = [[UILabel alloc] init];
        _content_label.textColor = [UIColor purpleColor];
        _content_label.font = [UIFont systemFontOfSize:kTopCommentViewContentLabelFontSize];
        _content_label.textAlignment = NSTextAlignmentCenter;
        _content_label.numberOfLines = 0;
    }
    return _content_label;
}

- (UILabel *)userName_Label {
    if (!_userName_Label) {
        _userName_Label = [[UILabel alloc] init];
        _userName_Label.textColor = [UIColor purpleColor];
        _userName_Label.font = [UIFont systemFontOfSize:kTopCommentViewUserNameLabelFontSize];
        _userName_Label.textAlignment = NSTextAlignmentLeft;
    }
    return _userName_Label;
}

@end
