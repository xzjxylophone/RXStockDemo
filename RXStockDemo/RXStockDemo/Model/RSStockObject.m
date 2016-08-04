//
//  RSStockObject.m
//  RXStockDemo
//
//  Created by ceshi on 16/8/4.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "RSStockObject.h"

@implementation RSStockObject


+ (id)rsStockObjectWithString:(NSString *)string
{
    NSArray *array = [string componentsSeparatedByString:@","];
    if (array.count != 2) {
        return nil;
    }
    RSStockObject *result = [[RSStockObject alloc] init];
    result.identify = array[0];
    result.name = array[1];
    return result;
}

@end
