//
//  JSEssenceTableView.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/20.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSEssenceTableView.h"

@implementation JSEssenceTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.backgroundColor = JS_Gray_Color(236);
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}
@end
