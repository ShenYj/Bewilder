//
//  JSMainController.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/2.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSMainController.h"
#import "JSEssenceController.h"
#import "JSNewPostsController.h"
#import "JSFollowViewController.h"
#import "JSMineViewController.h"
#import "JSBaseNavigationController.h"
#import "JSTabBar.h"

@interface JSMainController () <JSTabBarDelegate>

@end

@implementation JSMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    // 设置背景色
    self.view.backgroundColor = [UIColor whiteColor];
    // 设置tabBarItem字体颜色
    //UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateSelected];
    // 设置自定义TabBar
    JSTabBar *tabBar = [[JSTabBar alloc] init];
    tabBar.tabBarDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
    // 设置子控制器
    [self addChildController:[[JSEssenceController alloc] init] withTitle:@"精华" withImageName:@"essence"];
    [self addChildController:[[JSNewPostsController alloc] init] withTitle:@"新帖" withImageName:@"new"];
    [self addChildController:[[JSFollowViewController alloc] init] withTitle:@"关注" withImageName:@"friendTrends"];
    [self addChildController:[[JSMineViewController alloc] init] withTitle:@"我" withImageName:@"me"];
    
}

- (void)addChildController:(JSBaseViewController *)viewController withTitle:(NSString *)title withImageName:(NSString *)imageName {
    NSString *imageNormalName = [NSString stringWithFormat:@"tabBar_%@_icon",imageName];
    NSString *imageSelectName = [NSString stringWithFormat:@"tabBar_%@_click_icon",imageName];
    viewController.tabBarItem.image = [[UIImage imageNamed:imageNormalName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:imageSelectName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.title = title;
    viewController.title = title;
    JSBaseNavigationController *navigationController = [[JSBaseNavigationController alloc] initWithRootViewController:viewController];
    navigationController.bottomBarHiddenWhenPushed = YES;
    [self addChildViewController:navigationController];
}

#pragma mark
#pragma mark - JSTabBarDelegate

- (void)tabBar:(JSTabBar *)tabBar withComposeButton:(UIButton *)composeButton {
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
