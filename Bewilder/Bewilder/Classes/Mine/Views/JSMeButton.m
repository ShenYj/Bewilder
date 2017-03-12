//
//  JSMeButton.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/11.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSMeButton.h"

extern NSInteger const kColButtonCount;     // 每行按钮个数
CGFloat const kButtonImageSize = 44.f;           // 按钮图片尺寸

@interface JSMeButton ()
@property (nonatomic,assign) CGFloat buttonWidth;
@end

@implementation JSMeButton

- (instancetype)init {
    self = [super init];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = [UIColor whiteColor];
//        self.layer.borderColor = [UIColor blackColor].CGColor;
//        self.layer.borderWidth = 1;
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect imageVFrame = self.imageView.frame;
    CGRect labelFrame = self.titleLabel.frame;

    imageVFrame.size = CGSizeMake(kButtonImageSize, kButtonImageSize);
    CGFloat margin = (self.bounds.size.height - imageVFrame.size.height - labelFrame.size.height) / 3;
    imageVFrame.origin.x = (self.bounds.size.width - imageVFrame.size.width) * 0.5;
    imageVFrame.origin.y = margin;
    
    labelFrame.origin.x = 0;
    labelFrame.origin.y = margin +imageVFrame.size.height + margin;
    labelFrame.size.width = self.bounds.size.width;
    
    self.imageView.frame = imageVFrame;
    self.titleLabel.frame = labelFrame;

}

@end
