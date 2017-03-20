//
//  GZShopCell.m
//  GZWaterfall
//
//  Created by xinshijie on 17/3/1.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "GZShopCell.h"
#import "GZShop.h"
#import "UIImageView+WebCache.h"

@interface GZShopCell ()

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation GZShopCell

- (void)setShop:(GZShop *)shop
{
    _shop = shop;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:shop.img] placeholderImage:[UIImage imageNamed:@"图片12"]];
    
    self.priceLabel.text = shop.price;
}

@end
