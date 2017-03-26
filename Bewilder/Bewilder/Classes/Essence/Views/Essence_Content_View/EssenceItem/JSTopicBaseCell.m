//
//  JSTopicBaseCell.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/21.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSTopicBaseCell.h"
#import "JSBaseTop.h"
#import "JSBaseBottom.h"
#import "JSBaseConst.h"
#import "JSTopicModel.h"
#import "JSTopCmtModel.h"
#import "JSTopCommentView.h"


@interface JSTopicBaseCell ()
@end

@implementation JSTopicBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self prepareBaseCellView];
    }
    return self;
}

- (void)prepareBaseCellView {
    self.backgroundColor = JS_Gray_Color(236);
    //self.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"mainCellBackground"].CGImage);
    //self.layer.contentsScale = [UIScreen mainScreen].scale;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.topic_top_status];
    [self.contentView addSubview:self.topic_bottom_toolbar];
    [self.contentView addSubview:self.topic_comment_view];
    
    [self.topic_top_status mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView);
    }];
    [self.topic_comment_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topic_top_status.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
    }];
    [self.topic_bottom_toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        self.topic_bottom_toolbar_top_constraint = make.top.mas_equalTo(self.topic_comment_view.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.topic_bottom_toolbar).mas_offset(kMargin);
    }];
}

- (void)setTopicModel:(JSTopicModel *)topicModel {
    _topicModel = topicModel;
    self.topic_top_status.topicModel = topicModel;
    self.topic_bottom_toolbar.topicModel = topicModel;
    [self.topic_bottom_toolbar_top_constraint uninstall];
    if (topicModel.top_cmt.count > 0) {
        self.topic_comment_view.hidden = NO;
        self.topic_comment_view.topCmtModel = topicModel.top_cmt.firstObject;
        [self.topic_bottom_toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
            self.topic_bottom_toolbar_top_constraint = make.top.mas_equalTo(self.topic_comment_view.mas_bottom);
        }];
    } else {
        self.topic_comment_view.hidden = YES;
        self.topic_comment_view.topCmtModel = nil;
        [self.topic_bottom_toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
            self.topic_bottom_toolbar_top_constraint = make.top.mas_equalTo(self.topic_top_status.mas_bottom);
        }];
    }

}


#pragma mark
#pragma mark - lazy

- (JSBaseTop *)topic_top_status {
    if (!_topic_top_status) {
        _topic_top_status = [[JSBaseTop alloc] init];
    }
    return _topic_top_status;
}

- (JSBaseBottom *)topic_bottom_toolbar {
    if (!_topic_bottom_toolbar) {
        _topic_bottom_toolbar = [[JSBaseBottom alloc] init];
    }
    return _topic_bottom_toolbar;
}

- (JSTopCommentView *)topic_comment_view {
    if (!_topic_comment_view) {
        _topic_comment_view = [[JSTopCommentView alloc] init];
    }
    return _topic_comment_view;
}

@end
