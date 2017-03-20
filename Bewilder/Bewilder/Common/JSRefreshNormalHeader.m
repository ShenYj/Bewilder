//
//  JSNormalHeader.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/20.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSRefreshNormalHeader.h"

@implementation JSRefreshNormalHeader

- (void)prepare {
    [super prepare];
    //根据拖拽比例自动切换透明度
    self.automaticallyChangeAlpha = YES;
    // 隐藏最后更新时间
    self.lastUpdatedTimeLabel.hidden = YES;
    self.stateLabel.textColor = [UIColor purpleColor];
    
}

@end
