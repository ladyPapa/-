//
//  DProblemTxtCellTableViewCell.h
//  DProgrambook
//
//  Created by titi on 2019/10/16.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import "DTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DProblemTxtCell : DTableViewCell

@property (nonatomic,strong) UILabel *questionLabel;

@property (nonatomic,strong) UILabel *answerLabel;

@property (nonatomic,strong) UIView *bgView;
@end

NS_ASSUME_NONNULL_END
