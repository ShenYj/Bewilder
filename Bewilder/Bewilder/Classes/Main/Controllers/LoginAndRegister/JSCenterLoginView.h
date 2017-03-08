//
//  JSCenterLoginView.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/8.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 中心视图的样式 */
typedef NS_ENUM(NSUInteger, JSCenterLoginViewMode) {
    JSCenterLoginViewModeRegister,
    JSCenterLoginViewModeLoginIn
};

@protocol JSCenterLoginViewDelegate;
@interface JSCenterLoginView : UIView

/** 自定义构造函数 */
- (instancetype)initWithCenterViewMode:(JSCenterLoginViewMode)mode;
/** 代理对象 */
@property (nonatomic,weak) id <JSCenterLoginViewDelegate> delegate;

@end


/** 登录/注册按钮点击事件协议 */
@protocol JSCenterLoginViewDelegate <NSObject>

- (void)centerLoginView:(JSCenterLoginView *)centerLoginView viewMode:(JSCenterLoginViewMode)mode;

@end
