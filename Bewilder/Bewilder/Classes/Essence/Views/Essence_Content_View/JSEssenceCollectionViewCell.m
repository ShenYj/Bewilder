//
//  JSEssenceCollectionViewCell.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/16.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSEssenceCollectionViewCell.h"


static NSString * const kTableViewReusedIdentifier = @"kTableViewReusedIdentifier";

@interface JSEssenceCollectionViewCell () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation JSEssenceCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareView];
    }
    return self;
}

- (void)prepareView {
    self.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewReusedIdentifier];
    [self.contentView addSubview:self.tableView];

    self.tableView.contentInset = UIEdgeInsetsMake(64+44, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    // 设置刷新控件
    [self setupRefresh];
}

/** 设置刷新控件 */
- (void)setupRefresh {
    MJRefreshNormalHeader *mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDatas)];
    //根据拖拽比例自动切换透明度
    mj_header.automaticallyChangeAlpha = YES;
    // 隐藏最后更新时间
    mj_header.lastUpdatedTimeLabel.hidden = YES;
    self.tableView.mj_header = mj_header;
}

/** 下拉刷新 */
- (void)loadNewDatas {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
    });
}



#pragma mark
#pragma mark - table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewReusedIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    JSTopicModel *topic = self.topicLists[indexPath.item];
    cell.textLabel.text = topic.name;
    return cell;
}

#pragma mark
#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JSLOG
}

#pragma mark
#pragma mark - lazy

- (UITableView *)tableView {
    if (!_tableView) {
        //CGRectMake(0, 64, SCREEN_WIDTH, self.bounds.size.height)
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
