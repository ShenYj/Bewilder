//
//  JSNetworkManager+JSEssenceDatas.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/20.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSNetworkManager+JSEssenceDatas.h"
#import "JSTopicInfo.h"


@implementation JSNetworkManager (JSEssenceDatas)

- (void)pullDatasWithStyle:(TopicCellStyle)style CompletionHandler:(void(^)(NSArray <JSTopicModel *> *response ,JSTopicInfo *topicInfo,BOOL isCompletion))completionHandler {
    NSString *urlString = @"http://api.budejie.com/api/api_open.php";
    NSDictionary *paras = @{
                            @"a": @"list",
                            @"c": @"data",
                            @"type": @(style).description
                            };
    // 取消上一个请求
    if (self.tasks.count > 0) {
        [self.tasks makeObjectsPerformSelector:@selector(cancel)];
    }
    
    [self requestMethod:RequestMethodGet urlString:urlString parameters:paras compeletionHandler:^(NSDictionary * res, NSError *error) {
        if (error || !res) {
            NSLog(@"请求失败:%@",error);
            completionHandler(nil,nil,NO);
            return ;
        }
        
        NSArray *lists = res[@"list"];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in lists) {
            JSTopicModel *model = [JSTopicModel topicWithDict:dict];
            [tempArr addObject:model];
        }
        NSDictionary *info = res[@"info"];
        JSTopicInfo *topicInfo = [JSTopicInfo infoWithDict:info];
        
        completionHandler(tempArr.copy,topicInfo,YES);
        
    }];
    
}

- (void)loadMoreDatasWithMaxTime:(NSString *)maxTime Style:(TopicCellStyle)style WithCompletionHandler:(void (^)(NSArray<JSTopicModel *> *, JSTopicInfo *, BOOL))completionHandler {
    NSString *urlString = @"http://api.budejie.com/api/api_open.php";
    NSDictionary *paras = @{
                            @"a": @"list",
                            @"c": @"data",
                            @"maxtime": maxTime,
                            @"type": @(style).description
                            };
    // 取消上一个请求
    if (self.tasks.count > 0) {
        [self.tasks makeObjectsPerformSelector:@selector(cancel)];
    }
    [self requestMethod:RequestMethodGet urlString:urlString parameters:paras compeletionHandler:^(NSDictionary *  res, NSError *error) {
        if (error || !res) {
            NSLog(@"请求失败:%@",error);
            completionHandler(nil,nil,NO);
            return ;
        }
        NSArray *lists = res[@"list"];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in lists) {
            JSTopicModel *model = [JSTopicModel topicWithDict:dict];
            [tempArr addObject:model];
        }
        NSDictionary *info = res[@"info"];
        JSTopicInfo *topicInfo = [JSTopicInfo infoWithDict:info];
        completionHandler(tempArr.copy,topicInfo,YES);
    }];
}

- (void)loadMoreDatasWithMaxTime:(NSString *)maxTime WithCompletionHandler:(void(^)(NSArray <JSTopicModel *> *response , JSTopicInfo *topicInfo,BOOL isCompletion))completionHandler{
}

@end
