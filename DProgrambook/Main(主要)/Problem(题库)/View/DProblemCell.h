//
//  DProblemCellTableViewCell.h
//  DProgrambook
//
//  Created by titi on 2019/10/14.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import "DTableViewCell.h"


NS_ASSUME_NONNULL_BEGIN

@interface DProblemCell : DTableViewCell
//背景视图
@property (nonatomic,strong) UIView *bgView;
//图标
@property (nonatomic,strong) UIImageView *iconImageView;
//指示图片
@property (nonatomic,strong) UIImageView *indicatorImageView;
//标题
@property (nonatomic,strong) UILabel *titleLabel;
//介绍
@property (nonatomic,strong) UILabel *introduceLabel;

@end

NS_ASSUME_NONNULL_END
