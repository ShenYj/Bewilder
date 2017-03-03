//
//  JSTabBar.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/3.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol  JSTabBarDelegate;
@interface JSTabBar : UITabBar
@property (nonatomic,weak) id <JSTabBarDelegate> tabBarDelegate;
@end


@protocol JSTabBarDelegate <NSObject>

@required
- (void)tabBar: (JSTabBar *)tabBar withComposeButton:(UIButton *)composeButton;

@end
