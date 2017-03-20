//
//  GZLayout.h
//  GZWaterfall
//
//  Created by xinshijie on 17/3/1.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GZLayout ;

@protocol GZLayoutDelegate <NSObject>

@optional

/// 列数
- (CGFloat)columnCountInFallsLayout:(GZLayout *)fallsLayout;
/// 列间距
- (CGFloat)columnMarginInFallsLayout:(GZLayout *)fallsLayout;
/// 行间距
- (CGFloat)rowMarginInFallsLayout:(GZLayout *)fallsLayout;
/// collectionView边距
- (UIEdgeInsets)edgeInsetsInFallsLayout:(GZLayout *)fallsLayout;

@end


@interface GZLayout : UICollectionViewLayout

@property (nonatomic, weak) id<GZLayoutDelegate> delegate;
@end
