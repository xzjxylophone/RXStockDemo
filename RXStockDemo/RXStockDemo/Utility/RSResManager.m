//
//  RSResManager.m
//  RXStockDemo
//
//  Created by ceshi on 16/8/4.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "RSResManager.h"
#import "RSStockObject.h"


@implementation RSResManager




- (id)init
{
    if (self = [super init]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"stock" ofType:@""];
        NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSArray *array = [str componentsSeparatedByString:@"\n"];
        
        NSMutableArray *resultArray = [NSMutableArray array];
        for (NSString *str in array) {
            
            RSStockObject *object = [RSStockObject rsStockObjectWithString:str];
            if (object != nil) {
                [resultArray addObject:object];
            }
            
        }
        
        [resultArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            RSStockObject *so1 = obj1;
            RSStockObject *so2 = obj2;
            return [so1.identify compare:so2.identify];
        }];
        
        self.stockArray  = resultArray;
    }
    return self;
}



+ (RSResManager *)sharedInstance
{
    static RSResManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[RSResManager alloc] init];
    });
    return instance;
}


@end
