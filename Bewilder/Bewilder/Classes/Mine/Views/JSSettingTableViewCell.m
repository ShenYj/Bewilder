//
//  JSSettingTableViewCell.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/13.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSSettingTableViewCell.h"

@implementation JSSettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}


@end
