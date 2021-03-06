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
#import "JSMeButton.h"
#import "JSSquareListModel.h"
#import "JSLoginViewController.h"
#import "JSMineSubViewController.h"

static NSInteger const kNumberOfSections = 3;               // 表格分组个数
static NSInteger const kNumberOfRowsInSt = 1;               // 表格每组行数
static NSString * const reusedIdentifier = @"mineReusedIdentifier";
static NSString * const lastCellReusedId = @"lastCell";     // 最后一个cell重用标识
extern NSInteger const flag;                                // tag值中间变量

@interface JSMineViewController () <JSMineLastCellButonClickDelegate>
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
    [MobClick event:@"setting"];
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
        lastCell.lastCellDelegate = self;
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
    if (indexPath.section == 0) {
        JSLoginViewController *loginViewController = [[JSLoginViewController alloc] init];
        [self presentViewController:loginViewController animated:YES completion:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == kNumberOfSections - 1) {
        return self.mineVCDatas.lastCellHeight;
    }
    return 44;
}

#pragma mark
#pragma mark - JSMineLastCellButonClickDelegate

- (void)lastCell:(JSMineLastTableViewCell *)lastCell clickedButton:(JSMeButton *)clickedButton {
    NSArray *squareListArr = self.mineVCDatas.square_list;
    NSInteger idx = clickedButton.tag - flag;
    JSSquareListModel *squareList = squareListArr[idx];
    NSString *urlString = squareList.url;
    
    if ([urlString hasPrefix:@"http"]) {
        // webView加载
        JSMineSubViewController *mineSubVC = [[JSMineSubViewController alloc] init];
        mineSubVC.urlString = urlString;
        mineSubVC.js_navigationItem.title = squareList.name;
        [MobClick event:@"WebView"];
        [self.navigationController pushViewController:mineSubVC animated:YES];
        
    } else if ([urlString hasPrefix:@"mod"]) {
        
        if ([urlString hasSuffix:@"BDJ_To_Check"]) {
            // 审帖
            NSLog(@"跳转到审帖界面");
            [MobClick event:@"shentie"];
        } else if ([urlString hasSuffix:@"BDJ_To_RecentHot"]){
            NSLog(@"跳转到'每日排行'界面");
            [MobClick event:@"meiripaihang"];
        } else {
            NSLog(@"跳转到其他界面");
            [MobClick event:@"other"];
        }
        
    } else {
        NSLog(@"不是http或mod协议");
        [MobClick event:@"more"];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
