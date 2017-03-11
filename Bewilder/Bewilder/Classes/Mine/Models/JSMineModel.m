//
//  JSMineModel.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/11.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSMineModel.h"
#import "JSSquareListModel.h"
#import "JSTagList.h"

@implementation JSMineModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)mineWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setSquare_list:(NSArray<JSSquareListModel *> *)square_list {
    
    NSMutableArray *tempArr = [NSMutableArray array];
    for (NSDictionary *dict in square_list) {
        JSSquareListModel *model = [JSSquareListModel squareListWithDict:dict];
        [tempArr addObject:model];
    }
    _square_list = tempArr;
}

- (void)setTag_list:(NSArray<JSTagList *> *)tag_list {
    NSMutableArray *tempArr = [NSMutableArray array];
    for (NSDictionary *dict in tag_list) {
        JSTagList *model = [JSTagList tagListWithDict:dict];
        [tempArr addObject:model];
    }
    _tag_list = tempArr;
}

- (NSString *)description {
    NSArray *keys = @[@"square_list",@"tag_list"];
    return [self dictionaryWithValuesForKeys:keys].description;
}

@end
