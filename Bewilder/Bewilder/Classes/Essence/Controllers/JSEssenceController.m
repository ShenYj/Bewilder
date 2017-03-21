//
//  JSEssenceController.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/6.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSEssenceController.h"
#import "JSEssenceMenuView.h"
#import "JSEssenceCollectionView.h"
#import "JSEssenceCollectionViewCell.h"
#import "JSMenuLabel.h"


static NSString * const reusedIdentifier = @"EssenceCollectionViewReusedIdentifier";
static NSInteger const kNumberOfItemsInSection = 5;             // item个数

@interface JSEssenceController () <UICollectionViewDataSource,UICollectionViewDelegate,JSEssenceMenuViewIndexDelegate,JSEssenceMenuViewDataSource>

/** 导航区 */
@property (nonatomic,strong) JSEssenceMenuView *menuView;
/** 内容区 */
@property (nonatomic,strong) JSEssenceCollectionView *collectionView;
/** 数据 */
//@property (nonatomic,strong) NSArray <JSTopicModel *>*topicLists;

@end

@implementation JSEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)prepareTableView {
    //[super prepareTableView];
}

- (void)prepareNavigationBar {
    self.js_navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.js_navigationItem.leftBarButtonItem = [[JSBaseNavBarButtonItem alloc] initWithNormalImgName:@"MainTagSubIcon" withHighlightedImgName:@"MainTagSubIconClick" withTarget:self withAction:@selector(clickLeftNavigationBarItem:)];
}

- (void)setUpUI {
    [super setUpUI];
    [self prepareNavigationBar];
    [self.collectionView registerClass:[JSEssenceCollectionViewCell class] forCellWithReuseIdentifier:reusedIdentifier];
    
    [self.view insertSubview:self.collectionView belowSubview:self.js_NavigationBar];
    [self.view addSubview:self.menuView];

    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view);
    }];
    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.js_NavigationBar.mas_bottom);
    }];
}

- (void)clickLeftNavigationBarItem:(JSBaseNavBarButtonItem *)sender {
    NSLog(@"%s",__func__);
}


#pragma mark
#pragma mark - collection view dataScoure

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return kNumberOfItemsInSection;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JSEssenceCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reusedIdentifier forIndexPath:indexPath];
    return cell;
}

#pragma mark
#pragma mark - collection view delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    NSInteger leftIdx = (NSInteger)contentOffsetX / SCREEN_WIDTH;
    CGFloat rightCellScale = contentOffsetX / SCREEN_WIDTH - leftIdx;
    
    // 设置Channel视图Label缩放、颜色
    //JSMenuLabel *leftLabel = self.menuView.menuLabels[leftIdx];
    self.menuView.menuLabels[leftIdx].scale = 1 - rightCellScale;
    if (leftIdx + 1 > self.menuView.menuLabels.count) {
        return;
    }
    self.menuView.menuLabels[leftIdx + 1].scale = rightCellScale;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger idx = scrollView.contentOffset.x / SCREEN_WIDTH;
    [self.menuView selectedIdex:idx];
}


#pragma mark
#pragma mark - JSEssenceMenuViewIndexDelegate

- (void)essenceMenuView:(JSEssenceMenuView *)menuView index:(NSInteger)index {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark
#pragma mark - JSEssenceMenuViewDataSource

- (void)loadDatasEssenceMenuView:(JSEssenceMenuView *)menuView index:(NSInteger)index {
    // 发起网络请求
    JSLOG
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 
#pragma mark - lazy

- (JSEssenceMenuView *)menuView {
    if (!_menuView) {
        _menuView = [[JSEssenceMenuView alloc] init];
        _menuView.delegate = self;
        _menuView.dataSource = self;
    }
    return _menuView;
}

- (JSEssenceCollectionView *)collectionView {
    if(!_collectionView){
        _collectionView = [[JSEssenceCollectionView alloc] initWithFrame:self.view.bounds];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}


@end
