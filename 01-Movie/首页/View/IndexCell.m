//
//  IndexCell.m
//  01-Movie
//
//  Created by Silver on 15/2/3.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "IndexCell.h"

@implementation IndexCell

- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self _initViews];
    }
    return self;
}

- (void)_initViews{
    
    _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    [self addSubview:_imageView];
    
}

- (void)setModel:(MovieModel *)model{
    
    _model = model;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:[_model.images objectForKey:@"medium"]]];
}

@end
