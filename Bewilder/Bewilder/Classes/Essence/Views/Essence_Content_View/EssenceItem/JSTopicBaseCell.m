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
    //self.backgroundColor = JS_Gray_Color(236);
    self.backgroundColor = [UIColor purpleColor];
    //self.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"mainCellBackground"].CGImage);
    //self.layer.contentsScale = [UIScreen mainScreen].scale;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.topic_top_status];
    [self.contentView addSubview:self.centerAreaView];
    [self.contentView addSubview:self.topic_comment_view];
    [self.contentView addSubview:self.topic_bottom_toolbar];
    
    [self.topic_top_status mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView);
    }];
    [self.centerAreaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topic_top_status.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(0);
    }];
    [self.topic_comment_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.centerAreaView.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
        // new
        make.height.mas_equalTo(0);
    }];
    [self.topic_bottom_toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        self.topic_bottom_toolbar_top_constraint = make.top.mas_equalTo(self.topic_comment_view.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
        // xocde 8 + ios 10 约束问题
        make.bottom.mas_equalTo(self.contentView);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
        // xocde 8 + ios 10 约束问题
        make.bottom.mas_equalTo(self).mas_offset(-kMargin);
        //make.bottom.mas_equalTo(self.topic_bottom_toolbar).mas_offset(kMargin);
    }];
    
}

- (void)setFrame:(CGRect)frame {
    CGRect f = CGRectMake(frame.origin.x+kMargin, frame.origin.y, frame.size.width - 2*kMargin, frame.size.height);
    [super setFrame:f];
}

- (void)setTopicModel:(JSTopicModel *)topicModel {
    _topicModel = topicModel;

    self.topic_top_status.topicModel = topicModel;
    self.topic_bottom_toolbar.topicModel = topicModel;

    // 更新中间的视频/音频/图片视图高度
    if ((topicModel.type != TopicCellStyleDefault || topicModel.type != TopicCellStyleText) && (topicModel.width != 0 || topicModel.height != 0)) {
        [self.centerAreaView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(topicModel.topicCellCenterContentViewHeight);
        }];
    } else {
        [self.centerAreaView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }
    // 更新最热评论的高度约束
    if (topicModel.top_cmt.count > 0) {
        self.topic_comment_view.hidden = NO;
        self.topic_comment_view.topCmtModel = topicModel.top_cmt.firstObject;
        [self.topic_comment_view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(topicModel.topicCellTopicCommentViewHeigth);
        }];
    } else {
        self.topic_comment_view.hidden = YES;
        self.topic_comment_view.topCmtModel = nil;
        [self.topic_comment_view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(topicModel.topicCellTopicCommentViewHeigth);
        }];
    }
    // FIXME: toolbar设置了5条约束,自身高度优先级最高,上左下右
    [self.topic_bottom_toolbar_top_constraint uninstall];

}


#pragma mark
#pragma mark - lazy

- (JSBaseTop *)topic_top_status {
    if (!_topic_top_status) {
        _topic_top_status = [[JSBaseTop alloc] init];
    }
    return _topic_top_status;
}

- (UIView *)centerAreaView {
    if (!_centerAreaView) {
        _centerAreaView = [[UIView alloc] init];
        _centerAreaView.backgroundColor = [UIColor grayColor];
    }
    return _centerAreaView;
}

- (JSTopCommentView *)topic_comment_view {
    if (!_topic_comment_view) {
        _topic_comment_view = [[JSTopCommentView alloc] init];
    }
    return _topic_comment_view;
}

- (JSBaseBottom *)topic_bottom_toolbar {
    if (!_topic_bottom_toolbar) {
        _topic_bottom_toolbar = [[JSBaseBottom alloc] init];
    }
    return _topic_bottom_toolbar;
}

@end



