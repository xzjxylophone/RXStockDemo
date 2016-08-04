//
//  RSStockListCell.m
//  RXStockDemo
//
//  Created by ceshi on 16/8/4.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "RSStockListCell.h"
#import "RSStockObject.h"


@interface RSStockListCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *identifyLabel;
@property (nonatomic, strong) UIView *lineView;

@end


@implementation RSStockListCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGFloat width = RX_Window_Width;
        CGFloat height = [RSStockListCell cellHeight];
        
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
    if ([data isKindOfClass:[RSStockObject class]]) {
        RSStockObject *tmp = data;
        self.nameLabel.text = tmp.name;
        self.identifyLabel.text = tmp.identify;
    } else {
        
    }
}

+ (CGFloat)cellHeight
{
    return 50;
}


@end
