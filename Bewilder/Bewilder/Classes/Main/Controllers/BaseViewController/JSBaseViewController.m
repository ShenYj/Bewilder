//
//  JSBaseViewController.m
//  BaseViewController
//
//  Created by ShenYj on 2016/11/17.
//  Copyright © 2016年 ShenYj. All rights reserved.
//

#import "JSBaseViewController.h"
#import "JSBaseNavigationController.h"

static CGFloat const kSectionHeaderHeigth = 10.f;           // 分组样式tableView的头间距
static CGFloat const kSectionFooterHeight = 0.0f;           // 分组样式tableView的尾间距



@interface JSBaseViewController () 

@end

@implementation JSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置视图
    [self prepareTableView];
    [self setUpUI];
}

#pragma mark
#pragma mark - set up UI

/** 设置标题 */ 
- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.js_navigationItem.title = title;
}
/** 导航条视图 */
- (void)prepareCustomNavigationBar {
    
    [self.view addSubview:self.js_NavigationBar];
    self.js_NavigationBar.items = @[self.js_navigationItem];
    self.js_NavigationBar.barTintColor = [UIColor colorWithRed:245 / 255.0 green:245 / 255.0 blue:245 / 255.0 alpha:1.0];
    [self.js_NavigationBar setTitleTextAttributes:@{
                                                    NSFontAttributeName: [UIFont systemFontOfSize:18],
                                                    NSForegroundColorAttributeName: [UIColor orangeColor]}
     ];
}

/** 设置UI */
- (void)setUpUI {
    [self prepareCustomNavigationBar];
    [self prepareView];
}
/** 主视图 */
- (void)prepareView {
    // 设置基类视图背景色
    self.view.backgroundColor = JS_Gray_Color(206);
    self.tableView.backgroundColor = JS_Gray_Color(206);
    // 取消穿透
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (@available(iOS 11.0, *)) self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
}
/** 表格视图 */
- (void)prepareTableView {
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kSectionHeaderHeigth)];
    self.tableView.sectionHeaderHeight = kSectionHeaderHeigth;
    self.tableView.sectionFooterHeight = kSectionFooterHeight;
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 49 - 20, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
}

#pragma mark
#pragma mark - table view dataScoure

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 只是保证不出现语法错误
    return [[UITableViewCell alloc] init];
}

#pragma mark 
#pragma mark - lazy

- (JSNavigationBar *)js_NavigationBar {
    if (!_js_NavigationBar) {
        _js_NavigationBar = [[JSNavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, NAV_STATUS_BAR_Height)];
    }
    return _js_NavigationBar;
}

- (UINavigationItem *)js_navigationItem {
    if (!_js_navigationItem) {
        _js_navigationItem = [[UINavigationItem alloc] init];
    }
    return _js_navigationItem;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}


@end
