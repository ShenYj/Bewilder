//
//  JSNetworkManager.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/10.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSNetworkManager.h"


static JSNetworkManager *_instanceType = nil;

@implementation JSNetworkManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instanceType = [[JSNetworkManager alloc] init];
    });
    return _instanceType;
}

- (void)requestMethod:(RequestMethod)requestMethod
            urlString:(NSString *)urlString
           parameters:(NSDictionary *)parameters
   compeletionHandler:(void(^)(id res,NSError *error))compeletionHandler {
    
    if (requestMethod == RequestMethodGet) {
        
        [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            compeletionHandler(responseObject,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            compeletionHandler(nil,error);
        }];
        
    } else {
        
        [self POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            compeletionHandler(responseObject,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (error.code == NSURLErrorCancelled) {
                NSLog(@"取消下载");
            } else if (error.code == NSURLErrorTimedOut) {
                NSLog(@"请求超时");
            }
            compeletionHandler(nil,error);
        }];
    }
}

@end
