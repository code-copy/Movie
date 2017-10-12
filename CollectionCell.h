//
//  CollectionCell.h
//  01-Movie
//
//  Created by Silver on 15/2/2.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImgModel.h"

@interface CollectionCell : UICollectionViewCell

@property (nonatomic,strong) IBOutlet UIImageView *imageView;//storyboard上的imageView
@property (nonatomic, strong) ImgModel *model;

- (id)initWithFrame:(CGRect)frame;
@end
