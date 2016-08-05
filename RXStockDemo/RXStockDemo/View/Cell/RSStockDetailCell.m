//
//  RSStockDetailCell.m
//  RXStockDemo
//
//  Created by ceshi on 16/8/4.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "RSStockDetailCell.h"
@interface RSStockDetailCell ()



@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *identifyLabel;
@property (nonatomic, strong) UIView *lineView;


@end

@implementation RSStockDetailCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGFloat width = RX_Window_Width;
        CGFloat height = [RSStockDetailCell cellHeight];
        
        CGFloat nameLabelHeight = 30;
        CGFloat identifyLabelHeight = height - nameLabelHeight;
        CGFloat labelX = 16;
        CGFloat labelWidth = (width - labelX * 2);
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, 0, labelWidth, nameLabelHeight)];
        self.nameLabel.textColor = k_UI_Color_MainText;
        self.nameLabel.font = k_UI_Font15;
        
        
        self.identifyLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, nameLabelHeight, labelWidth, identifyLabelHeight)];
        self.identifyLabel.textColor = k_UI_Color_SubText;
        self.identifyLabel.font = k_UI_Font13;
        
        self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, height - 0.5, width, 0.5)];
        self.lineView.backgroundColor = k_UI_Color_Line;
        
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.identifyLabel];
        [self.contentView addSubview:self.lineView];
        
        
        
        
        
    }
    return self;
}

- (void)setData:(id)data
{
    if ([data isKindOfClass:[RSStockDetailObject class]]) {
        RSStockDetailObject *tmp = data;
        self.nameLabel.text = [NSString stringWithFormat:@"%@", tmp.date];
        self.identifyLabel.text = [NSString stringWithFormat:@"%.2f, %.4f, %.4f, %.4f, %.4f", tmp.curPrice, tmp.fiveAveragePrice, tmp.sevenAveragePrice, tmp.tenAveragePrice, tmp.thirtyAveragePrice];
    } else {
        
    }
}

+ (CGFloat)cellHeight
{
    return 50;
}

@end
