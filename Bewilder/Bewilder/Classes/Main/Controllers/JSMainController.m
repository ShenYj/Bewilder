//
//  JSMainController.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/2.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSMainController.h"

@interface JSMainController ()

@end

@implementation JSMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    // 设置子控制器
    [self addChildController:[[UIViewController alloc] init] withTitle:@"精华" withImageName:@"essence"];
    [self addChildController:[[UIViewController alloc] init] withTitle:@"新帖" withImageName:@"new"];
    [self addChildController:[[UIViewController alloc] init] withTitle:@"关注" withImageName:@"friendTrends"];
    [self addChildController:[[UIViewController alloc] init] withTitle:@"我" withImageName:@"me"];
}

- (void)addChildController:(UIViewController *)viewController withTitle:(NSString *)title withImageName:(NSString *)imageName {
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    NSString *imageNormalName = [NSString stringWithFormat:@"tabBar_%@_icon",imageName];
    NSString *imageSelectName = [NSString stringWithFormat:@"tabBar_%@_click_icon",imageName];
    navigationController.tabBarItem.image = [[UIImage imageNamed:imageNormalName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigationController.tabBarItem.selectedImage = [[UIImage imageNamed:imageSelectName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [navigationController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor]} forState:UIControlStateNormal];
    [navigationController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateSelected];
    navigationController.tabBarItem.title = title;
    viewController.title = title;
    [self addChildViewController:navigationController];
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
