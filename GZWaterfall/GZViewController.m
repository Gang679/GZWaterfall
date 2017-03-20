//
//  GZViewController.m
//  GZWaterfall
//
//  Created by xinshijie on 17/3/1.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "GZViewController.h"
#import "GZLayout.h"
#import "SecondCollectionViewCell.h"
@interface GZViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,GZLayoutDelegate>

@property (nonatomic , strong)UICollectionView *PeopleCollection ;

@end

@implementation GZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"规则瀑布流";
    self.view.backgroundColor = [UIColor whiteColor];
    GZLayout *layer = [[GZLayout alloc]init];
    layer.delegate = self ;
    
    _PeopleCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:layer];
    [_PeopleCollection registerClass:[SecondCollectionViewCell class] forCellWithReuseIdentifier:@"SecondCollectionViewCell"];
    [_PeopleCollection setBackgroundColor:[UIColor whiteColor]];
    
    _PeopleCollection.delegate = self ;
    _PeopleCollection.dataSource = self ;
    
    [self.view addSubview:_PeopleCollection];    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1 ;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6 ;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SecondCollectionViewCell *AllContest = [collectionView dequeueReusableCellWithReuseIdentifier:@"SecondCollectionViewCell" forIndexPath:indexPath];
    AllContest.images.image = [UIImage imageNamed:@"图片12"];
    AllContest.Num.text = [NSString stringWithFormat:@"%ld",indexPath.item];
    
    return AllContest ;
}


- (CGFloat)columnMarginInFallsLayout:(GZLayout *)fallsLayout
{
    return 3;
}

- (CGFloat)rowMarginInFallsLayout:(GZLayout *)fallsLayout
{
    return 2;
}

- (CGFloat)columnCountInFallsLayout:(GZLayout *)fallsLayout
{
    return 2;
}

//- (UIEdgeInsets)edgeInsetsInFallsLayout:(GZLayout *)fallsLayout
//{
//    return UIEdgeInsetsMake(0, 0, 1, 0);
//}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"~~~~~~~~~~~~~%ld",(long)indexPath.item);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
