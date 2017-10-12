//
//  TOPTableViewCell.m
//  01-Movie
//
//  Created by Silver on 15/2/6.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "TOPTableViewCell.h"

@implementation TOPTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)layoutSubviews{

    [super layoutSubviews];
    
    _rating.text = _model.rating;
    _nickname.text = _model.nickname;
    _content.text = _model.content;    
    
    [_userImage sd_setImageWithURL:[NSURL URLWithString:_model.userImage]];
    
    //设置图片的边角
    _view.layer.cornerRadius = 5;
    _view.layer.borderColor = [[UIColor whiteColor] CGColor];
    _view.layer.borderWidth = 1;
    _view.layer.masksToBounds = YES;
    
    //设置图片的边角
    _userImage.layer.cornerRadius = 5;
    _userImage.layer.borderColor = [[UIColor whiteColor] CGColor];
    _userImage.layer.borderWidth = 1;
    _userImage.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
