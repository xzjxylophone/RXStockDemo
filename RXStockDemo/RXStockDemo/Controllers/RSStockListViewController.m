//
//  RSStockListViewController.m
//  RXStockDemo
//
//  Created by ceshi on 16/8/4.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "RSStockListViewController.h"
#import "RSStockObject.h"
#import "RSStockListCell.h"
@interface RSStockListViewController () <RXTVProtocolObjectDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) RXTVProtocolObject *rxTVProObject;


@end

@implementation RSStockListViewController



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
    self.title = @"列表";
    
    
    
    
    
    
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
    
    self.rxTVProObject.functionItems = @[[RSResManager sharedInstance].stockArray];
    [self.tableView reloadData];
    
    
}
- (void)refresh
{
    
}




#pragma mark - RXTVProtocolObjectDelegate
- (UITableViewCell *)tvObject:(RXTVProtocolObject *)tvObject tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id data = [tvObject itemWithIndexPath:indexPath];
    NSString *identify = [RSStockListCell identifier];
    RSStockListCell *cell = (RSStockListCell *)[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [RSStockListCell cell];
    }
    [cell setData:data];
    return cell;
}


// delegate
- (CGFloat)tvObject:(RXTVProtocolObject *)tvObject tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [RSStockListCell cellHeight];
}
- (void)tvObject:(RXTVProtocolObject *)tvObject tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id data = [tvObject itemWithIndexPath:indexPath];
    NSDictionary *query = @{SKey_data:data};
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RSStockDetailViewController" query:query animate:YES];
    
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
