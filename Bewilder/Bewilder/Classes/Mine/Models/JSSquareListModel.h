//
//  JSSquareListModel.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/11.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSSquareListModel : NSObject

@property (nonatomic,copy) NSString *android;
@property (nonatomic,copy) NSString *iphone;
@property (nonatomic,copy) NSString *ipad;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *id_squareList;
@property (nonatomic,copy) NSString *market;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *url;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)squareListWithDict:(NSDictionary *)dict;


@end
