//
//  DProblemModel.h
//  DProgrambook
//
//  Created by titi on 2019/10/14.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import "DBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DProblemModel : DBaseModel
//id
@property (nonatomic,strong) NSString *problemID;
//title
@property (nonatomic,strong) NSString *title;
//介绍
@property (nonatomic,strong) NSString *introduce;
//用法
@property (nonatomic,strong) NSString *directions;
//称号
@property (nonatomic,strong) NSString *donor;
//封面
@property (nonatomic,strong) NSString *backgroundImg;


@end

NS_ASSUME_NONNULL_END
