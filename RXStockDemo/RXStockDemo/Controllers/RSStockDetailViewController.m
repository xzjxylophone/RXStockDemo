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
#import "RSStockDetailSectionTitleView.h"

@interface RSStockDetailViewController () <RXTVProtocolObjectDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) RXTVProtocolObject *rxTVProObject;


@property (nonatomic, strong) RSStockObject *inputRSStockObject;

@property (nonatomic, strong) RSStockDetailSectionTitleView *rsStockDetailSectionTitleView;

@property(nonatomic,strong) NSURLSessionDownloadTask *task;

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
    
    
    
    self.inputRSStockObject = self.rx_query[SKey_data];
    self.title = self.inputRSStockObject.name;
    
    self.rsStockDetailSectionTitleView = [RSStockDetailSectionTitleView rxView];
    
    
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
    RXTVSectionItem *item = [[RXTVSectionItem alloc] init];
    item.data = self.rsStockDetailSectionTitleView;
    item.items = [[RSResManager sharedInstance] arrayWithRSStockObject:self.inputRSStockObject];
    
    self.rxTVProObject.functionItems = @[item];
    [self.tableView reloadData];
}
- (void)refresh
{
    [self.task resume];
}

- (NSURLSessionDownloadTask *)task
{
    
    if (!_task) {
        
        AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
        
        NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://ichart.yahoo.com/table.csv?s=000002.sz"]];
        
        _task=[session downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
            //下载进度
            NSLog(@"%@",downloadProgress);
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                
            }];
            
        } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
            
            //下载到哪个文件夹
            NSString *cachePath=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
            NSString *fileName=[cachePath stringByAppendingPathComponent:response.suggestedFilename];
            
            return [NSURL fileURLWithPath:fileName];
            
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            
            //下载完成了
            NSLog(@"下载完成了 %@",filePath);
        }];
    }
    
    return _task;
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
