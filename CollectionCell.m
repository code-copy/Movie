//
//  CollectionCell.m
//  01-Movie
//
//  Created by Silver on 15/2/2.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "CollectionCell.h"


@implementation CollectionCell

- (id)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth / 5, kScreenWidth / 5)]) {
        
    }
    return self;
}

- (void)setModel:(ImgModel *)model{

    _model = model;
    //加载图片
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_model.imagesName]];
}

- (void)awakeFromNib{
    
    //设置图片的边角
    _imageView.layer.cornerRadius = 5;
    _imageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    _imageView.layer.borderWidth = 1;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.layer.masksToBounds = YES;

}

@end
