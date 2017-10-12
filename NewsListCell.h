//
//  NewsListCell.h
//  01-Movie
//
//  Created by Silver on 15/1/31.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface NewsListCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *newsImage;
@property (strong, nonatomic) IBOutlet UILabel *newsTitle;
@property (strong, nonatomic) IBOutlet UIImageView *subImage;
@property (strong, nonatomic) IBOutlet UILabel *subTitle;

@property (nonatomic,strong)NewsModel  *model;

@end
