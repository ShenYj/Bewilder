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

- (void)loadDatasWithCompletionHandler:(void(^)(JSMineModel *response ,BOOL isCompletion))completionHandler {
    
    NSString *urlString = @"http://api.budejie.com/api/api_open.php";
    NSDictionary *paras = @{
                            @"a": @"square",
                            @"c": @"topic"
                            };
    [self GET:urlString parameters:paras progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        JSMineModel *mineModel = [JSMineModel mineWithDict:responseObject];
        completionHandler(mineModel,YES);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error) {
            NSLog(@"请求失败(%s)-%@",__func__,error);
        }
        completionHandler(nil,NO);
    }];
}

@end
