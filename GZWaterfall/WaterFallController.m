//
//  WaterFallController.m
//  GZWaterfall
//
//  Created by xinshijie on 17/4/5.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "WaterFallController.h"
#import "WaterFallFlowLayout.h"

@interface WaterFallController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    
    UICollectionView * _collectionView;
}
@end
@implementation WaterFallController

-(void)viewDidLoad{
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor    = [UIColor whiteColor];
    WaterFallFlowLayout * layout = [[WaterFallFlowLayout alloc]init];
    layout.itemCount             = 100;
    layout.scrollDirection       = UICollectionViewScrollDirectionVertical;
    layout.itemSize              = CGSizeMake(100, 100);
    _collectionView              = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    _collectionView.delegate     = self;
    _collectionView.dataSource   = self;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:_collectionView];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.item);
}
@end
