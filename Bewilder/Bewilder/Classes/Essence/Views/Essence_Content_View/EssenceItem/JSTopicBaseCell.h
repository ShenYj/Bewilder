//
//  JSTopicBaseCell.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/21.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JSTopicModel;
@class JSBaseTop;
@class JSBaseBottom;
@class JSTopCommentView;

@interface JSTopicBaseCell : UITableViewCell

/** 设置baseCell视图 */
- (void)prepareBaseCellView NS_REQUIRES_SUPER;

/** 模型数据 */
@property (nonatomic,strong) JSTopicModel *topicModel;
/** 顶部视图 */
@property (nonatomic,strong) JSBaseTop *topic_top_status;
/** 中间视图 */
@property (nonatomic,strong) UIView *centerAreaView;
/** 最热评论 */
@property (nonatomic,strong) JSTopCommentView *topic_comment_view;
/** 底部toolbar */
@property (nonatomic,strong) JSBaseBottom *topic_bottom_toolbar;

/** 底部toolbar的顶部约束 */
@property (nonatomic,strong) MASConstraint *topic_bottom_toolbar_top_constraint;


@end
