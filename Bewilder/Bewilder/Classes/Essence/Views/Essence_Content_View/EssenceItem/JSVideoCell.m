//
//  JSVideoCell.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/22.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSVideoCell.h"
#import "JSTopicModel.h"


@interface JSVideoCell ()
/** 背景图片 */
@property (nonatomic,strong) UIImageView *backgroundImgView;
@end

@implementation JSVideoCell

- (void)prepareBaseCellView {
    [super prepareBaseCellView];
      
    [self.contentView addSubview:self.backgroundImgView];
}

- (void)setTopicModel:(JSTopicModel *)topicModel {
    [super setTopicModel:topicModel];
    [self.backgroundImgView yy_setImageWithURL:[NSURL URLWithString:topicModel.profile_image] options:YYWebImageOptionShowNetworkActivity];
    [self.backgroundImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    if ((topicModel.type != TopicCellStyleText || topicModel.type != TopicCellStyleDefault) && (topicModel.height != 0 || topicModel.width != 0)) {
        
    }
    /*
    // 根据是否有最热评论调整底部ToolBar约束
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
     */
    
}

#pragma mark
#pragma mark - lazy

- (UIImageView *)backgroundImgView {
    if (!_backgroundImgView) {
        _backgroundImgView = [[UIImageView alloc]  init];
    }
    return _backgroundImgView;
}



@end
