//
//  JSNetworkManager+JSMineDatas.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/11.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSNetworkManager.h"
@class JSMineModel;

/** 
 * 我的界面请求接口
 */
@interface JSNetworkManager (JSMineDatas)

/** completionHandler参数说明
  * response        转换后的模型数据
  * isCompletion    模型数据转换完成
 */
- (void)loadDatasWithCompletionHandler:(void(^)(JSMineModel *response ,BOOL isCompletion))completionHandler;

@end
