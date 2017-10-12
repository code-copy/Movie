//
//  PostCollectionView.m
//  01-Movie
//
//  Created by Silver on 15/2/3.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "PostCollectionView.h"
#import "PostCell.h"

static NSString *identifity = @"postCell";

@implementation PostCollectionView

- (id)initWithFrame:(CGRect)frame{

    self.itemWidth = (kScreenWidth - 80);
    self.minLineSpace = 10;

    if (self = [super initWithFrame:frame]) {

        [self registerClass:[PostCell class] forCellWithReuseIdentifier:identifity];
    }
    
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PostCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifity forIndexPath:indexPath];
    
    cell.model = self.modelArry[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.item == self.currentPage) {
        PostCell *cell = (PostCell *)[collectionView cellForItemAtIndexPath:indexPath];
        
        [cell filpViews];
    }else{

        [UIView animateWithDuration:0.5 animations:^{
            collectionView.contentOffset = CGPointMake((self.itemWidth + self.minLineSpace) * indexPath.item, 0);
        } completion:^(BOOL finished) {
            
            self.currentPage = indexPath.item;
        }];
    }
}

//恢复已经在页面消失的图片
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{

    PostCell *pcell = (PostCell *)cell;
    
    [pcell exchangeViews];
}

@end
