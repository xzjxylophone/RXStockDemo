//
//  RXStockObject.h
//  RXStockDemo
//
//  Created by ceshi on 16/8/4.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXStockObject : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *identify;


+ (id)rxStockObjectWithString:(NSString *)string;

@end
