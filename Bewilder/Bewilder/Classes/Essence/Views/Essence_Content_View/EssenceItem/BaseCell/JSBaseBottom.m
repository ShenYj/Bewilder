//
//  JSBaseBottom.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/21.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSBaseBottom.h"
#import "JSBaseConst.h"

@implementation JSBaseBottom

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareBaseBottomView];
    }
    return self;
}

- (void)prepareBaseBottomView {
    self.backgroundColor = [UIColor redColor];
}

@end
