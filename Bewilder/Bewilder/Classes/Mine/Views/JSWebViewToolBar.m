//
//  JSWebViewToolBar.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/12.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSWebViewToolBar.h"


@interface JSWebViewToolBarItem : UIBarButtonItem
@property (nonatomic,assign) JSWebViewToolBarItemMode tooBarItemMode;
@end
@implementation JSWebViewToolBarItem
@end


static CGFloat const kBottomToolBarHeight = 49.f;

@interface JSWebViewToolBar ()
@property (nonatomic,strong) JSWebViewToolBarItem *backItem;
@property (nonatomic,strong) JSWebViewToolBarItem *forwardItem;
@property (nonatomic,strong) JSWebViewToolBarItem *refreshItem;
@end

@implementation JSWebViewToolBar

- (instancetype)init {
    self = [super init];
    if (self) {
        [self prepareToolBar];
    }
    return self;
}

- (void)prepareToolBar {
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    self.items = @[self.backItem,self.forwardItem,flexibleSpace,self.refreshItem];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(kBottomToolBarHeight);
    }];
}

- (void)setCanGoBack:(BOOL)canGoBack {
    _canGoBack = canGoBack;
    self.backItem.enabled = canGoBack;
}

- (void)setCanGoForward:(BOOL)canGoForward {
    _canGoForward = canGoForward;
    self.forwardItem.enabled = canGoForward;
}

#pragma mark
#pragma mark - target

- (void)clickToolBarItem:(JSWebViewToolBarItem *)buttonItem {
    
    if ([self.toolbarDelegate respondsToSelector:@selector(webViewToolBar:withClickedItemMode:)]) {
        [self.toolbarDelegate webViewToolBar:self withClickedItemMode:buttonItem.tooBarItemMode];
    }
    
}


#pragma mark
#pragma mark - lazy

- (JSWebViewToolBarItem *)backItem {
    if (!_backItem) {
        _backItem = [[JSWebViewToolBarItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(clickToolBarItem:)];
        _backItem.enabled = NO;
    }
    return _backItem;
}

- (JSWebViewToolBarItem *)forwardItem {
    if (!_forwardItem) {
        _forwardItem = [[JSWebViewToolBarItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(clickToolBarItem:)];
        _forwardItem.enabled = NO;
    }
    return _forwardItem;
}

- (JSWebViewToolBarItem *)refreshItem {
    if (!_refreshItem) {
        _refreshItem = [[JSWebViewToolBarItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(clickToolBarItem:)];
    }
    return _refreshItem;
}



@end



