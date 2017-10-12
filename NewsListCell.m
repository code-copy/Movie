//
//  NewsListCell.m
//  01-Movie
//
//  Created by Silver on 15/1/31.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "NewsListCell.h"

@implementation NewsListCell

- (void)awakeFromNib {
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    _newsTitle.text = _model.title;
    _subTitle.text = _model.summary;
 
    [_newsImage sd_setImageWithURL:[NSURL URLWithString:_model.image]];
    
    //判断是否加载小图片，加载哪一张小图片
    if ([_model.type intValue] == 0) {
        _subImage.hidden = YES;
    }
    else if([_model.type intValue] == 1){
    
        _subImage.hidden = NO;
        [_subImage setImage:[UIImage imageNamed:@"scspxw.png"]];
    }
    else if([_model.type intValue] == 2){
    
        _subImage.hidden = NO;
        [_subImage setImage:[UIImage imageNamed:@"sctpxw.png"]];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
