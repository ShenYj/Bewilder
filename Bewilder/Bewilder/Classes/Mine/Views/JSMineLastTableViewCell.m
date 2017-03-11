//
//  JSMineLastTableViewCell.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/10.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSMineLastTableViewCell.h"
#import "JSNetworkManager+JSMineDatas.h"
#import "JSMineModel.h"
#import "JSSquareListModel.h"
#import "JSMeButton.h"

extern NSInteger const kColButtonCount;     // 每行按钮个数
extern CGFloat const kButtonMargin ;       // 按钮间的间距


@interface JSMineLastTableViewCell ()

@property (nonatomic,strong) NSMutableArray <JSMeButton *>*buttonsArr;
@end

@implementation JSMineLastTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        __weak typeof(self) weakSelf = self;
//        [[JSNetworkManager sharedManager] loadDatasWithCompletionHandler:^(JSMineModel *response , BOOL isCompletion) {
//            if (isCompletion && response) {
//                weakSelf.mineModel = response;
//                [weakSelf creatButtonsWithDatas:response];
//            } else {
//                NSLog(@"模型数据异常,FIXME");
//                abort();
//            }
//            isCompletion = isCompletion;
//            
//        }];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 按钮高度 = 按钮宽度
    CGFloat buttonWidth = (SCREEN_WIDTH - (kColButtonCount - 1) * kButtonMargin ) / kColButtonCount;        // 计算每个按钮的宽度
    CGFloat buttonHeight = buttonWidth;
    [self.buttonsArr enumerateObjectsUsingBlock:^(JSMeButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat row = idx / kColButtonCount;
        CGFloat col = idx % kColButtonCount;
        CGFloat coordinateX = col * kButtonMargin + col * buttonWidth;
        CGFloat coordinateY = row * kButtonMargin + row * buttonHeight;
        obj.frame = CGRectMake(coordinateX, coordinateY, buttonWidth, buttonHeight);
    }];
}

- (void)setMineModel:(JSMineModel *)mineModel {
    _mineModel = mineModel;
    [self creatButtonsWithDatas:mineModel];
}

- (void)creatButtonsWithDatas:(JSMineModel *)model {
    NSArray <JSSquareListModel *> *squareList = model.square_list;
    
    [squareList enumerateObjectsUsingBlock:^(JSSquareListModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        JSMeButton *button = [[JSMeButton alloc] init];
        [button setTitle:obj.name forState:UIControlStateNormal];
        [self.contentView addSubview:button];
        [self.buttonsArr addObject:button];
    }];
    [self layoutSubviews];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark
#pragma mark - lazy

- (NSMutableArray <JSMeButton *>*)buttonsArr {
    if (!_buttonsArr) {
        _buttonsArr = [NSMutableArray array];
    }
    return _buttonsArr;
}



@end
