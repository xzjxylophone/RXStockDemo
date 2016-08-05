//
//  RSStockDetailObject.m
//  RXStockDemo
//
//  Created by ceshi on 16/8/5.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "RSStockDetailObject.h"
#import "NSDate+RXUtility.h"

@implementation RSStockDetailObject


+ (id)rsStockDetailObjectWithString:(NSString *)string
{
    NSArray *array = [string componentsSeparatedByString:@","];
    if (array.count != 2) {
        return nil;
    }
    
    if ([array[1] doubleValue] == 0) {
        return nil;
    }
    
    RSStockDetailObject *result = [[RSStockDetailObject alloc] init];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];//格式化
    [df setDateFormat:@"yyyyMMdd"];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];

    
    result.date = [df dateFromString:array[0]];
    result.curPrice = [array[1] doubleValue];
    
    
    return result;
}

- (NSString *)showDateString
{
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];//格式化
    [df setDateFormat:@"MM-dd"];
    NSString *s1 = [df stringFromDate:self.date];
    NSString *s2 = [NSDate rx_weekdayStringWithWeek:[self.date rx_weekdayIndex]];
    NSString *result = [NSString stringWithFormat:@"%@\n%@", s1, s2];
    return result;
}

@end
