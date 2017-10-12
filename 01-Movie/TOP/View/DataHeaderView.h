//
//  DataHeaderView.h
//  01-Movie
//
//  Created by Silver on 15/2/6.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataHeaderView : UIView
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *titleCn;
@property (strong, nonatomic) IBOutlet UILabel *directors;
@property (strong, nonatomic) IBOutlet UILabel *actors;
@property (strong, nonatomic) IBOutlet UILabel *type;
@property (strong, nonatomic) IBOutlet UILabel *location;
@property (strong, nonatomic) IBOutlet UILabel *date;

@end
