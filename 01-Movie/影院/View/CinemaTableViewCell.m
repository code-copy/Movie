//
//  CinemaTableViewCell.m
//  01-Movie
//
//  Created by Silver on 15/2/9.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "CinemaTableViewCell.h"

@implementation CinemaTableViewCell

- (void)awakeFromNib {
}

- (void)layoutSubviews{

    [super layoutSubviews];
    _name.text = _model.name;
    _grade.text = _model.grade;
    _address.text = _model.address;
    _distance.text = @"10千米";
   
    _price.text = [NSString stringWithFormat:@"￥%@", _model.lowPrice];
    
    if ([_model.isSeatSupport isEqual:@"1"]) {
        _seat.hidden = NO;
        [_seat setImage:[UIImage imageNamed:@"cinemaSeatMark@2x"]];
    }else{
        _seat.hidden = YES;
    }
    
    if ([_model.isCouponSupport isEqual:@"1"]) {
        _coupon.hidden = NO;
        [_coupon setImage:[UIImage imageNamed:@"cinemaCouponMark@2x"]];
    }else{
        _coupon.hidden = YES;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
