//
//  JSMineViewController.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/6.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSMineViewController.h"

static NSString * const reusedIdentifier = @"mineReusedIdentifier";

@interface JSMineViewController ()

@end

@implementation JSMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setUpUI {
    [super setUpUI];
    [self prepareNavigationBar];
}

- (void)prepareNavigationBar {
    self.js_navigationItem.title = @"我的";
    JSBaseNavBarButtonItem *leftBarButtonItem = [[JSBaseNavBarButtonItem alloc] initWithNormalImgName:@"mine-moon-icon" withHighlightedImgName:@"mine-moon-icon-click" withTarget:self withAction:@selector(clickLeftNavigationBarItem:)];
    JSBaseNavBarButtonItem *rightBarButtonItem = [[JSBaseNavBarButtonItem alloc] initWithNormalImgName:@"mine-setting-icon" withHighlightedImgName:@"mine-setting-icon-click" withTarget:self withAction:@selector(clickRightNavigationBarItem:)];
    self.js_navigationItem.rightBarButtonItems = @[rightBarButtonItem,leftBarButtonItem];
}

- (void)prepareTableView {
    [super prepareTableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reusedIdentifier];
}

#pragma mark 
#pragma mark - target
- (void)clickLeftNavigationBarItem:(JSBaseNavBarButtonItem *)sender {
    NSLog(@"%s",__func__);
}
- (void)clickRightNavigationBarItem:(JSBaseNavBarButtonItem *)sender {
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
