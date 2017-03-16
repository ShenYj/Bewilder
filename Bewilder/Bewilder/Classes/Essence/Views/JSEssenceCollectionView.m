//
//  JSEssenceCollectionView.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/16.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSEssenceCollectionView.h"
#import "JSEssenceFlowLayout.h"


@implementation JSEssenceCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:[[JSEssenceFlowLayout alloc] init]];
    if (self) {
        [self prepareCollectionView];
    }
    return self;
}

- (void)prepareCollectionView {
    self.backgroundColor = [UIColor whiteColor];
}

@end
