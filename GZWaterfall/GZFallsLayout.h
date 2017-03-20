//
//  GZFallsLayout.h
//  GZWaterfall
//
//  Created by xinshijie on 17/3/1.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GZFallsLayout;

@protocol GZFallsLayoutDelegate <NSObject>

@optional
/// 列数
- (CGFloat)columnCountInFallsLayout:(GZFallsLayout *)fallsLayout;
/// 列间距
- (CGFloat)columnMarginInFallsLayout:(GZFallsLayout *)fallsLayout;
/// 行间距
- (CGFloat)rowMarginInFallsLayout:(GZFallsLayout *)fallsLayout;
/// collectionView边距
- (UIEdgeInsets)edgeInsetsInFallsLayout:(GZFallsLayout *)fallsLayout;

@end

@interface GZFallsLayout : UICollectionViewLayout

@property (nonatomic, weak) id<GZFallsLayoutDelegate> delegate;

@end
