//
//  AppDelegate.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/2.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "AppDelegate.h"
#import "JSMainController.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 网络指示器(AFN的网络指示器)
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    // 友盟初始化
    [UMConfigure initWithAppkey:@"5b695fbf8f4a9d75bd000060" channel:@"App Store"];
    [UMConfigure setLogEnabled:YES];
    
    [MobClick setScenarioType:E_UM_NORMAL];
    [MobClick setCrashReportEnabled:YES];
    
    // 监听网络
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 初始化Window
    self.window = [[UIWindow alloc] initWithFrame:SCREEN_BOUNDS];
    // 设置根控制器
    [self setupRootVC];
    [self.window makeKeyAndVisible];
    
    return YES;
}

/** 设置根控制器 */
- (void)setupRootVC {
    
    JSMainController *rootVC = [[JSMainController alloc] init];
    self.window.rootViewController = rootVC;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
