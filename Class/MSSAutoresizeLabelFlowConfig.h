//
//  MSSAutoresizeLabelFlowConfig.h
//  MSSAutoresizeLabelFlow
//
//  Created by Mrss on 15/12/26.
//  Copyright © 2015年 expai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MSSAutoresizeLabelFlowConfig : NSObject

+ (MSSAutoresizeLabelFlowConfig *)  shareConfig;

@property (nonatomic) UIEdgeInsets  contentInsets;
@property (nonatomic) CGFloat       textMargin;
@property (nonatomic) CGFloat       lineSpace;
@property (nonatomic) CGFloat       itemHeight;
@property (nonatomic) CGFloat       itemSpace;
@property (nonatomic) CGFloat       itemCornerRaius;
@property (nonatomic) UIColor       *itemColor;
@property (nonatomic) UIColor       *itemSelectedColor;
@property (nonatomic) BOOL          multiSelected;
@property (nonatomic) UIColor       *titleColor;
@property (nonatomic) UIFont        *titleFont;

@end
