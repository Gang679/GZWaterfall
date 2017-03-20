//
//  UITableView+SDAutoTableViewCellHeight.h
//  SDAutoLayout
//
//  Created by aier on 15/11/1.
//  Copyright © 2015年 gsd. All rights reserved.

#import <UIKit/UIKit.h>

#import "UIView+SDAutoLayout.h"

@class SDCellAutoHeightManager;

typedef void (^AutoCellHeightDataSettingBlock)(UITableViewCell *cell);

#define kSDModelCellTag 199206



#pragma mark - UITableView 方法，返回自动计算出的cell高度

@interface UITableView (SDAutoTableViewCellHeight)

@property (nonatomic, strong) SDCellAutoHeightManager *cellAutoHeightManager;

- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath model:(id)model keyPath:(NSString *)keyPath cellClass:(Class)cellClass contentViewWidth:(CGFloat)contentViewWidth;

- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath cellClass:(Class)cellClass cellContentViewWidth:(CGFloat)width cellDataSetting:(AutoCellHeightDataSettingBlock)cellDataSetting;

/** 刷新tableView但不清空之前已经计算好的高度缓存，用于直接将新数据拼接在旧数据之后的tableView刷新 */
- (void)reloadDataWithExistedHeightCache;

/** 返回所有cell的高度总和  */
- (CGFloat)cellsTotalHeight;

@property (nonatomic, copy) AutoCellHeightDataSettingBlock cellDataSetting;

@end




#pragma mark - UITableViewController 方法，返回自动计算出的cell高度

@interface UITableViewController (SDTableViewControllerAutoCellHeight)

/** (UITableViewController方法)升级版！一行代码（一步设置）搞定tableview的cell高度自适应,同时适用于单cell和多cell,性能比普通版稍微差一些,不建议在数据量大的tableview中使用  */
- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath cellContentViewWidth:(CGFloat)width;

@end



#pragma mark - NSObject 方法，返回自动计算出的cell高度

@interface NSObject (SDAnyObjectAutoCellHeight)

/** (NSObject方法)升级版！一行代码（一步设置）搞定tableview的cell高度自适应,同时适用于单cell和多cell,性能比普通版稍微差一些,不建议在数据量大的tableview中使用  */
- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath cellContentViewWidth:(CGFloat)width tableView:(UITableView *)tableView;

@end

















// ------------------------------- 以下为库内部使用无须了解 --------------------

@interface SDCellAutoHeightManager : NSObject

@property (nonatomic, assign) BOOL shouldKeepHeightCacheWhenReloadingData;

@property (nonatomic, assign) CGFloat contentViewWidth;

@property (nonatomic, assign) Class cellClass;

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, strong) UITableViewCell *modelCell;

@property (nonatomic, strong) NSMutableDictionary *subviewFrameCacheDict;

@property (nonatomic, strong, readonly) NSDictionary *heightCacheDict;

@property (nonatomic, copy) AutoCellHeightDataSettingBlock cellDataSetting;

- (void)clearHeightCache;

- (void)clearHeightCacheOfIndexPaths:(NSArray *)indexPaths;

- (void)deleteThenResetHeightCache:(NSIndexPath *)indexPathToDelete;

- (NSNumber *)heightCacheForIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath model:(id)model keyPath:(NSString *)keyPath;

- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath model:(id)model keyPath:(NSString *)keyPath cellClass:(Class)cellClass;


- (NSMutableArray *)subviewFrameCachesWithIndexPath:(NSIndexPath *)indexPath;;
- (void)setSubviewFrameCache:(CGRect)rect WithIndexPath:(NSIndexPath *)indexPath;

- (instancetype)initWithCellClass:(Class)cellClass tableView:(UITableView *)tableView;
+ (instancetype)managerWithCellClass:(Class)cellClass tableView:(UITableView *)tableView;
@end

