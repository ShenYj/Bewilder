//
//  JSNetworkManager+JSMineDatas.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/11.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSNetworkManager.h"
@class JSMineModel;

@interface JSNetworkManager (JSMineDatas)

- (void)loadDatasWithCompeletionHandler:(void(^)(JSMineModel *response, BOOL isOK))compeletionHandler;

@end
