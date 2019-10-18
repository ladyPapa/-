//
//  DNewsCell.h
//  DProgrambook
//
//  Created by titi on 2019/10/17.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import "DTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNewsCell : DTableViewCell
//背景视图
@property (nonatomic,strong) UIView *bgView;
//封面
@property (nonatomic,strong) UIImageView *coverImageView;
//标题
@property (nonatomic,strong) UILabel *titleLabel;
//介绍
@property (nonatomic,strong) UILabel *introduceLabel;

@end

NS_ASSUME_NONNULL_END
