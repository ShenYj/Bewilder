//
//  JSTopicModel.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/20.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSTopicModel.h"

@implementation JSTopicModel

- (instancetype)initWithTopicDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)topicWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithTopicDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
    
- (NSString *)description {
    NSArray *keys = @[@"name",@"profile_image",@"text",@"created_at",@"ding",@"cai",@"repost",@"commnet"];
    return [self dictionaryWithValuesForKeys:keys].description;
    
}

@end
