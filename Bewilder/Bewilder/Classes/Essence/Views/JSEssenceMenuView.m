//
//  JSEssenceMenuView.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/16.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSEssenceMenuView.h"

@interface JSEssenceMenuView ()

@property (nonatomic,strong) NSMutableArray *titleBtns;

@end

@implementation JSEssenceMenuView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self prepareMenuView];
    }
    return self;
}

- (void)prepareMenuView {
    self.backgroundColor = [UIColor yellowColor];
    
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(44);
    }];
}

@end
