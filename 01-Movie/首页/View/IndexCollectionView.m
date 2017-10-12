//
//  IndexCollectionView.m
//  01-Movie
//
//  Created by Silver on 15/2/3.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "IndexCollectionView.h"
#include "IndexCell.h"

static NSString *identifity = @"indexCell";

@implementation IndexCollectionView

- (id)initWithFrame:(CGRect)frame{

    self.itemWidth = kScreenWidth / 4;
    self.minLineSpace = 5;
    
    if (self = [super initWithFrame:frame]) {

        [self registerClass:[IndexCell class] forCellWithReuseIdentifier:identifity];
    }
    
    return self;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    IndexCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifity forIndexPath:indexPath];
    
    cell.model = self.modelArry[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
        
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentPage = indexPath.item;   
}

@end
