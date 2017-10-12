//
//  ImageScrollView.m
//  01-Movie
//
//  Created by Silver on 15/2/2.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "ImageScrollView.h"

@implementation ImageScrollView

//重写set方法，添加图片
- (void)setImageURL:(NSString *)imageURL{
    
    _imageURL = imageURL;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_imageURL]];
}

//重写init方法，添加图片，添加手势事件
- (id)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, kScreenWidth - 10, kScreenHeight)];
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        _imgView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_imgView];
        
        //添加手势准备
        self.minimumZoomScale = 1.0;
        self.maximumZoomScale = 2.0;
        self.delegate = self;
        _imgView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tapTow = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTowAction)];
        tapTow.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tapTow];
        
        UITapGestureRecognizer *tapOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOneAction)];
        [self addGestureRecognizer:tapOne];
        
        //防止两种手势相互影响
        [tapOne requireGestureRecognizerToFail:tapTow];
    }
    
    return self;
}

//单指隐藏NavBar
- (void)tapOneAction{

    [[NSNotificationCenter defaultCenter] postNotificationName:@"hiddenNavBar" object:nil];
}

//双指放大活着缩小图片
- (void)tapTowAction{
    if (self.zoomScale > 1) {
        [self setZoomScale:1.0 animated:YES];
    }else{
    
        [self setZoomScale:2.0 animated:YES];
    }

}
//返回放大或缩小后的图片
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{

    return _imgView;
}
@end
