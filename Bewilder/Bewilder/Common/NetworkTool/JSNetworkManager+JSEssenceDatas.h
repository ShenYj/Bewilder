//
//  JSNetworkManager+JSEssenceDatas.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/20.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSNetworkManager.h"
#import "JSTopicModel.h"
//@class JSTopicModel;
@class JSTopicInfo;

@interface JSNetworkManager (JSEssenceDatas)


#pragma mark
#pragma mark - 全部
/** 下拉刷新(全部) */
- (void)pullDatasWithStyle:(TopicCellStyle)style CompletionHandler:(void(^)(NSArray <JSTopicModel *> *response ,JSTopicInfo *topicInfo,BOOL isCompletion))completionHandler;
/** 上拉加载更多(全部) */
- (void)loadMoreDatasWithMaxTime:(NSString *)maxTime Style:(TopicCellStyle)style WithCompletionHandler:(void (^)(NSArray<JSTopicModel *> *, JSTopicInfo *, BOOL))completionHandler;

- (void)loadMoreDatasWithMaxTime:(NSString *)maxTime WithCompletionHandler:(void(^)(NSArray <JSTopicModel *> *response , JSTopicInfo *topicInfo,BOOL isCompletion))completionHandler DEPRECATED_ATTRIBUTE;


#pragma mark 
#pragma mark - 


@end
