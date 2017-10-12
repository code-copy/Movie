//
//  PostView.m
//  01-Movie
//
//  Created by Silver on 15/2/3.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "PostView.h"
#import "PostCollectionView.h"
#import "IndexCollectionView.h"
#import "MovieModel.h"

#define kHeaderViewHeight 100

@implementation PostView
{
    UIView *_headerView;
    PostCollectionView *_postCollView;
    IndexCollectionView *_indexCollView;
    UILabel *_titleLable;
    UIView *_markView;
}

- (void)dealloc{

    [_postCollView removeObserver:self forKeyPath:@"currentPage"];
    [_indexCollView removeObserver:self forKeyPath:@"currentPage"];
}

- (id)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self _initPosterView];
        [self _initHeaderView];
        [self _initTitleView];
        
        //KVO
        [_postCollView addObserver:self forKeyPath:@"currentPage" options:NSKeyValueObservingOptionNew context:NULL];
        [_indexCollView addObserver:self forKeyPath:@"currentPage" options:NSKeyValueObservingOptionNew context:NULL];
    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{

    if ([keyPath isEqualToString:@"currentPage"]) {
        
        NSNumber *newIndex = [change objectForKey:@"new"];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[newIndex intValue] inSection:0];
        
        if ([object isKindOfClass:[PostCollectionView class]] && _indexCollView.currentPage != indexPath.item) {
            
            [_indexCollView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
            _indexCollView.currentPage = indexPath.item;
            
        }else if ([object isKindOfClass:[IndexCollectionView class]]){
            
            [_postCollView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
            _postCollView.currentPage = indexPath.item;
        }
        
        MovieModel *model = _modelArry[indexPath.item];
        _titleLable.text = model.title;
    } 
}

- (void)setModelArry:(NSArray *)modelArry{

    _modelArry = modelArry;
    
    _postCollView.modelArry = _modelArry;
    
    _indexCollView.modelArry = _modelArry;
    
    MovieModel *model = _modelArry[0];
    _titleLable.text = model.title;
}

- (void)_initHeaderView{
    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, -kHeaderViewHeight, kScreenWidth, 130)];
    [self addSubview:_headerView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_headerView.bounds];
    UIImage *image = [UIImage imageNamed:@"indexBG_home.png"];
    UIImage *newImage = [image stretchableImageWithLeftCapWidth:0 topCapHeight:5];
    [imageView setImage:newImage];
    [_headerView addSubview:imageView];
    
    UIButton *hiddenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    hiddenButton.tag = 100;
    hiddenButton.frame = CGRectMake((kScreenWidth - 50) / 2, imageView.bottom - 25, 50, 25);
    [hiddenButton setImage:[UIImage imageNamed:@"down_home.png"] forState:UIControlStateNormal];
    [hiddenButton setImage:[UIImage imageNamed:@"up_home.png"] forState:UIControlStateSelected];
    [hiddenButton addTarget:self action:@selector(hiddenButtonView:) forControlEvents:UIControlEventTouchUpInside];    
    [_headerView addSubview:hiddenButton];
    
    _indexCollView = [[IndexCollectionView alloc] init];
    _indexCollView.frame = CGRectMake(0, 0, kScreenWidth, 100);
    [_headerView addSubview:_indexCollView];
}

- (void)_initPosterView{
    
    _postCollView = [[PostCollectionView alloc] initWithFrame:CGRectMake(0, 30, kScreenWidth, kScreenHeight - 64 - 49 - 35 - 30)];
    _postCollView.modelArry = _modelArry;
    [self addSubview:_postCollView];
    
    _markView = [[UIView alloc] init];
    _markView.frame = CGRectMake(0, 30, kScreenWidth, _postCollView.height);
    _markView.hidden = YES;
    _markView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [self addSubview:_markView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self addGestureRecognizer:pan];

}

- (void)_initTitleView{
    
    _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0,kScreenHeight - 64 - 49 - 35, kScreenWidth, 35)];
    _titleLable.backgroundColor = [UIColor blackColor];
    _titleLable.textAlignment = NSTextAlignmentCenter;
    _titleLable.text = @"电影标题";
    _titleLable.textColor = [UIColor whiteColor];
    
    [self addSubview:_titleLable];

}

- (void)panAction:(UIPanGestureRecognizer *)pan{
    
    CGPoint point = [pan translationInView:self];
    
    if (point.y > 0) {
        
        [self showHeaderView];
        
    }else if(point.y < 0){
    
        [self hiddenHeaderView];
    }
    
}

- (void)hiddenButtonView:(UIButton *)button{

    button.selected = !button.selected;
    
    if (button.selected) {

        [self showHeaderView];
    }
    else{
    
        [self hiddenHeaderView];
    }
}

- (void)showHeaderView{
    
    UIButton *button = (UIButton *)[_headerView viewWithTag:100];
    button.selected = YES;
    
    [UIView animateWithDuration:0.5 animations:^{
        _headerView.top = 0;
        _markView.hidden = NO;
    }];

}
- (void)hiddenHeaderView{
    
    UIButton *button = (UIButton *)[_headerView viewWithTag:100];
    button.selected = NO;
    
    [UIView animateWithDuration:0.5 animations:^{
        _headerView.top = -kHeaderViewHeight;
        _markView.hidden = YES;
    }];
}
@end
