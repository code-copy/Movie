//
//  ImageViewController.m
//  01-Movie
//
//  Created by Silver on 15/2/2.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "ImageViewController.h"
#import "ImageViewCell.h"

@interface ImageViewController ()
{
    BOOL _isHiddent;
    UIImage *_image;
    UILabel *_numLable;
}

@end

@implementation ImageViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册cell
    [self.collectionView registerClass:[ImageViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    //使NavBar不透明
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //添加下载按钮
    UIButton *downLoadButton = [UIButton buttonWithType:UIButtonTypeCustom];
    downLoadButton.frame = CGRectMake(kScreenWidth - 100, self.view.bottom - 150, 80, 50);
    [downLoadButton setImage:[UIImage imageNamed:@"img_download_p.png"] forState:UIControlStateNormal];
    [downLoadButton addTarget:self action:@selector(downloadImageAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:downLoadButton];
    
    //添加Lable
    _numLable = [[UILabel alloc] initWithFrame:CGRectMake((kScreenWidth - 100) / 2, self.view.bottom - 100, 100, 50)];
    _numLable.textColor = [UIColor blackColor];
    _numLable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_numLable];
}

//图片即将出现，图片显示的位置改变
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.collectionView scrollToItemAtIndexPath:_s_IndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
    //刚出现时显示的页码
    NSString *firstText = [NSString stringWithFormat:@"%i/%lu",(int) (_s_IndexPath.item) + 1, _imageURLArray.count];
    
    _numLable.text = firstText;
}

//放大的图片翻页之后重新变为原来的大小
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ImageViewCell *imageCell = (ImageViewCell *)cell;
    
    [imageCell.scrollView setZoomScale:1.0 animated:NO];
    
    int num = self.collectionView.contentOffset.x / 320;
    
    //下方显示当前页数
    NSString *numText = [NSString stringWithFormat:@"%i/%lu", num + 1, _imageURLArray.count];
    
    _numLable.text = numText;
}


//重写init方法，确定collectViewController的样式
- (id)init{
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake(kScreenWidth, kScreenHeight);
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //使空隙为零，防止放大以后分页错乱
    flow.minimumLineSpacing = 0;
    
    if (self = [super initWithCollectionViewLayout:flow]) {
        
        //开启翻页功能
        self.collectionView.pagingEnabled = YES;
        
        //监听通知，判断是否隐藏NavBar
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddenNavBar) name:@"hiddenNavBar" object:nil];
    }
    
    return self;
    
}

//监听通知，判断是否隐藏NavBar的功能实现
- (void)hiddenNavBar{
    
    _isHiddent = !_isHiddent;
    [self.navigationController setNavigationBarHidden:_isHiddent animated:YES];
}
//释放通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


//下载按钮的功能实现，（方法固定）
- (void)downloadImageAction{
    
    UIImageWriteToSavedPhotosAlbum(_image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

//下载成功或者失败后的提示
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *message = nil;
    if (error == nil) {
        
        message = @"图片保存成功";
        
    } else{
        
        message = @"图片保存出错";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
    
    [alertView show];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{

    //确定当前显示的图片
    ImageViewCell *imageCell = (ImageViewCell *)cell;
    _image = imageCell.scrollView.imgView.image;

}


#pragma mark <UICollectionViewDataSource>
//加载cell
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _imageURLArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    cell.imageURL = _imageURLArray[indexPath.item];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
