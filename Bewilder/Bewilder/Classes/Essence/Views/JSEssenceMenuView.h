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

@interface JSEssenceMenuView : UIView
@property (nonatomic,strong) NSMutableArray <JSMenuLabel *>*menuLabels;
@property (nonatomic,weak) id <JSEssenceMenuViewIndexDelegate> delegate;
- (void)selectedIdex:(NSInteger)index;

@end


@protocol JSEssenceMenuViewIndexDelegate <NSObject>

- (void)essenceMenuiew:(JSEssenceMenuView *)menuView index:(NSInteger)index;

@end
