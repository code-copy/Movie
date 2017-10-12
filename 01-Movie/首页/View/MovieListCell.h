//
//  MovieListCell.h
//  01-Movie
//
//  Created by Silver on 15/1/30.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "RatingView.h"

@interface MovieListCell : UITableViewCell

{
    IBOutlet UIImageView *_movieImage;
    IBOutlet UILabel *_movieTitle;
    IBOutlet RatingView *_ratingImage;
    IBOutlet UILabel *_yearLabe;
    IBOutlet UILabel *_ratingLable;
}

@property (nonatomic, strong)MovieModel *model;

@end
