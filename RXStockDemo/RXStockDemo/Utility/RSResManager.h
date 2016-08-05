//
//  RSResManager.h
//  RXStockDemo
//
//  Created by ceshi on 16/8/4.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSStockObject.h"
#import "RSStockDetailObject.h"
@interface RSResManager : NSObject

@property (nonatomic, strong) NSArray *stockArray;


- (NSArray *)arrayWithRSStockObject:(RSStockObject *)rsStockObject;



+ (RSResManager *)sharedInstance;

@end
