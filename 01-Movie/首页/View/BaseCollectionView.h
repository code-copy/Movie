//
//  BaseCollectionView.h
//  01-Movie
//
//  Created by Silver on 15/2/4.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)NSArray *modelArry;
@property (nonatomic, assign)NSInteger currentPage;
@property (nonatomic, assign)CGFloat itemWidth;
@property (nonatomic, assign)CGFloat minLineSpace;

@end
