//
//  JSMineModel.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/11.
//  Copyright © 2017年 ShenYj. All rights reserved.
//


#import <Foundation/Foundation.h>

@class JSSquareListModel;
@class JSTagList;

@interface JSMineModel : NSObject

@property (nonatomic,assign) CGFloat lastCellHeight;

@property (nonatomic,strong) NSArray <JSSquareListModel *> *square_list;
@property (nonatomic,strong) NSArray <JSTagList *> *tag_list;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)mineWithDict:(NSDictionary *)dict;


@end
