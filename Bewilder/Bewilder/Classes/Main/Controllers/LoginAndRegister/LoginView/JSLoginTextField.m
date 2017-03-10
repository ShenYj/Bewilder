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

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!self.isEditing) {
        [self setValue:[UIColor lightGrayColor] forKeyPath:@"placeholderLabel.textColor"];
    }
//
//    if (self.isEditing) {
//        [self setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
//    } else {
//        // KVC 修改 占位文字颜色
//        [self setValue:[UIColor lightGrayColor] forKeyPath:@"placeholderLabel.textColor"];
//    }
}

- (BOOL)becomeFirstResponder {
    [self setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponderresignFirstResponder {
    [self setValue:[UIColor lightGrayColor] forKeyPath:@"placeholderLabel.textColor"];
    return [super resignFirstResponder];
}

@end
