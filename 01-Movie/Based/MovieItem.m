//
//  MovieItem.m
//  01-Movie
//
//  Created by Silver on 15/1/29.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "MovieItem.h"

@implementation MovieItem

- (id)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        CGFloat itemWidth = CGRectGetWidth(frame);
        CGFloat itemHeight = CGRectGetHeight(frame);
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((itemWidth - 22)/2, 10, 22, 20)];
        imageView.image = [UIImage imageNamed:imageName];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, itemHeight - 20,itemWidth, 20)];
        
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:11];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = title;
        [self addSubview:titleLabel];
        
    }
    return self;
}

@end
