//
//  JSNetworkManager+JSEssenceDatas.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/20.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSNetworkManager.h"
@class JSTopicModel;

@interface JSNetworkManager (JSEssenceDatas)

- (void)loadEssenceDatasWithCompletionHandler:(void(^)(NSArray <JSTopicModel *> *response ,BOOL isCompletion))completionHandler;

@end
