//
//  JSEssenceMenuView.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/16.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JSMenuLabel;
@protocol JSEssenceMenuViewIndexDelegate;
@protocol JSEssenceMenuViewDataSource;

@interface JSEssenceMenuView : UIView
@property (nonatomic,strong) NSMutableArray <JSMenuLabel *>*menuLabels;
@property (nonatomic,weak) id <JSEssenceMenuViewIndexDelegate> delegate;
@property (nonatomic,weak) id <JSEssenceMenuViewDataSource> dataSource;
- (void)selectedIdex:(NSInteger)index;

@end

/** 设置content区域的CollectionView联动,传递索引 */
@protocol JSEssenceMenuViewIndexDelegate <NSObject>
- (void)essenceMenuView:(JSEssenceMenuView *)menuView index:(NSInteger)index;
@end

/** 请求加载数据 */
@protocol JSEssenceMenuViewDataSource <NSObject>
- (void)loadDatasEssenceMenuView:(JSEssenceMenuView *)menuView index:(NSInteger)index;
@end
