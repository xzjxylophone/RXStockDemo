//
//  RSStockDetailCell.m
//  RXStockDemo
//
//  Created by ceshi on 16/8/4.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "RSStockDetailCell.h"
@interface RSStockDetailCell ()


@property (nonatomic, strong) NSArray *labelArray;



@property (nonatomic, strong) UIView *lineView;


@end

@implementation RSStockDetailCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGFloat width = RX_Window_Width;
        CGFloat height = [RSStockDetailCell cellHeight];
        
        
        NSInteger count = 6;
        CGFloat subWidth = width / 6.0f;
        
        UIFont *font = k_UI_Font14;
        
        NSMutableArray *labelArray = [NSMutableArray array];
        for (NSInteger i = 0; i < count; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(subWidth * i, 0, subWidth, height)];
            label.font = font;
            label.textColor = k_UI_Color_MainText;
            label.textAlignment = NSTextAlignmentCenter;
            label.numberOfLines = 0;
            [labelArray addObject:label];
            [self.contentView addSubview:label];
        }
        
        
        self.labelArray = labelArray;
        
        
        
        
        
        
        self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, height - 0.5, width, 0.5)];
        self.lineView.backgroundColor = k_UI_Color_Line;
        
        [self.contentView addSubview:self.lineView];
        
        
        
    }
    return self;
}

- (void)setData:(id)data
{
    if ([data isKindOfClass:[RSStockDetailObject class]]) {
        RSStockDetailObject *tmp = data;
        NSString *formatString = @"%.2f";
        NSArray *array = @[tmp.showDateString, [NSString stringWithFormat:formatString, tmp.curPrice], [NSString stringWithFormat:formatString, tmp.tenAveragePrice], [NSString stringWithFormat:formatString, tmp.fiveAveragePrice], [NSString stringWithFormat:formatString, tmp.sevenAveragePrice], [NSString stringWithFormat:formatString, tmp.thirtyAveragePrice]];
        
        
        double curPrice = tmp.curPrice;
        
        for (NSInteger i = 0; i < array.count; i++) {
            NSString *string = array[i];
            UILabel *label = self.labelArray[i];
            label.text = string;
            if (i > 1) {
                double averagePrice = [string doubleValue];
                UIColor *color = curPrice > averagePrice ? [UIColor redColor] : [UIColor greenColor];
                label.textColor = color;
            }
        }
    } else {
        
    }
}

+ (CGFloat)cellHeight
{
    return 50;
}

@end
