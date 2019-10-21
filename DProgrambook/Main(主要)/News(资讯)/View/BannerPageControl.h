//
//  BannerPageControl.h
//  DProgrambook
//
//  Created by titi on 2019/10/21.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DView.h"
NS_ASSUME_NONNULL_BEGIN

@interface BannerPageControl : UIPageControl

@end

@interface BannerLayout : UICollectionViewFlowLayout
- (instancetype)initLine:(CGFloat)line itemSize:(CGSize)itemSize zoom:(CGFloat)zoom;;

@end

@interface BannerCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *titleLabel;
@end
NS_ASSUME_NONNULL_END
