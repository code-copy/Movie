//
//  ImageViewController.h
//  01-Movie
//
//  Created by Silver on 15/2/2.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UICollectionViewController

@property (nonatomic, strong) NSArray *imageURLArray;//传递数据用的（加载图片的链接）
@property (nonatomic, strong) NSIndexPath *s_IndexPath;//确定推到这边的时候，先是在哪一行

@end
