//
//  DataCollectionView.m
//  01-Movie
//
//  Created by Silver on 15/2/6.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "DataCollectionView.h"
#import "DataCollectionViewCell.h"

static NSString *identify = @"Cell";

@implementation DataCollectionView

- (id)initWithFrame:(CGRect)frame{

    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flow.minimumLineSpacing = 10;
    flow.itemSize = CGSizeMake(80, 80);
    
    if (self = [super initWithFrame:frame collectionViewLayout:flow]) {
        
        [self registerClass:[DataCollectionViewCell class] forCellWithReuseIdentifier:identify];
        
        self.dataSource = self;
        self.delegate = self;
        
        self.showsHorizontalScrollIndicator = NO;
    }
    
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _imagesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    DataCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.image = _imagesArray[indexPath.item];
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(5, 5, 5, 5);
}

@end
