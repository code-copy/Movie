//
//  ImageViewCell.h
//  01-Movie
//
//  Created by Silver on 15/2/2.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageScrollView.h"

@interface ImageViewCell : UICollectionViewCell

@property (nonatomic, strong)NSString *imageURL;//传递图片数据
@property (nonatomic, strong)ImageScrollView *scrollView;

- (id)initWithFrame:(CGRect)frame;


@end
