//
//  ImageViewCell.m
//  01-Movie
//
//  Created by Silver on 15/2/2.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "ImageViewCell.h"


@implementation ImageViewCell

//重写init方法，添加scrollView
- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {

        _scrollView = [[ImageScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
        
        [self addSubview:_scrollView];
    }
    return self;
}

//重写set方法，加载图片数据
- (void)setImageURL:(NSString *)imageURL{

    _imageURL = imageURL;
    
     _scrollView.imageURL = _imageURL;
}

@end
