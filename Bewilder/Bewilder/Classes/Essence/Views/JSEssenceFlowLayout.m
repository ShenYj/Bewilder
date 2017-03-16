//
//  JSEssenceFlowLayout.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/16.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSEssenceFlowLayout.h"

@implementation JSEssenceFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
}

@end
