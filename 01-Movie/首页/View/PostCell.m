//
//  PostCell.m
//  01-Movie
//
//  Created by Silver on 15/2/3.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "PostCell.h"
#import "PosterDataView.h"


@implementation PostCell
{
    PosterDataView *_dataView;
    BOOL _isLeft;
}


- (id)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self _initViews];
    }
    
    return self;
}

- (void)_initViews{
    
    _dataView = [[[NSBundle mainBundle] loadNibNamed:@"PosterDataView" owner:self options:nil] lastObject];
    _dataView.frame = self.contentView.bounds;
    [self.contentView addSubview:_dataView];
    
    _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    _imageView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_imageView];

}

- (void)filpViews{
    
    UIViewAnimationOptions option = _isLeft ? UIViewAnimationOptionTransitionCurlDown : UIViewAnimationOptionTransitionCurlUp;
    
    [UIView transitionWithView:self.contentView duration:0.5 options:option animations:^{
        
        NSArray *subArray = [self.contentView subviews];
        
        NSInteger index1 = [subArray indexOfObject:_imageView];
        NSInteger index2 = [subArray indexOfObject:_dataView];
        
        [self.contentView exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
        
    } completion:^(BOOL finished) {
        
        _isLeft = !_isLeft;
    }];

}

- (void)exchangeViews{
    
    [self.contentView bringSubviewToFront:_imageView];
    
    if (_isLeft) {
        
        _isLeft = !_isLeft;
    }

}
- (void)setModel:(MovieModel *)model{

    _model = model;
    
    _dataView.model = _model;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:[_model.images objectForKey:@"large"]]];
}

@end
