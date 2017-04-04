//
//  JSBaseBottom.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/21.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSBaseBottom.h"
#import "JSBaseConst.h"
#import "JSToolBarButton.h"
#import "JSTopicModel.h"

@interface JSBaseBottom ()
/** 按钮: 赞 */
@property (nonatomic,strong) JSToolBarButton *favour;
/** 按钮: 踩 */
@property (nonatomic,strong) JSToolBarButton *oppose;
/** 按钮: 分享 */
@property (nonatomic,strong) JSToolBarButton *share;
/** 按钮: 评论 */
@property (nonatomic,strong) JSToolBarButton *comment;
/** 分割线 */
@property (nonatomic,strong) UIView *seperatorView;

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
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.favour];
    [self addSubview:self.oppose];
    [self addSubview:self.share];
    [self addSubview:self.comment];
    [self addSubview:self.seperatorView];
    
    NSArray *btns = @[self.favour,self.oppose,self.share,self.comment];
    [btns mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [btns mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
    }];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(kBottomToolBarHeigth).priorityHigh();
    }];
}

- (void)setTopicModel:(JSTopicModel *)topicModel {
    _topicModel = topicModel;
    [self.favour setTitle:topicModel.ding_string forState:UIControlStateNormal];
    [self.oppose setTitle:topicModel.cai_string forState:UIControlStateNormal];
    [self.share setTitle:topicModel.repost_string forState:UIControlStateNormal];
    [self.comment setTitle:topicModel.comment_string forState:UIControlStateNormal];
}

#pragma mark 
#pragma mark - lazy

- (JSToolBarButton *)favour {
    if (!_favour) {
        _favour = [[JSToolBarButton alloc] init];
        [_favour setTitle:@"赞" forState:UIControlStateNormal];
        [_favour setImage:[UIImage imageNamed:@"mainCellDing"] forState:UIControlStateNormal];
        [_favour setImage:[UIImage imageNamed:@"mainCellDingClick"] forState:UIControlStateHighlighted];
    }
    return _favour;
}

- (JSToolBarButton *)oppose {
    if (!_oppose) {
        _oppose = [[JSToolBarButton alloc] init];
        [_oppose setTitle:@"踩" forState:UIControlStateNormal];
        [_oppose setImage:[UIImage imageNamed:@"mainCellCai"] forState:UIControlStateNormal];
        [_oppose setImage:[UIImage imageNamed:@"mainCellCaiClick"] forState:UIControlStateHighlighted];
    }
    return _oppose;
}

- (JSToolBarButton *)share {
    if (!_share) {
        _share = [[JSToolBarButton alloc] init];
        [_share setTitle:@"分享" forState:UIControlStateNormal];
        [_share setImage:[UIImage imageNamed:@"mainCellShare"] forState:UIControlStateNormal];
        [_share setImage:[UIImage imageNamed:@"mainCellShareClick"] forState:UIControlStateHighlighted];
    }
    return _share;
}

- (JSToolBarButton *)comment {
    if (!_comment) {
        _comment = [[JSToolBarButton alloc] init];
        [_comment setTitle:@"评论" forState:UIControlStateNormal];
        [_comment setImage:[UIImage imageNamed:@"mainCellComment"] forState:UIControlStateNormal];
        [_comment setImage:[UIImage imageNamed:@"mainCellCommentClick"] forState:UIControlStateHighlighted];
    }
    return _comment;
}

- (UIView *)seperatorView {
    if (!_seperatorView) {
        _seperatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 2*kMargin, 1)];
        _seperatorView.backgroundColor = JS_Gray_Color(206);
    }
    return _seperatorView;
}

@end
