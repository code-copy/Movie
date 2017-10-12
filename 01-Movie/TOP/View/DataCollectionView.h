//
//  DataCollectionView.h
//  01-Movie
//
//  Created by Silver on 15/2/6.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, strong)NSArray *imagesArray;

@end
