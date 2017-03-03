//
//  JSTabBar.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/3.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSTabBar.h"

static unsigned int const kTabBarItemCounts = 5;            // 自定义TabBar中Item个数
#define kItemWidth (SCREEN_WIDTH / kTabBarItemCounts)       // 自定义TabBar中Item宽度

@interface JSTabBar ()

@property (nonatomic,strong) UIButton *composeButton;

@end

@implementation JSTabBar

- (instancetype)init {
    if (self = [super init]) {
        [self prepareTabBarView];
    }
    return self;
}

- (void)prepareTabBarView {
    [self addSubview:self.composeButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger index = 0;
    
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            subView.frame = CGRectMake(index * kItemWidth, 0, kItemWidth, self.bounds.size.height);
            index ++;
            if (index == 2) {
                index ++;
            }
        }
        if ([subView isKindOfClass:[UIButton class]]) {
            CGFloat offset = (kItemWidth - subView.bounds.size.width) * 0.5;
            subView.frame = CGRectMake( 2 * kItemWidth + offset, 0, subView.bounds.size.width, subView.bounds.size.height);
        }
    }
    
}

#pragma mark
#pragma mark - compose button click target

- (void)clickComposeButton:(UIButton *)button {
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBar:withComposeButton:)]) {
        [self.tabBarDelegate tabBar:self withComposeButton:button];
    }
}

#pragma mark
#pragma mark - lazy

- (UIButton *)composeButton {
    if (!_composeButton) {
        _composeButton = [[UIButton alloc] init];
        [_composeButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [_composeButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [_composeButton sizeToFit];
        [_composeButton addTarget:self action:@selector(clickComposeButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _composeButton;
}

@end
