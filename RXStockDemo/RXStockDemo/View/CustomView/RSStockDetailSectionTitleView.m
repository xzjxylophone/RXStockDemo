//
//  RSStockDetailSectionTitleView.m
//  RXStockDemo
//
//  Created by ceshi on 16/8/5.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "RSStockDetailSectionTitleView.h"

@interface RSStockDetailSectionTitleView ()

@property (nonatomic, strong) UILabel *desLabel;

@end


@implementation RSStockDetailSectionTitleView


- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        CGFloat width = RX_Window_Width;
        CGFloat height = 100;
        
        NSInteger count = 6;
        CGFloat subWidth = width / 6.0f;
        CGFloat labelHeight = 50;
        UIFont *font = k_UI_Font14;
        NSArray *array = @[@"日期", @"收盘价", @"10日均线", @"5日均线", @"7日均线", @"30日均线"];
        for (NSInteger i = 0; i < count; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(subWidth * i, 0, subWidth, labelHeight)];
            label.font = font;
            label.textColor = k_UI_Color_MainText;
            label.textAlignment = NSTextAlignmentCenter;
            label.numberOfLines = 0;
            label.text = array[i];
            [self addSubview:label];
        }
        
        CGFloat desLabelHeight = height - labelHeight;
        CGFloat deslLabelY = labelHeight;
        self.desLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, deslLabelY, width, desLabelHeight)];
        self.desLabel.font = font;
        self.desLabel.textColor = k_UI_Color_AppRed;
        self.desLabel.textAlignment = NSTextAlignmentCenter;
        self.desLabel.numberOfLines = 0;
        self.desLabel.text = @"红色表示当日收盘价大于均价是可以买入的\n绿色表示当日收盘价小于均价是需要卖出的";
        
        [self addSubview:self.desLabel];
        
        self.backgroundColor = k_UI_Color_Background;
        self.frame = CGRectMake(0, 0, width, height);
    }
    return self;
}







@end
