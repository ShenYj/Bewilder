//
//  JSEssenceMenuView.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/16.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSEssenceMenuView.h"
#import "JSMenuLabel.h"

static CGFloat const kMenuViewHeight = 44.f;          // 菜单视图自身的高度
static NSInteger const kFLagValue = 1100;             // tag值的中间变量

@interface JSEssenceMenuView ()

/** 存放收拾的数组 */
@property (nonatomic,strong) NSMutableArray *gesturesArr;
/** 中间变脸,记录当前label */
@property (nonatomic,weak) JSMenuLabel *selectedLabel;
/** 指示条 */
@property (nonatomic,strong) UIView *indicatorView;
/** 记录指示条约束 */
@property (nonatomic,strong) MASConstraint *centerX;
@property (nonatomic,strong) MASConstraint *width;

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
    self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    
    NSArray *titles = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    CGFloat labelWidth = SCREEN_WIDTH / titles.count;
    [titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL * _Nonnull stop) {
        JSMenuLabel *label = [[JSMenuLabel alloc] init];
        label.text = title;
        label.tag = kFLagValue + idx;
        [self addSubview:label];
        [self.menuLabels addObject:label];
        CGFloat cooridinateX = idx * labelWidth;
        label.frame = CGRectMake(cooridinateX, 0, labelWidth, kMenuViewHeight);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        [label addGestureRecognizer:tap];
        [self.gesturesArr addObject:tap];
    }];

    [self addSubview:self.indicatorView];
    [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self);
        make.height.mas_equalTo(1);
    }];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(kMenuViewHeight);
    }];
    
    // 首次默认选中
    [self tapGesture:self.gesturesArr.firstObject];
}


- (void)selectedIdex:(NSInteger)index {
    
    [self tapGesture:self.gesturesArr[index]];
}

- (void)tapGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    JSMenuLabel *label = (JSMenuLabel *)tapGestureRecognizer.view;
    
    if (label == self.selectedLabel) {
        return;
    }
    
    // 设置指示条
    [self.centerX uninstall];
    [self.width uninstall];
    CGRect bounds = [label.text boundingRectWithSize:CGSizeMake(label.bounds.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]} context:nil];
    [self.indicatorView mas_updateConstraints:^(MASConstraintMaker *make) {
        self.centerX = make.centerX.mas_equalTo(label);
        self.width = make.width.mas_equalTo(bounds.size.width);
    }];
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:1.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
    
    // 获取label中存放的tag值(即索引)
    NSInteger idx = label.tag - kFLagValue;
    
    self.selectedLabel.scale = 0;
    label.scale = 1;
    self.selectedLabel = label;
    
    if ([self.delegate respondsToSelector:@selector(essenceMenuiew:index:)]) {
        [self.delegate essenceMenuiew:self index:idx];
    }
    
    // 请求数据
}



#pragma mark
#pragma mark - lazy

- (NSMutableArray *)menuLabels {
    if (_menuLabels) {
        _menuLabels = [NSMutableArray arrayWithCapacity:5];
    }
    return _menuLabels;
}

- (NSMutableArray *)gesturesArr {
    if (!_gesturesArr) {
        _gesturesArr = [NSMutableArray arrayWithCapacity:5];
    }
    return _gesturesArr;
}

- (UIView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[UIView alloc] init];
        _indicatorView.backgroundColor = [UIColor redColor];
    }
    return _indicatorView;
}

@end
