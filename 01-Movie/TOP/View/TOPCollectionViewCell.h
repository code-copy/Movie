//
//  TOPCollectionViewCell.h
//  01-Movie
//
//  Created by Silver on 15/2/6.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TOPModel.h"
#import "RatingView.h"

@interface TOPCollectionViewCell : UICollectionViewCell
{
    IBOutlet UIImageView *_imageView;

    IBOutlet RatingView *_starView;
    IBOutlet UILabel *_title;
    IBOutlet UILabel *_ratingLable;
}

@property (nonatomic, strong)TOPModel *model;

@end
