//
//  AppDelegate.h
//  DProgrambook
//
//  Created by titi on 2019/10/8.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDTSplashAd.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,GDTSplashAdDelegate>

+(instancetype)sharedAppDelegate;

-(void)enterMainUI;

@property (strong, nonatomic) UIWindow *window;


@end

