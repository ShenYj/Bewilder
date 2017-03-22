//
//  JSToolBarButton.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/21.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSToolBarButton.h"

@implementation JSToolBarButton

- (instancetype)init {
    self = [super init];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
}

@end
