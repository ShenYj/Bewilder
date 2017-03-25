//
//  JSUser.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/24.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSUserModel.h"

@implementation JSUserModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)userWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end
