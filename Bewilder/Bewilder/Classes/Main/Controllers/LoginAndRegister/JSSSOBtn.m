//
//  JSSSOBtn.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/7.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSSSOBtn.h"

static CGFloat const kMargin = 5.f;

@implementation JSSSOBtn

+ (instancetype)buttonWithType:(UIButtonType)buttonType {
    JSSSOBtn *btn = [super buttonWithType: buttonType];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    return btn;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect imageVFrame = self.imageView.frame;
    CGRect labelFrame = self.titleLabel.frame;
    
    imageVFrame.origin.x = kMargin;
    imageVFrame.origin.y = 0;
    
    labelFrame.origin.x = 0;
    labelFrame.origin.y = imageVFrame.size.height + kMargin;
    labelFrame.size.width = self.bounds.size.width;
    
    self.imageView.frame = imageVFrame;
    self.titleLabel.frame = labelFrame;
    
    self.bounds = CGRectMake(0, 0, imageVFrame.size.width + 2*kMargin, imageVFrame.size.height + labelFrame.size.height + kMargin);
}


@end
