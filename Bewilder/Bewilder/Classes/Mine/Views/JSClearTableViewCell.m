//
//  JSClearTableViewCell.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/13.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSClearTableViewCell.h"

@implementation JSClearTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [activityView startAnimating];
        self.accessoryView = activityView;
        self.textLabel.text = @"正在计算缓存大小...";
        self.userInteractionEnabled = NO;
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            NSString *yykitPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"com.ibireme.yykit/images/data"];
            NSString *webkitPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"com.ShenYj.Bewilder/WebKit/NetworkCache"];
            unsigned long long fileSizeULL = yykitPath.fileSize + webkitPath.fileSize;
            NSString *fileSize = [NSString stringWithFormat:@"%llu M",fileSizeULL / (1000 * 1000)];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.textLabel.text = fileSize;
                self.accessoryView = nil;
                self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                self.userInteractionEnabled = YES;
                
                // 在计算完大小后 添加一个轻触手势
                [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clearDisk)]];
                
            });
        });
    }
    return self;
}

- (void)clearDisk {
    
    if ([self.textLabel.text isEqualToString:@"清除缓存(0B)"]) {
        [MBProgressHUD showHUDAddedTo:self.superview animated:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"无缓存文件");
            [MBProgressHUD hideHUDForView:self.superview animated:YES];
        });
        return;
    }
    
    [MBProgressHUD showHUDAddedTo:self.superview animated:YES];
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
        [MBProgressHUD hideHUDForView:self.superview animated:YES];
        self.textLabel.text = @"清除缓存(0B)";
        NSLog(@"操作完成");
    });

}

@end
