//
//  DPostModel.h
//  DProgrambook
//
//  Created by titi on 2019/10/22.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import "DBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DPostModel : DBaseModel
//内容
@property (nonatomic,strong) NSString *content;
//作者
@property (nonatomic,strong) NSString * nickName;
//作者ID
@property (nonatomic,strong) NSString *authorID;
//时间
@property (nonatomic,strong) NSString *dateTime;
//头像
@property (nonatomic,strong) NSString *userLogo;
//是否匿名
@property (nonatomic,strong) NSString *isAnonymous;

/**
 *     BmobObject对象的id
 */
@property(nonatomic,copy)NSString *objectId;
//cell 的高度
@property (nonatomic) CGFloat cellHeight;
//获取高度
-(void)calculateHeight;
@end

NS_ASSUME_NONNULL_END
