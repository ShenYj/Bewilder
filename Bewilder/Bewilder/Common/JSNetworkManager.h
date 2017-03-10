//
//  JSNetworkManager.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/10.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

typedef NS_ENUM(NSUInteger, RequestMethod) {
    RequestMethodGet,
    RequestMethodPost
};

@interface JSNetworkManager : AFHTTPSessionManager

/** 单例 */
+ (instancetype)sharedManager;

/** 公共请求方法 */
- (void)requestMethod:(RequestMethod)requestMethod
            urlString:(NSString *)urlString
           parameters:(NSDictionary *)parameters
   compeletionHandler:(void(^)(id res,NSError *error))compeletionHandler;

@end
