//
//  CinemaTableViewCell.h
//  01-Movie
//
//  Created by Silver on 15/2/9.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModel.h"

@interface CinemaTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *grade;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UILabel *distance;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UIImageView *seat;
@property (strong, nonatomic) IBOutlet UIImageView *coupon;


@property (nonatomic, strong)CinemaModel *model;

@end
