//
//  JSBaseBottom.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/21.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSBaseBottom.h"
#import "JSBaseConst.h"

@interface JSBaseBottom ()
/** 按钮 */
@property (nonatomic,strong) UIButton *button1;
/** 按钮 */
@property (nonatomic,strong) UIButton *button2;
/** 按钮 */
@property (nonatomic,strong) UIButton *button3;
/** 按钮 */
@property (nonatomic,strong) UIButton *button4;

@end

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
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(kBottomToolBarHeigth);
    }];
}

@end
