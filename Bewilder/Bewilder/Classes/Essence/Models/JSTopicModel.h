//
//  JSTopicModel.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/20.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JSTopCmtModel;

/** 帖子Cell类型 */
typedef NS_ENUM(NSUInteger, TopicCellStyle) {
    TopicCellStyleDefault   = 1,    // 全部 默认
    TopicCellStylePicture   = 10,   // 图片
    TopicCellStyleText      = 29,   // 段子
    TopicCellStyleVoice     = 31,   // 音频
    TopicCellStyleVideo     = 41    // 视频
};

@interface JSTopicModel : NSObject

/** Cell类型: 1-全部;10-图片;29-段子;31-音频;41-视频;默认为1  */
@property (nonatomic,assign) TopicCellStyle type;

/** 用户的名字 */
@property (nonatomic,copy) NSString *name;
/** 用户的头像 */
@property (nonatomic,copy) NSString *profile_image;
/** 帖子的文字内容 */
@property (nonatomic,copy) NSString *text;
/** 帖子审核通过的时间 */
@property (nonatomic,copy) NSString *created_at;
@property (nonatomic,copy,readonly) NSString *create_at_formatter;
/** 帖子创建的时间 */
@property (nonatomic,copy) NSString *create_time;

/** 顶数量 */
@property (nonatomic,strong) NSNumber *ding;
@property (nonatomic,copy,readonly) NSString *ding_string;
/** 踩数量 */
@property (nonatomic,strong) NSNumber *cai;
@property (nonatomic,copy,readonly) NSString *cai_string;
/** 转发\分享 数量 */
@property (nonatomic,strong) NSNumber *repost;
@property (nonatomic,copy,readonly) NSString *repost_string;
/** 评论数量 */
@property (nonatomic,strong) NSNumber *comment;
@property (nonatomic,copy,readonly) NSString *comment_string;
/** topic ID */
//@property (nonatomic,strong) NSNumber *t;

/** 最热评论 */
@property (nonatomic,strong) NSArray <JSTopCmtModel *>*top_cmt;

@property (nonatomic,assign,readonly) CGFloat topicCellRowHeight;

- (instancetype)initWithTopicDict:(NSDictionary *)dict;
+ (instancetype)topicWithDict:(NSDictionary *)dict;


@end
