//
//  JSTopicInfo.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/20.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSTopicInfo : NSObject

/** 帖子最大id */
@property (nonatomic,copy) NSString *maxid;
@property (nonatomic,copy) NSString *maxtime;
@property (nonatomic,copy) NSString *vendor;
@property (nonatomic,strong) NSNumber *count;
@property (nonatomic,strong) NSNumber *page;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)infoWithDict:(NSDictionary *)dict;

@end
