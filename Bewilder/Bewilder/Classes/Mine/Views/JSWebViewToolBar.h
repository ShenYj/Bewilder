//
//  JSWebViewToolBar.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/12.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSWebViewToolBarItem;


typedef NS_ENUM(NSUInteger, JSWebViewToolBarItemMode) {
    JSWebViewToolBarItemModeBack,
    JSWebViewToolBarItemModeForward,
    JSWebViewToolBarItemModeRefresh
};


@protocol JSWebViewToolBarItemDelegate;
@interface JSWebViewToolBar : UIToolbar
@property (nonatomic,weak) id <JSWebViewToolBarItemDelegate> toolbarDelegate;
@property (nonatomic,assign) BOOL canGoBack;
@property (nonatomic,assign) BOOL canGoForward;
@end


@protocol JSWebViewToolBarItemDelegate <NSObject>

- (void)webViewToolBar:(JSWebViewToolBar *)webViewToolbar withClickedItemMode:(JSWebViewToolBarItemMode)mode;

@end
