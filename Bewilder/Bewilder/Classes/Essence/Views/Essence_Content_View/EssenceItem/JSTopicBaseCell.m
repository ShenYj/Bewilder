//
//  JSTopicBaseCell.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/21.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSTopicBaseCell.h"
#import "JSBaseTop.h"
#import "JSBaseBottom.h"
#import "JSBaseConst.h"


@interface JSTopicBaseCell ()

/** 顶部视图 */
@property (nonatomic,strong) JSBaseTop      *topic_top_status;
/** 底部toolbar */
@property (nonatomic,strong) JSBaseBottom   *topic_bottom_toolbar;

@end

@implementation JSTopicBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self prepareBaseCellView];
    }
    return self;
}

- (void)prepareBaseCellView {
    self.backgroundColor = JS_Gray_Color(206);
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.topic_top_status];
    [self.contentView addSubview:self.topic_bottom_toolbar];
    
    [self.topic_top_status mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView);
    }];
    
    [self.topic_bottom_toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topic_top_status.mas_bottom).mas_offset(kMargin);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(kBottomToolBarHeigth);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self);
        make.bottom.mas_equalTo(self.topic_bottom_toolbar).mas_offset(kMargin);
    }];
}

- (void)setTopicModel:(JSTopicModel *)topicModel {
    _topicModel = topicModel;
    
    self.topic_top_status.topicModel = topicModel;
    self.topic_bottom_toolbar.topicModel = topicModel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark
#pragma mark - lazy

- (JSBaseTop *)topic_top_status {
    if (!_topic_top_status) {
        _topic_top_status = [[JSBaseTop alloc] init];
    }
    return _topic_top_status;
}

- (JSBaseBottom *)topic_bottom_toolbar {
    if (!_topic_bottom_toolbar) {
        _topic_bottom_toolbar = [[JSBaseBottom alloc] init];
    }
    return _topic_bottom_toolbar;
}

@end
