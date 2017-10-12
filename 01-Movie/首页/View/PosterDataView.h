//
//  PosterDataView.h
//  01-Movie
//
//  Created by Silver on 15/2/3.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingView.h"
#import "MovieModel.h"

@interface PosterDataView : UIView

@property (nonatomic, strong) IBOutlet UIImageView *dataImageView;
@property (nonatomic, strong) IBOutlet UILabel *cnTitle;
    
@property (nonatomic, strong) IBOutlet UILabel *enTitle;
    
@property (nonatomic, strong) IBOutlet UILabel *year;
    
@property (nonatomic, strong) IBOutlet UILabel *rating;
@property (nonatomic, strong) IBOutlet RatingView *ratingView;


@property (nonatomic,strong) MovieModel *model;


@end
