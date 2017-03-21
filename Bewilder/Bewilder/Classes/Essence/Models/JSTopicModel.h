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
/** 顶数量 */
@property (nonatomic,copy) NSString *ding;
/** 踩数量 */
@property (nonatomic,copy) NSString *cai;
/** 转发\分享 数量 */
@property (nonatomic,copy) NSString *repost;
/** 评论数量 */
@property (nonatomic,copy) NSString *commnet;
/** topic ID */
@property (nonatomic,strong) NSNumber *t;

@property (nonatomic,assign,readonly) CGFloat topicCellRowHeight;

- (instancetype)initWithTopicDict:(NSDictionary *)dict;
+ (instancetype)topicWithDict:(NSDictionary *)dict;


@end
