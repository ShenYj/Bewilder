//
//  JSMenuLabel.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/16.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSMenuLabel.h"

@implementation JSMenuLabel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.font = [UIFont systemFontOfSize:14];
        self.textColor = [UIColor blackColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.userInteractionEnabled = YES;
    }
    return self;
}

-(void)setScale:(CGFloat)scale {
    _scale = scale;
    CGFloat red = scale;
    CGFloat green = 0.f;
    CGFloat blue = 0.f;
    self.textColor = [UIColor colorWithDisplayP3Red:red green:green blue:blue alpha:1.0];
    self.transform = CGAffineTransformMakeScale( 1 + scale * 0.3, 1 + scale * 0.3 );
    
}

@end
