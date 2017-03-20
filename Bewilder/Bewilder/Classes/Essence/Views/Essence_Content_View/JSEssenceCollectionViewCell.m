//
//  JSEssenceCollectionViewCell.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/16.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSEssenceCollectionViewCell.h"
#import "JSEssenceTableView.h"
#import "JSNetworkManager+JSEssenceDatas.h"

static NSString * const kTableViewReusedIdentifier = @"kTableViewReusedIdentifier";

@interface JSEssenceCollectionViewCell () <UITableViewDataSource,UITableViewDelegate>

/** 数据 */
@property (nonatomic,strong) NSArray <JSTopicModel *>*topicLists;
/** 表格 */
@property (nonatomic,strong) JSEssenceTableView *tableView;

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
    JSRefreshNormalHeader *mj_header = [JSRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDatas)];
    self.tableView.mj_header = mj_header;
    self.tableView.mj_footer = [JSRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDatas)];
    [self.tableView.mj_header beginRefreshing];
}

/** 下拉刷新 */
- (void)loadNewDatas {
    // 取消之前的下载任务
    __weak typeof(self) weakSelf = self;
    [self.tableView.mj_footer endRefreshing];
    [[JSNetworkManager sharedManager].tasks makeObjectsPerformSelector:@selector(cancel)];
    [[JSNetworkManager sharedManager] pullDatasWithCompletionHandler:^(NSArray<JSTopicModel *> *response, BOOL isCompletion) {
        weakSelf.topicLists = response;
        weakSelf.tableView.topicLists = response;
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_header endRefreshing];
    }];
}
/** 上拉刷新 */
- (void)loadMoreDatas {
    // 取消之前的下载任务
    __weak typeof(self) weakSelf = self;
    [self.tableView.mj_header endRefreshing];
    [[JSNetworkManager sharedManager].tasks makeObjectsPerformSelector:@selector(cancel)];
    [[JSNetworkManager sharedManager] loadMoreDatasWithMaxID:@"" WithCompletionHandler:^(NSArray<JSTopicModel *> *response, JSTopicInfo *topicInfo, BOOL isCompletion) {
        NSMutableArray *tempArr = [NSMutableArray arrayWithArray:weakSelf.topicLists];
        [tempArr addObjectsFromArray:response];
        weakSelf.tableView.topicLists = tempArr.copy;
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_footer endRefreshing];
    }];
}

#pragma mark
#pragma mark - table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topicLists.count;
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

- (JSEssenceTableView *)tableView {
    if (!_tableView) {
        //CGRectMake(0, 64, SCREEN_WIDTH, self.bounds.size.height)
        _tableView = [[JSEssenceTableView alloc] initWithFrame:self.bounds];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
