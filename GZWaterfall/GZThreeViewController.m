//
//  GZThreeViewController.m
//  GZWaterfalls
//
//  Created by xinshijie on 17/3/23.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "GZThreeViewController.h"
#import "GZThreeLayout.h"

@interface GZThreeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic)UICollectionView *ThreeCollection;
@end

@implementation GZThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ThreeCollection.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 67;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    //对cell的内容进行填充
    cell.contentView.backgroundColor=[UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:0.5];
    return  cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //返回每个item的大小
    return CGSizeMake(collectionView.bounds.size.width/3, arc4random()%200+50);
   // return CGSizeMake(collectionView.bounds.size.width/2, 100);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    //返回每一列的间距
    return 0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    //返回每一行的间距
    return 5;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"~~~~~~%ld",(long)indexPath.item);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UICollectionView *)ThreeCollection{
    if (!_ThreeCollection) {
        GZThreeLayout *fallsLayout = [[GZThreeLayout alloc] init];
        _ThreeCollection = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:fallsLayout];
        [self.view addSubview:_ThreeCollection];
        //设置委托
        _ThreeCollection.delegate=self;
        _ThreeCollection.dataSource=self;
        //注册重用类
        [_ThreeCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    }
    return _ThreeCollection ;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
