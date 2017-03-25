//
//  JSTopCmtModel.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/24.
//  Copyright © 2017年 ShenYj. All rights reserved.
//  最热评论

#import <Foundation/Foundation.h>
@class JSUserModel;


@interface JSTopCmtModel : NSObject
/** 评论内容 */
@property (nonatomic,copy) NSString *content;
/** 评论时间 */
@property (nonatomic,copy) NSString *ctime;
@property (nonatomic,copy) NSString *date_id;
/** 评论用户 */
@property (nonatomic,strong) JSUserModel *user;
/** 喜欢数量 */
@property (nonatomic,copy)  NSString *like_count;

//@property (nonatomic,copy) NSString *precid;
//@property (nonatomic,strong) NSArray *precmt;
//@property (nonatomic,copy) NSString *preuid;
//@property (nonatomic,copy) NSString *status;
//@property (nonatomic,copy) NSString *voicetime;
//@property (nonatomic,copy) NSString *voiceurl;
//@property (nonatomic,copy) NSString *id;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)topcmtWithDict:(NSDictionary *)dict;


@end
