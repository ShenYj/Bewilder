//
//  JSTagList.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/11.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSTagList : NSObject

@property (nonatomic,copy) NSString *theme_id;
@property (nonatomic,copy) NSString *theme_name;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)tagListWithDict:(NSDictionary *)dict;

@end
