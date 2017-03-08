//
//  JSLoginTextField.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/8.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSLoginTextField.h"

static CGFloat const kMargin = 10.f;  // 间距

@implementation JSLoginTextField

- (instancetype)init {
    self = [super init];
    if (self) {
        self.textColor = [UIColor whiteColor];
        self.borderStyle = UITextBorderStyleNone;
        self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2*kMargin, 0)];
        self.leftViewMode = UITextFieldViewModeAlways;
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.tintColor = [UIColor whiteColor];
    }
    return self;
}



@end
