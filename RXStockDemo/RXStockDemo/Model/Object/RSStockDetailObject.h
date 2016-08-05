//
//  RSStockDetailObject.h
//  RXStockDemo
//
//  Created by ceshi on 16/8/5.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSStockDetailObject : NSObject


@property (nonatomic, strong) NSDate *date;
@property (nonatomic, assign) double curPrice;

@property (nonatomic, assign) double fiveAveragePrice;          // 五日均价
@property (nonatomic, assign) double sevenAveragePrice;         // 七日均价
@property (nonatomic, assign) double tenAveragePrice;           // 十日均价
@property (nonatomic, assign) double thirtyAveragePrice;        // 三十日均价

@property (nonatomic, readonly) NSString *showDateString;

+ (id)rsStockDetailObjectWithString:(NSString *)string;




@end
