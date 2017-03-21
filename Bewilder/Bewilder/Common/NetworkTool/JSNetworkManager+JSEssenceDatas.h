//
//  JSNetworkManager+JSEssenceDatas.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/20.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSNetworkManager.h"
@class JSTopicModel;
@class JSTopicInfo;

@interface JSNetworkManager (JSEssenceDatas)


#pragma mark
#pragma mark - 全部
/** 下拉刷新 */
- (void)pullDatasWithCompletionHandler:(void(^)(NSArray <JSTopicModel *> *response , JSTopicInfo *topicInfo,BOOL isCompletion))completionHandler;
/** 上拉加载更多 */
- (void)loadMoreDatasWithMaxTime:(NSString *)maxTime WithCompletionHandler:(void(^)(NSArray <JSTopicModel *> *response , JSTopicInfo *topicInfo,BOOL isCompletion))completionHandler;


#pragma mark 
#pragma mark - 


@end
