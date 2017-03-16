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


static NSString * const reusedIdentifier = @"EssenceCollectionViewReusedIdentifier";

@interface JSEssenceController () <UICollectionViewDataSource>
/** 导航区 */
@property (nonatomic,strong) JSEssenceMenuView *menuView;
/** 内容区 */
@property (nonatomic,strong) JSEssenceCollectionView *collectionView;

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
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reusedIdentifier];
    
    [self.view insertSubview:self.collectionView belowSubview:self.js_NavigationBar];
    [self.view addSubview:self.menuView];

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
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reusedIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
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
    }
    return _menuView;
}

- (JSEssenceCollectionView *)collectionView {
    if(!_collectionView){
        _collectionView = [[JSEssenceCollectionView alloc] initWithFrame:self.view.bounds];
        _collectionView.dataSource = self;
    }
    return _collectionView;
}


@end
