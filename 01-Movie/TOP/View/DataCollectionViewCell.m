//
//  DataCollectionViewCell.m
//  01-Movie
//
//  Created by Silver on 15/2/6.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "DataCollectionViewCell.h"

@implementation DataCollectionViewCell
{
    UIImageView *_imageView;
}

- (id)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        [self addSubview:_imageView];
    }
    return self;
}

- (void)setImage:(NSString *)image{

    _image = image;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString: _image]];
}

@end
