//
//  JSProgressHUD.h
//  JSProgressHUD
//
//  Created by ShenYj on 2017/5/26.
//  Copyright © 2017年 Auko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString * const kJSProgressHUDRequest = @"正在请求...";
static NSString * const kJSProgressHUDSuccess = @"请求完成...";
static NSString * const kJSProgressHUDNoMore = @"没有更多数据了...";
static NSString * const kJSProgressHUDFail = @"您的网络不给力!";

@interface JSProgressHUD : MBProgressHUD

/*!
 *  @metohd sharedProgressHUD:
 *
 *  @discussion      单例
 */
+ (instancetype)sharedProgressHUD;
/*!
 *  @metohd js_showHUDTo: animated:
 *
 *  @param view      将要添加到的视图
 *  @param animated  是否有动画效果
 *
 *  @discussion      显示遮罩视图
 */
- (void)js_showHUDTo:(UIView *)view animated:(BOOL)animated;

/*!
 *  @property noticeString
 *
 *  @discussion 文本提示内容
 */
@property (nonatomic,copy) NSString *noticeString;

@end
