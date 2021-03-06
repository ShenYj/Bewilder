//
//  JSUser.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/24.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSUserModel : NSObject

/** 用户昵称 */
@property (nonatomic,copy) NSString *username;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)userWithDict:(NSDictionary *)dict;


@end
