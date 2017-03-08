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



@protocol JSTopLoginViewCloseControllerDelegate <NSObject>
/** 关闭登录视图 */
- (void)closeLoginRegisterViewControllerWithTopLoginView:(JSTopLoginView *)topLoginView;
/** 注册帐号 */
- (void)registAccountWithTopLoginView:(JSTopLoginView *)topLoginView;

@end
