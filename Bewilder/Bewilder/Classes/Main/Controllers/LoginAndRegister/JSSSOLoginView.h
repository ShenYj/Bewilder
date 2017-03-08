//
//  JSSSOLoginView.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/7.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SSOButtonType) {
    SSOButtonTypeSinaWB         = 1001,         // 新浪微博登录
    SSOButtonTypeQQ             = 1002,         // QQ账号登录
    SSOButtonTypeTencentWB      = 1003          // 腾讯微博登录
};

@protocol JSSSOLoginViewDelegate;
@interface JSSSOLoginView : UIView

@property (nonatomic,weak) id <JSSSOLoginViewDelegate> delegate;

@end

@protocol JSSSOLoginViewDelegate <NSObject>

- (void)ssoLoginView:(JSSSOLoginView *)ssoLoginView buttonType:(SSOButtonType)type;

@end
