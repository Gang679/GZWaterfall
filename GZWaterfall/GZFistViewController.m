//
//  GZFistViewController.m
//  GZWaterfall
//
//  Created by xinshijie on 17/3/1.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "GZFistViewController.h"
#import "GZFallsLayout.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "GZShopCell.h"
#import "GZShop.h"

@interface GZFistViewController ()<UICollectionViewDataSource, GZFallsLayoutDelegate>

@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *shops;

@end

@implementation GZFistViewController

static NSString *const ID = @"shop";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
    [self setupRefresh];
}

#pragma mark - 创建collectionView
- (void)setupCollectionView
{
    GZFallsLayout *fallsLayout = [[GZFallsLayout alloc] init];
    fallsLayout.delegate = self;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:fallsLayout];
    [self.view addSubview:collectionView];
    _collectionView = collectionView;
    collectionView.dataSource = self;
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([GZShopCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
}

#pragma mark - 创建上下拉刷新
- (void)setupRefresh
{
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewShops)];
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreShops)];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView.mj_header beginRefreshing];
}

#pragma mark - 加载下拉数据
- (void)loadNewShops
{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *shops = [GZShop mj_objectArrayWithFilename:@"1.plist"];
        [weakSelf.shops removeAllObjects];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.collectionView reloadData];
            [weakSelf.shops addObjectsFromArray:shops];
            [weakSelf.collectionView.mj_header endRefreshing];
            [weakSelf.collectionView reloadData];
        });
    });
}

#pragma mark - 加载上拉数据
- (void)loadMoreShops
{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *shops = [GZShop mj_objectArrayWithFilename:@"1.plist"];
        [weakSelf.shops addObjectsFromArray:shops];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.collectionView.mj_footer endRefreshing];
            [weakSelf.collectionView reloadData];
        });
    });
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    self.collectionView.mj_footer.hidden = self.shops.count == 0;
    return self.shops.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GZShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (self.shops && self.shops.count >= indexPath.item+1) cell.shop = self.shops[indexPath.item];
    return cell;
}

- (CGFloat)columnMarginInFallsLayout:(GZFallsLayout *)fallsLayout
{
    return 5;
}

- (CGFloat)rowMarginInFallsLayout:(GZFallsLayout *)fallsLayout
{
    return 5;
}

- (CGFloat)columnCountInFallsLayout:(GZFallsLayout *)fallsLayout
{
    return 4;
}

- (UIEdgeInsets)edgeInsetsInFallsLayout:(GZFallsLayout *)fallsLayout
{
    return UIEdgeInsetsMake(0, 10, 20, 10);
}

- (NSMutableArray *)shops
{
    if (!_shops) {
        _shops = [NSMutableArray array];
    }
    return _shops;
}

@end

