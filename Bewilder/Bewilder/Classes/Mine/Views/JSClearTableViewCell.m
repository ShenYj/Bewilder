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
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            NSString *yykitPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"com.ibireme.yykit/images/data"];
            NSString *webkitPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"com.ShenYj.Bewilder/WebKit/NetworkCache"];
            unsigned long long fileSizeULL = yykitPath.fileSize + webkitPath.fileSize;
            NSString *fileSize = [NSString stringWithFormat:@"%llu M",fileSizeULL / (1000 * 1000)];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.textLabel.text = fileSize;
                self.accessoryView = nil;
                self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            });
        });
    }
    return self;
}

@end
