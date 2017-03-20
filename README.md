GZWaterfall任何形式的瀑布流
主要自定义UICollectionViewLayout，在其中做行数列数的分布

```UICollectionViewLayout代码片段
/// 列数
- (CGFloat)columnCountInFallsLayout:(GZFallsLayout *)fallsLayout;
/// 列间距
- (CGFloat)columnMarginInFallsLayout:(GZFallsLayout *)fallsLayout;
/// 行间距
- (CGFloat)rowMarginInFallsLayout:(GZFallsLayout *)fallsLayout;
/// collectionView边距
- (UIEdgeInsets)edgeInsetsInFallsLayout:(GZFallsLayout *)fallsLayout;
```
```主要布局
// 计算布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
```
修改了cell复用混乱问题，添加了刷新功能
![GZ6790](https://github.com/Gang679/GZWaterfall/blob/master/Untitled.gif)
添加项目动画 图片展示 如下展示图片
![GZ6790](https://github.com/Gang679/GZWaterfall/blob/master/屏幕快照%202017-03-20%2014.08.28.png)
![GZ6790](https://github.com/Gang679/GZWaterfall/blob/master/屏幕快照%202017-03-20%2014.08.42.png)
![GZ6790](https://github.com/Gang679/GZWaterfall/blob/master/屏幕快照%202017-03-20%2014.08.54.png)
