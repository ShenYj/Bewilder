//
//  JSTopicBaseCell.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/21.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JSTopicModel;

@interface JSTopicBaseCell : UITableViewCell

/** 设置baseCell视图 */
- (void)prepareBaseCellView NS_REQUIRES_SUPER;

/** 模型数据 */
@property (nonatomic,strong) JSTopicModel *topicModel;


@end
