//
//  TOPCollectionViewCell.m
//  01-Movie
//
//  Created by Silver on 15/2/6.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "TOPCollectionViewCell.h"

@implementation TOPCollectionViewCell

- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {

    }
    
    return self;
}

- (void)setModel:(TOPModel *)model{
    
    _model = model;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:[_model.imageName objectForKey:@"small"]]];
    _title.text = _model.title;
    _title.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    _ratingLable.text = [NSString stringWithFormat:@"%.1f", [[_model.rating objectForKey:@"average"] floatValue]] ;
    _starView.rating = [[_model.rating objectForKey:@"average"] floatValue];
}

@end
