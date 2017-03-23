//
//  GZThreeLayout.m
//  GZWaterfalls
//
//  Created by xinshijie on 17/3/23.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "GZThreeLayout.h"

@implementation GZThreeLayout

-(void)setup
{
    arr=[NSMutableArray array];
    arrItem=[NSMutableArray array];
}

-(instancetype)init
{
    if(self=[super init])
    {
        [self setup];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self=[super initWithCoder:aDecoder])
    {
        [self setup];
    }
    return self;
}


-(void)prepareLayout
{
    //对瀑布流布局进行初始化
    NSLog(@"prepareLayout");
    [arr removeAllObjects];
    [arr addObject:@0];
    [arr addObject:@0];
    NSInteger count=[self.collectionView numberOfItemsInSection:0];
    arrItem=[NSMutableArray array];
    for(int i=0;i<count;i++)
    {
        NSIndexPath *path=[NSIndexPath indexPathForItem:i inSection:0];
        [arrItem addObject:[self layoutAttributesForItemAtIndexPath:path]];
    }
}

-(CGSize)collectionViewContentSize
{
    //计算整个contentsize的大小
    __block CGFloat height=0;
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj floatValue]>height)
        {
            height=[obj floatValue];
        }
    }];
    return CGSizeMake(self.collectionView.bounds.size.width, height);
}

-(UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //计算每一个item的相关属性
    UICollectionViewLayoutAttributes *attr=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    int index=0;
    if([arr[0] floatValue]<[arr[1] floatValue])
    {
        index=0;
    }
    else
    {
        index=1;
    }
    CGFloat width=self.collectionView.bounds.size.width/2;
    CGFloat height=arc4random()%200+100;
    CGFloat left=index*width;
    CGFloat top=[arr[index] floatValue];
    CGRect frame=CGRectMake(left, top, width, height);
    attr.frame=frame;
    arr[index]=@([arr[index] floatValue]+height);
    return attr;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //返回需要显示的item
    NSMutableArray *arrRect=[NSMutableArray array];
    [arrItem enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UICollectionViewLayoutAttributes *attr=obj;
        //判断是否有交集
        if(CGRectIntersectsRect(attr.frame, rect))
        {
            [arrRect addObject:obj];
        }
    }];
    return arrRect;
}

@end
