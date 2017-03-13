//
//  JSSettingViewController.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/6.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSSettingViewController.h"
#import "JSSettingTableViewCell.h"
#import "JSClearTableViewCell.h"


static NSString * const kReuseIdentifier = @"kReuseIdentifier";
static NSString * const kClearIdentifier = @"kClearIdentifier";

@interface JSSettingViewController ()

@end

@implementation JSSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",NSHomeDirectory());
}

- (void)prepareTableView {
    [super prepareTableView];
    [self.tableView registerClass:[JSSettingTableViewCell class] forCellReuseIdentifier:kReuseIdentifier];
    [self.tableView registerClass:[JSClearTableViewCell class] forCellReuseIdentifier:kClearIdentifier];
    [self.tableView setContentOffset:CGPointMake(0, -64) animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark - table view dataScoure

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        JSClearTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kClearIdentifier forIndexPath:indexPath];
        return cell;
    }
    
    JSSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @(indexPath.row).description;
    return cell;
}

#pragma mark
#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 清理缓存Cell点击
    if (indexPath.section == 0 && indexPath.row == 0) {
        return;
    }
    
    
}

- (void)dealloc {
    JSLOG
}


@end
