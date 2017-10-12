//
//  MovieListCell.m
//  01-Movie
//
//  Created by Silver on 15/1/30.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "MovieListCell.h"

@implementation MovieListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)layoutSubviews{

    [super layoutSubviews];
    
    //加载数据
    _movieTitle.text = _model.title;
    _ratingLable.text = [NSString stringWithFormat:@"%.1f", [[_model.rating objectForKey:@"average"] floatValue]];
    _yearLabe.text = [NSString stringWithFormat:@"年份：%@", _model.year];
    
    //图片
    NSString *imageURLStr = [_model.images objectForKey:@"medium"];
    NSURL *imageURL = [NSURL URLWithString:imageURLStr];
    [_movieImage sd_setImageWithURL:imageURL];
    
    _ratingImage.rating = [[_model.rating objectForKey:@"average"] floatValue];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
