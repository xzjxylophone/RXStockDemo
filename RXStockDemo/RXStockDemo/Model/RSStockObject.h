//
//  RSStockObject.h
//  RXStockDemo
//
//  Created by ceshi on 16/8/4.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSStockObject : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *identify;


+ (id)rsStockObjectWithString:(NSString *)string;

@end
