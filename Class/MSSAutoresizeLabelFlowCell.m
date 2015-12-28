//
//  MSSAutoresizeLabelFlowCell.m
//  MSSAutoresizeLabelFlow
//
//  Created by Mrss on 15/12/26.
//  Copyright © 2015年 expai. All rights reserved.
//

#import "MSSAutoresizeLabelFlowCell.h"
#import "MSSAutoresizeLabelFlowConfig.h"

@interface MSSAutoresizeLabelFlowCell ()

@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation MSSAutoresizeLabelFlowCell

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.backgroundColor = [MSSAutoresizeLabelFlowConfig shareConfig].itemColor;
        _titleLabel.textColor = [MSSAutoresizeLabelFlowConfig shareConfig].titleColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:_titleLabel];
    }
    return self;
}

- (void)configCell:(NSString *)title {
    self.titleLabel.frame = self.bounds;
    self.titleLabel.text = title;
}

@end
