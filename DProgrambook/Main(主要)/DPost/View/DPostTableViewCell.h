//
//  DPostTableViewCell.h
//  DProgrambook
//
//  Created by titi on 2019/10/22.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPostModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,DPushViewType) {
    DPushViewTypeVideo = 1,
    DPushViewTypeAudio,
};

@interface DHotRecommendView : DView
//视图
@property (strong,nonatomic) UIImageView *imageView;
//标题
@property (strong,nonatomic) UILabel *titleLabel;

@end

@interface DHotRecommendCell : DTableViewCell
//视频视图
@property (strong,nonatomic) DHotRecommendView *videoView;
//音频视图
@property (strong,nonatomic) DHotRecommendView *audioView;

@property (nonatomic,strong) void (^clickPushView) (DPushViewType type);
@end


@interface DPostTableViewCell : DTableViewCell

@property (nonatomic,strong) UIImageView *userLogoImageView;

@property (nonatomic,strong) UILabel *nickNameLabel;

@property (nonatomic,strong) UILabel *timeLabel;

@property (nonatomic,strong) UILabel *contentLabel;


@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) DPostModel *model;
-(void)setData:(DPostModel *)model;
@end

NS_ASSUME_NONNULL_END
