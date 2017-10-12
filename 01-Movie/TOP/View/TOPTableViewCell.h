//
//  TOPTableViewCell.h
//  01-Movie
//
//  Created by Silver on 15/2/6.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TOPContentModel.h"

@interface TOPTableViewCell : UITableViewCell
{
    IBOutlet UILabel *_nickname;
    IBOutlet UIImageView *_userImage;
    IBOutlet UILabel *_rating;
}
@property (strong, nonatomic) IBOutlet UILabel *content;
@property (strong, nonatomic) IBOutlet UIView *view;

@property (nonatomic, strong)TOPContentModel *model;

@end
