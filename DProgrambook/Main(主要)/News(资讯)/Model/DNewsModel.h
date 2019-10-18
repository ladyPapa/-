//
//  DNewsModel.h
//  DProgrambook
//
//  Created by titi on 2019/10/17.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import "DBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNewsModel : DBaseModel

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *captions;
@property (nonatomic,strong) NSArray *article;

@property (nonatomic,strong) NSString *about;
//cell 高度
@property (nonatomic) CGFloat cellHeight;

-(void)calculateHeight;
@end

NS_ASSUME_NONNULL_END
