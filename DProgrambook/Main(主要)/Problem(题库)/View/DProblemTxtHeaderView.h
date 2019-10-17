//
//  DProblemTxtHeaderView.h
//  DProgrambook
//
//  Created by titi on 2019/10/16.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import "DView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DProblemTxtHeaderView : DView

@property (nonatomic,strong)UIImageView *bgImageView;

@property (nonatomic,strong)UIImageView *segmentationImageView;

@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,strong)UIView *introduceView;

@property (nonatomic,strong)UILabel *introduceLabel;

@property (nonatomic,strong)UIButton *backButton;

@end

NS_ASSUME_NONNULL_END
