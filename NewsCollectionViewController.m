//
//  NewsCollectionViewController.m
//  01-Movie
//
//  Created by Silver on 15/2/2.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "NewsCollectionViewController.h"
#import "ImageViewController.h"
#import "ImgModel.h"
#import "CollectionCell.h"

@interface NewsCollectionViewController ()
{
    NSMutableArray *_imageArray;
    NSMutableArray *_modelArray;
}
@end

@implementation NewsCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout  = UIRectEdgeNone;
    
    //设置背景图片
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];

    //加载数据
    [self loadImageData];
}

- (void)loadImageData{
    //调用公共方法，加载JSON数据
    NSArray *imageArray = [RequestData loadMovieDataJSON:Image_List];
    
    _imageArray = [NSMutableArray array];
    _modelArray = [NSMutableArray array];
    
    for (NSDictionary *dic in imageArray) {
        NSString *imageName = [dic objectForKey:@"image"];
        
        ImgModel *model = [[ImgModel alloc] init];
        model.imagesName = imageName;
        
        [_imageArray addObject:imageName];//传递数据用
        [_modelArray addObject:model];//设置cell用
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _modelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    cell.model = _modelArray[indexPath.item];

    return cell;
}

#pragma mark <UICollectionViewDelegate>
//设置cell的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake((kScreenWidth - 50) / 4, (kScreenWidth - 50) / 4);
}

//设置cell距离上下左右的距离
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(10, 10, 10, 10);
}

// cell 将要显示在屏幕上的时候调用，在不显示的时候不加载，性能更佳优化
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImgModel *model = _modelArray[indexPath.item];
    CollectionCell *collectCell = (CollectionCell *)cell;
    [collectCell.imageView sd_setImageWithURL:[NSURL URLWithString:model.imagesName]];
}

//选中小图标，推到下一页，并且传送数据
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    ImageViewController *imgCol = [[ImageViewController alloc] init];
    
    imgCol.imageURLArray = _imageArray;
    imgCol.s_IndexPath = indexPath;
    
    [self.navigationController pushViewController:imgCol animated:YES];
}

@end
