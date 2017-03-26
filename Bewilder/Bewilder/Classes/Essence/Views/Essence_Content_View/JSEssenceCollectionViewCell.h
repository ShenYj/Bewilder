//
//  JSEssenceCollectionViewCell.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/16.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSTopicModel.h"

@interface JSEssenceCollectionViewCell : UICollectionViewCell

/** 下拉刷新 */
- (void)loadNewDatas;

/** Cell类型: 1-全部;10-图片;29-段子;31-音频;41-视频;默认为1  */
@property (nonatomic,assign) TopicCellStyle type;

@end
