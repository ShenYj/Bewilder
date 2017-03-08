//
//  JSTopLoginView.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/7.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JSTopLoginViewCloseControllerDelegate;
@interface JSTopLoginView : UIView
@property (nonatomic,weak) id <JSTopLoginViewCloseControllerDelegate> delegate;
@end

/**  dismiss 登录/注册 控制器
 *
 *  @parameter topLoginView 视图自身
 */
@protocol JSTopLoginViewCloseControllerDelegate <NSObject>
- (void)closeLoginRegisterViewControllerWithTopLoginView:(JSTopLoginView *)topLoginView;
- (void)registAccountWithTopLoginView:(JSTopLoginView *)topLoginView;

@end
