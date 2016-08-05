//
//  RSResManager.m
//  RXStockDemo
//
//  Created by ceshi on 16/8/4.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "RSResManager.h"
#import "RSStockObject.h"
#import "RSStockDetailObject.h"


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


- (NSArray *)arrayWithRSStockObject:(RSStockObject *)rsStockObject
{
    NSMutableArray *resultArray = [NSMutableArray array];
    NSString *identify = rsStockObject.identify;
    NSString *path = [[NSBundle mainBundle] pathForResource:identify ofType:@""];
    
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray *array = [str componentsSeparatedByString:@"\n"];


    for (NSString *str in array) {
        RSStockDetailObject *object = [RSStockDetailObject rsStockDetailObjectWithString:str];
        if (object != nil) {
            [resultArray addObject:object];
        }
    }
    
    
    for (NSInteger i = 0; i < resultArray.count; i++) {
        RSStockDetailObject *object = resultArray[i];
        
        object.fiveAveragePrice = [self averagePriceWithArray:resultArray startIndex:i averageNumber:5];
        object.sevenAveragePrice = [self averagePriceWithArray:resultArray startIndex:i averageNumber:7];
        object.tenAveragePrice = [self averagePriceWithArray:resultArray startIndex:i averageNumber:10];
        object.thirtyAveragePrice = [self averagePriceWithArray:resultArray startIndex:i averageNumber:30];
    }
    

    return resultArray;

}

- (double)averagePriceWithArray:(NSArray *)array startIndex:(NSInteger)startIndex averageNumber:(NSInteger)number
{
    NSInteger count = array.count;
    NSInteger realCount = MIN(number, count - startIndex);
    double total = 0;
    for (NSInteger i = startIndex; i < realCount + startIndex; i++) {
        RSStockDetailObject *object = array[i];
        total += object.curPrice;
    }
    double result = total / realCount;
    return result;
    
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
