//
//  JSMineLastTableViewCell.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/10.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JSMineModel;
@class JSMeButton;
@protocol JSMineLastCellButonClickDelegate;

@interface JSMineLastTableViewCell : UITableViewCell

@property (nonatomic,strong) JSMineModel *mineModel;
@property (nonatomic,weak) id <JSMineLastCellButonClickDelegate> lastCellDelegate;

@end


@protocol JSMineLastCellButonClickDelegate <NSObject>

- (void)lastCell:(JSMineLastTableViewCell *)lastCell clickedButton:(JSMeButton *)clickedButton;

@end


