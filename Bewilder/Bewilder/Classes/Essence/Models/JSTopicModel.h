//
//  JSTopicModel.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/20.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSTopicModel : NSObject

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

@property (nonatomic,assign,readonly) CGFloat topicCellRowHeight;

- (instancetype)initWithTopicDict:(NSDictionary *)dict;
+ (instancetype)topicWithDict:(NSDictionary *)dict;


@end
