//
//  JSEssenceTableView.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/20.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSTopicModel.h"

@interface JSEssenceTableView : UITableView
/** 数据 */
@property (nonatomic,strong) NSArray <JSTopicModel *>*topicLists;

@end
