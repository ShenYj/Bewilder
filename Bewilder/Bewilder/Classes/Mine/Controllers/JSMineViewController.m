//
//  JSMineViewController.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/6.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSMineViewController.h"
#import "JSSettingViewController.h"
#import "JSMineLastTableViewCell.h"
#import "JSNetworkManager+JSMineDatas.h"
#import "JSMineModel.h"

static NSInteger const kNumberOfSections = 3;               // 表格分组个数
static NSInteger const kNumberOfRowsInSt = 1;               // 表格每组行数
static NSString * const reusedIdentifier = @"mineReusedIdentifier";
static NSString * const lastCellReusedId = @"lastCell";     // 最后一个cell重用标识

@interface JSMineViewController ()
@property (nonatomic,strong) JSMineModel *mineVCDatas;
@end

@implementation JSMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;
    [[JSNetworkManager sharedManager] loadDatasWithCompletionHandler:^(JSMineModel *response , BOOL isCompletion) {
        if (isCompletion && response) {
            weakSelf.mineVCDatas = response;
            [weakSelf.tableView reloadData];
        } else {
            NSLog(@"模型数据异常,FIXME");
            abort();
        }
        
    }];
    
}

- (void)setUpUI {
    [super setUpUI];
    [self prepareNavigationBar];
}

- (void)prepareNavigationBar {
    self.js_navigationItem.title = @"我的";
    JSBaseNavBarButtonItem *leftBarButtonItem = [[JSBaseNavBarButtonItem alloc] initWithNormalImgName:@"mine-moon-icon" withHighlightedImgName:@"mine-moon-icon-click" withTarget:self withAction:@selector(clickLeftNavigationBarItem:)];
    JSBaseNavBarButtonItem *rightBarButtonItem = [[JSBaseNavBarButtonItem alloc] initWithNormalImgName:@"mine-setting-icon" withHighlightedImgName:@"mine-setting-icon-click" withTarget:self withAction:@selector(clickRightNavigationBarItem:)];
    self.js_navigationItem.rightBarButtonItems = @[rightBarButtonItem,leftBarButtonItem];
}

- (void)prepareTableView {
    [super prepareTableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reusedIdentifier];
    [self.tableView registerClass:[JSMineLastTableViewCell class] forCellReuseIdentifier:lastCellReusedId];
}

#pragma mark 
#pragma mark - target
- (void)clickLeftNavigationBarItem:(JSBaseNavBarButtonItem *)sender {
    NSLog(@"%s",__func__);
}
- (void)clickRightNavigationBarItem:(JSBaseNavBarButtonItem *)sender {
    JSSettingViewController *settingVC = [[JSSettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

#pragma mark
#pragma mark - table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return kNumberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kNumberOfRowsInSt;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == kNumberOfSections - 1) {
        JSMineLastTableViewCell *lastCell = [tableView dequeueReusableCellWithIdentifier:lastCellReusedId forIndexPath:indexPath];
        lastCell.mineModel = self.mineVCDatas;
        return lastCell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedIdentifier forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登录/注册";
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
    } else if (indexPath.section == 1) {
        cell.textLabel.text = @"离线下载";
        cell.imageView.image = nil;
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    UIImage *image = [UIImage imageNamed:@"mainCellBackground"];
    CGFloat inset = image.size.width * 0.5;
    UIImage *newImg = [image resizableImageWithCapInsets:UIEdgeInsetsMake(inset, inset, inset, inset) resizingMode:UIImageResizingModeStretch];
    cell.backgroundView = [[UIImageView alloc] initWithImage:newImg];
    return cell;
}


#pragma mark
#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == kNumberOfSections - 1) {
        return self.mineVCDatas.lastCellHeight;
    }
    return 44;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
