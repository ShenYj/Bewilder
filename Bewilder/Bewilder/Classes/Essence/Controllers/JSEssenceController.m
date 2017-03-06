//
//  JSEssenceController.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/6.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSEssenceController.h"
static NSString * const reusedIdentifier = @"EssenceReusedIdentifier";

@interface JSEssenceController ()

@end

@implementation JSEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)prepareTableView {
    [super prepareTableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reusedIdentifier];
}

- (void)setUpUI {
    [super setUpUI];
    [self prepareNavigationBar];
}

- (void)prepareNavigationBar {
    
    self.js_navigationItem.leftBarButtonItem = [[JSBaseNavBarButtonItem alloc] initWithNormalImgName:@"MainTagSubIcon" withHighlightedImgName:@"MainTagSubIconClick" withTarget:self withAction:@selector(clickLeftNavigationBarItem:)];
    
}

- (void)clickLeftNavigationBarItem:(JSBaseNavBarButtonItem *)sender {
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
