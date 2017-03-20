//
//  SecondCollectionViewCell.m
//  GZWaterfall
//
//  Created by xinshijie on 17/3/1.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "SecondCollectionViewCell.h"
#import "UIView+SDAutoLayout.h"
@implementation SecondCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self SetPeopleCollectionCellUI];
    }
    return self ;
}

-(void)SetPeopleCollectionCellUI{
    _images = [[UIImageView alloc]init];
    
    [self.contentView addSubview:_images];
    
    _Num = [[UILabel alloc]init];
    
    [_images addSubview:_Num];
    
    _images.sd_layout.widthIs(self.contentView.width).heightIs(self.contentView.height);
    
    _Num.sd_layout.leftEqualToView(_images).bottomEqualToView(_images).heightIs(30).widthIs(_images.width);
    _Num.textAlignment = NSTextAlignmentCenter ;
}

@end
