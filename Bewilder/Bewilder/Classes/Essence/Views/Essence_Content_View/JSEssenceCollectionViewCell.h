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
/** 数据 */
@property (nonatomic,strong) NSArray <JSTopicModel *>*topicLists;

@end
