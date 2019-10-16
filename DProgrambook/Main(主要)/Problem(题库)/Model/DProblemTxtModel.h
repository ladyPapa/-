//
//  DProblemTxtModel.h
//  DProgrambook
//
//  Created by titi on 2019/10/16.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import "DBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DProblemTxtModel : DBaseModel
//问题
@property (nonatomic,strong) NSString *question;
//答案
@property (nonatomic,strong) NSString *answer;
//cell 高度
@property (nonatomic) CGFloat cellHeight;
//获取高度
-(void)calculateHeight;
@end

NS_ASSUME_NONNULL_END
