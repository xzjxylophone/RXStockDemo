//
//  MainViewController.m
//  RXStockDemo
//
//  Created by ceshi on 16/8/2.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
 
 
 
 
 #pragma mark - View Life Cycle
 
 - (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view from its nib.
 
 [self initializeUIAndData];
 [self initializeAction];
 }
 
 
 
 - (void)didReceiveMemoryWarning {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
 }
 - (void)viewWillAppear:(BOOL)animated
 {
 [super viewWillAppear:animated];
 }
 
 
 
 #pragma mark - initialize UI And Data
 - (void)initializeUIAndData
 {
 self.hidesBottomBarWhenPushed = YES;
 self.view.backgroundColor = k_UI_Color_Background;
 [self rx_tapAnywhereToDismissKeyboard];
 self.title = @"";
 
 
 MJRefreshHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
 self.tableView.mj_header = header;
 
 
 
 
 self.rxTVProObject = [[RXTVProtocolObject alloc] init];
 self.rxTVProObject.delegate = self;
 self.tableView.backgroundColor = [UIColor clearColor];
 self.tableView.tableHeaderView = [UIView new];
 self.tableView.tableFooterView = [UIView new];
 self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
 self.tableView.dataSource = self.rxTVProObject;
 self.tableView.delegate = self.rxTVProObject;
 
 
 }
 - (void)initializeAction
 {
 [self loadCellData];
 [self refresh];
 }
 
 #pragma mark - Private
 - (void)loadCellData
 {
 
 }
 - (void)refresh
 {
 
 }
 
 
 
 
 #pragma mark - RXTVProtocolObjectDelegate
 - (UITableViewCell *)tvObject:(RXTVProtocolObject *)tvObject tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 id data = [tvObject itemWithIndexPath:indexPath];
 //    NSString *identify = [DFStationListCell identifier];
 //    DFStationListCell *cell = (DFStationListCell *)[tableView dequeueReusableCellWithIdentifier:identify];
 //    if (cell == nil) {
 //        cell = [DFStationListCell cell];
 //    }
 //    [cell setData:data];
 return nil;
 }
 
 
 // delegate
 - (CGFloat)tvObject:(RXTVProtocolObject *)tvObject tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 //    return [DFStationListCell cellHeight];
 return 0;
 }
 - (void)tvObject:(RXTVProtocolObject *)tvObject tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 id data = [tvObject itemWithIndexPath:indexPath];
 
 }
 
 
 
 
 */

/*
 
 <RXTVProtocolObjectDelegate>
 
 @property (nonatomic, weak) IBOutlet UITableView *tableView;
 @property (nonatomic, strong) RXTVProtocolObject *rxTVProObject;
 
 
 */



@end
