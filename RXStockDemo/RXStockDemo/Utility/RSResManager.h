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


// http://0411.iteye.com/blog/1068239
@interface RSResManager : NSObject

@property (nonatomic, strong) NSArray *stockArray;


- (NSArray *)arrayWithRSStockObject:(RSStockObject *)rsStockObject;



+ (RSResManager *)sharedInstance;

@end
