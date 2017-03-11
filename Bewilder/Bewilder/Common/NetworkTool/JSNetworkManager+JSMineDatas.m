//
//  JSNetworkManager+JSMineDatas.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/11.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSNetworkManager+JSMineDatas.h"
#import "JSMineModel.h"
#import "JSSquareListModel.h"
#import "JSTagList.h"


@implementation JSNetworkManager (JSMineDatas)

- (void)loadDatasWithCompeletionHandler:(void(^)(JSMineModel *response, BOOL isOK))compeletionHandler {
    
    NSString *urlString = @"http://api.budejie.com/api/api_open.php";
    NSDictionary *paras = @{
                            @"a": @"square",
                            @"c": @"topic"
                            };
    [self GET:urlString parameters:paras progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        
        JSMineModel *mineModel = [JSMineModel mineWithDict:responseObject];
        mineModel != nil ? compeletionHandler(mineModel,YES) : compeletionHandler(nil,NO);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"请求失败(%s)-%@",__func__,error);
        }
    }];
}

@end
