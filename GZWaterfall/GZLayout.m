//
//  GZLayout.m
//  GZWaterfall
//
//  Created by xinshijie on 17/3/1.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "GZLayout.h"

@interface GZLayout()

@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *attrsArray; ///< 所有的cell的布局
@property (nonatomic, strong) NSMutableArray *columnHeights;                                  ///< 每一列的高度
@property (nonatomic, assign) NSInteger noneDoubleTime;                                       ///< 没有生成大尺寸次数
@property (nonatomic, assign) NSInteger lastDoubleIndex;                                      ///< 最后一次大尺寸的列数
@property (nonatomic, assign) NSInteger lastFixIndex;                                         ///< 最后一次对齐矫正列数

- (CGFloat)columnCount;     ///< 列数
- (CGFloat)columnMargin;    ///< 列边距
- (CGFloat)rowMargin;       ///< 行边距
- (UIEdgeInsets)edgeInsets; ///< collectionView边距

@end

@implementation GZLayout

#pragma mark - 默认参数
static const CGFloat GZColumnCount = 3;                           ///< 默认列数
static const CGFloat GZColumnMargin = 10;                         ///< 默认列边距
static const CGFloat GZRowMargin = 10;                            ///< 默认行边距
static const UIEdgeInsets GZUIEdgeInsets = {10, 10, 10, 10};      ///< 默认collectionView边距

#pragma mark - 布局计算
// collectionView 首次布局和之后重新布局的时候会调用
// 并不是每次滑动都调用，只有在数据源变化的时候才调用

- (void)prepareLayout
{
    // 重写必须调用super方法
    [super prepareLayout];
    
    // 判断如果有50个cell（首次刷新），就重新计算
    if ([self.collectionView numberOfItemsInSection:0] == 50) {
        [self.attrsArray removeAllObjects];
        [self.columnHeights removeAllObjects];
    }
    // 当列高度数组为空时，即为第一行计算，每一列的基础高度加上collection的边框的top值
    if (!self.columnHeights.count) {
        for (NSInteger i = 0; i < self.columnCount; i++) {
            [self.columnHeights addObject:@(self.edgeInsets.top)];
        }
    }
    // 遍历所有的cell，计算所有cell的布局
    for (NSInteger i = self.attrsArray.count; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        // 计算布局属性并将结果添加到布局属性数组中
        [self.attrsArray addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
}

// 返回布局属性，一个UICollectionViewLayoutAttributes对象数组
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

// 计算布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (indexPath.item == 0) {
        attrs.frame = CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 4)/3*2 +2, ([UIScreen mainScreen].bounds.size.width - 4)/3*2 +2);
    }else if (indexPath.item == 1){
        attrs.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 4)/3*2 +4, 0, ([UIScreen mainScreen].bounds.size.width - 4)/3, ([UIScreen mainScreen].bounds.size.width - 4)/3);
    }else if (indexPath.item == 2){
        attrs.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 4)/3*2 +4, ([UIScreen mainScreen].bounds.size.width - 4)/3 +2, ([UIScreen mainScreen].bounds.size.width - 4)/3, ([UIScreen mainScreen].bounds.size.width - 4)/3);
    }else if (indexPath.item == 3){
        attrs.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 4)/3*2 +4, ([UIScreen mainScreen].bounds.size.width - 4)/3 *2 + 4, ([UIScreen mainScreen].bounds.size.width - 4)/3, ([UIScreen mainScreen].bounds.size.width - 4)/3);
    }else if (indexPath.item == 4){
        attrs.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 4)/3 +2, ([UIScreen mainScreen].bounds.size.width - 4)/3 *2 +4, ([UIScreen mainScreen].bounds.size.width - 4)/3, ([UIScreen mainScreen].bounds.size.width - 4)/3);
    }else{
        attrs.frame = CGRectMake(0, ([UIScreen mainScreen].bounds.size.width - 4)/3 *2 +4, ([UIScreen mainScreen].bounds.size.width - 4)/3, ([UIScreen mainScreen].bounds.size.width - 4)/3);
    }
    // 返回计算获取的布局
    return attrs;
}

// 返回collectionView的ContentSize
- (CGSize)collectionViewContentSize
{
    // collectionView的contentSize的高度等于所有列高度中最大的值
    CGFloat maxColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger i = 1; i < self.columnCount; i++) {
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        if (maxColumnHeight < columnHeight) {
            maxColumnHeight = columnHeight;
        }
    }
    return CGSizeMake(0, maxColumnHeight + self.edgeInsets.bottom);
}

#pragma mark - 懒加载
- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

- (NSMutableArray *)columnHeights
{
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}

- (CGFloat)rowMargin
{
    if ([self.delegate respondsToSelector:@selector(rowMarginInFallsLayout:)]) {
        return [self.delegate rowMarginInFallsLayout:self];
    } else {
        return GZRowMargin;
    }
}

- (CGFloat)columnCount
{
    if ([self.delegate respondsToSelector:@selector(columnCountInFallsLayout:)]) {
        return [self.delegate columnCountInFallsLayout:self];
    } else {
        return GZColumnCount;
    }
}

- (CGFloat)columnMargin
{
    if ([self.delegate respondsToSelector:@selector(columnMarginInFallsLayout:)]) {
        return [self.delegate columnMarginInFallsLayout:self];
    } else {
        return GZColumnMargin;
    }
}

- (UIEdgeInsets)edgeInsets
{
    if ([self.delegate respondsToSelector:@selector(edgeInsetsInFallsLayout:)]) {
        return [self.delegate edgeInsetsInFallsLayout:self];
    } else {
        return GZUIEdgeInsets;
    }
}


@end
