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
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        NSString *yykitPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"com.ibireme.yykit/images/data"];
        NSString *webkitPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"com.ShenYj.Bewilder/WebKit/NetworkCache"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        dispatch_group_t group = dispatch_group_create();
        dispatch_group_enter(group);
        // 删除文件 & 重新生成目录
        dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
            // 1.删除文件
            sleep(3);
            NSError *error = nil;
            [fileManager removeItemAtPath:yykitPath error:&error];
            [fileManager removeItemAtPath:webkitPath error:&error];
            if (error) {
                NSLog(@"清理失败:%@",error);
            }
            NSLog(@"清理完成");
            
            error = nil;
            // 2.将文件夹重新创建出来
            [fileManager createDirectoryAtPath:yykitPath withIntermediateDirectories:YES attributes:nil error:&error];
            [fileManager createDirectoryAtPath:webkitPath withIntermediateDirectories:YES attributes:nil error:&error];
            if (error) {
                NSLog(@"创建目录失败!%@",error);
            }
            NSLog(@"重新创建目录");
            dispatch_group_leave(group);
        });
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            // 操作完成刷新表格
            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"操作完成");
        });
    }
    
    
}

- (void)dealloc {
    JSLOG
}


@end
