//
//  PostCell.h
//  01-Movie
//
//  Created by Silver on 15/2/3.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"

@interface PostCell : UICollectionViewCell

@property (nonatomic,strong)UIImageView *imageView;

@property (nonatomic, strong)MovieModel *model;

- (void)filpViews;
- (void)exchangeViews;

@end
