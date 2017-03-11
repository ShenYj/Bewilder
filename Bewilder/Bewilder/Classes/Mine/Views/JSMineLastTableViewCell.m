//
//  JSMineLastTableViewCell.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/10.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSMineLastTableViewCell.h"

@implementation JSMineLastTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self prepareView];
    }
    return self;
}

- (void)prepareView {
    
}

- (void)setMineVCDatas:(JSMineModel *)mineVCDatas {
    _mineVCDatas = mineVCDatas;
    NSLog(@"%@",mineVCDatas);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
