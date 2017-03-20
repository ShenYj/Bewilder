//
//  JSNetworkManager+JSEssenceDatas.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/20.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSNetworkManager+JSEssenceDatas.h"
#import "JSTopicModel.h"

@implementation JSNetworkManager (JSEssenceDatas)

- (void)loadEssenceDatasWithCompletionHandler:(void(^)(NSArray <JSTopicModel *> *response ,BOOL isCompletion))completionHandler {
    NSString *urlString = @"http://api.budejie.com/api/api_open.php";
    NSDictionary *paras = @{
                            @"a": @"list",
                            @"c": @"data",
                            @"maxtime": @""
                            };
    [self requestMethod:RequestMethodGet urlString:urlString parameters:paras compeletionHandler:^(NSDictionary * res, NSError *error) {
        if (error || !res) {
            NSLog(@"请求失败:%@",error);
            completionHandler(nil,NO);
        }
        //NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"essence.plist"];
        //NSLog(@"%@",filePath);
        //[res writeToFile:filePath atomically:YES];
        NSArray *lists = res[@"list"];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in lists) {
            JSTopicModel *model = [JSTopicModel topicWithDict:dict];
            [tempArr addObject:model];
        }
        completionHandler(tempArr.copy,YES);
        
    }];
    
}

@end
