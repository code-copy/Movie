//
//  BaseCollectionView.m
//  01-Movie
//
//  Created by Silver on 15/2/4.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView

- (id)initWithFrame:(CGRect)frame{
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    if (self = [super initWithFrame:frame collectionViewLayout:flow]) {
        
        self.dataSource = self;
        self.delegate = self;

    }
    
    //隐藏滑动条
    self.showsHorizontalScrollIndicator = NO;
    
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _modelArry.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}

//设置cell的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(self.itemWidth, collectionView.height);
}

//设置图片之间的间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return self.minLineSpace;
}

//上左下右的间隔
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, (kScreenWidth - self.itemWidth ) / 2, 0,(kScreenWidth - self.itemWidth ) / 2);
}

//当前页面
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    CGFloat xOffset = targetContentOffset->x;
    
    NSInteger index = (xOffset + (self.itemWidth + self.minLineSpace) / 2) / (self.itemWidth  + self.minLineSpace) ;
    
    targetContentOffset->x = index * (self.itemWidth + self.minLineSpace);

    self.currentPage = index;
}

@end
