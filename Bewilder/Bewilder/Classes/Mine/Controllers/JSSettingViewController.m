//
//  JSSettingViewController.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/6.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSSettingViewController.h"

static NSString * const kReuseIdentifier = @"kREuseIdentifier";

@interface JSSettingViewController ()

@end

@implementation JSSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)prepareTableView {
    [super prepareTableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kReuseIdentifier];
    [self.tableView setContentOffset:CGPointMake(0, -64) animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)getLocalFileSize {
    unsigned long long fileSize = 0;
    // 拼接沙盒路径 library/caches/com.ibireme.yykit/images
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"com.ibireme.yykit/images"];
    // 文件管理者
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 取出该路径下(library/caches/com.ibireme.yykit/images)的所有子文件/子文件夹路径集合
    NSArray <NSString *>*subPaths = [fileManager subpathsAtPath:cachePath];
    // 遍历子路径,累加文件大小
    for (NSString *subPath in subPaths) {
        // 拼接全路径
        NSString *fullPath = [cachePath stringByAppendingPathComponent:subPath];
        NSError *error = nil;
        NSDictionary *attrs = [fileManager attributesOfItemAtPath:fullPath error:&error];
        if (error) {
            NSLog(@"%@",error);
        }
        fileSize += attrs.fileSize;
        
    }
    return [NSString stringWithFormat:@"%llu M",fileSize / (1000 * 1000)];
}

#pragma mark
#pragma mark - table view dataScoure

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [activityView startAnimating];
        cell.accessoryView = activityView;
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            NSString *fileSize = [self getLocalFileSize];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                cell.textLabel.text = fileSize;
                cell.accessoryView = nil;
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            });
        });
        
        return cell;
    }
    cell.textLabel.text = @(indexPath.row).description;
    return cell;
}

#pragma mark
#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        
        NSLog(@"%@",NSHomeDirectory());
    }
    
}

- (void)dealloc {
    NSLog(@"%s",__func__);
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
