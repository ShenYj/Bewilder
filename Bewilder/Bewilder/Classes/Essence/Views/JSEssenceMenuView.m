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


@property (nonatomic,strong) NSMutableArray *gesturesArr;
/** 中间变脸,记录当前label */
@property (nonatomic,weak) JSMenuLabel *selectedLabel;

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
    __weak typeof(self)weakSelf = self;
    [titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL * _Nonnull stop) {
        __strong typeof(self) self = weakSelf;
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
        
        if (idx == 0) {
            label.scale = 1;
            self.selectedLabel = label;
        }
    }];

    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(kMenuViewHeight);
    }];
}


- (void)selectedIdex:(NSInteger)index {
    
    [self tapGesture:self.gesturesArr[index]];
}

- (void)tapGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    JSMenuLabel *label = (JSMenuLabel *)tapGestureRecognizer.view;
    
    if (label == self.selectedLabel) {
        return;
    }
    
    // 获取label中存放的tag值(即索引)
    NSInteger idx = label.tag - kFLagValue;
    
    self.selectedLabel.scale = 0;
    label.scale = 1;
    self.selectedLabel = label;
    
    if ([self.delegate respondsToSelector:@selector(essenceMenuiew:index:)]) {
        [self.delegate essenceMenuiew:self index:idx];
    }
    
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

@end
