//
//  RSStockDetailViewController.m
//  RXStockDemo
//
//  Created by ceshi on 16/8/4.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "RSStockDetailViewController.h"
#import "RSStockObject.h"
#import "RSStockDetailCell.h"

@interface RSStockDetailViewController () <RXTVProtocolObjectDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) RXTVProtocolObject *rxTVProObject;


@property (nonatomic, strong) RSStockObject *inputRSStockObject;
@end

@implementation RSStockDetailViewController



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
    NSString *identify = [RSStockDetailCell identifier];
    RSStockDetailCell *cell = (RSStockDetailCell *)[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [RSStockDetailCell cell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell setData:data];
    return cell;
}


// delegate
- (CGFloat)tvObject:(RXTVProtocolObject *)tvObject tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [RSStockDetailCell cellHeight];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
