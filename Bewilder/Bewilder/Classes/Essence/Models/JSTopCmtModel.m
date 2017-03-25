//
//  JSTopCmtModel.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/24.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSTopCmtModel.h"
#import "JSUserModel.h"

@implementation JSTopCmtModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)topcmtWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"user"]) {
        JSUserModel *model = [JSUserModel userWithDict:(NSDictionary *)value];
        self.user = model;
    } else {
        [super setValue:value forKey:key];
    }
}

@end
