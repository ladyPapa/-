//
//  AppDelegate.m
//  DProgrambook
//
//  Created by titi on 2019/10/8.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import "AppDelegate.h"
#import <BmobSDK/Bmob.h>
#import <Bugly/Bugly.h>
#import "DTabBarViewController.h"
#import "DLoginViewController.h"
#import <UMSocialCore/UMSocialCore.h>

@interface AppDelegate ()
@property (retain,nonatomic) GDTSplashAd *splash;
@property (retain,nonatomic) UIView *bottomView;
@end

@implementation AppDelegate

+ (instancetype)sharedAppDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

//应用将要完成启动
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions{
    
    //云服务器SDK
    [Bmob registerWithAppKey:BmobAppkey];
    //腾讯bug收集
    [Bugly startWithAppId:BuglyAppID];
    //第三方分享
    [self initializeShareSDK];
    //推送
//    [self initializePushSDK];
    //广点通
//    [self initializeGdtSDK];
    return YES;
}

//应用完成启动
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[DTableViewController alloc]init];
    [self.window makeKeyWindow];
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    
    BmobUser *bUser = [BmobUser currentUser];
    if(!bUser)
    {
        DLoginViewController *loginVC = [[DLoginViewController alloc] init];
        self.window.rootViewController = loginVC;
        //对象为空时，可打开用户注册界面
    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

// 当应用界面回到活跃Activate状态时
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"%s", __func__);
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    //注册成功后上传Token至服务器
    BmobInstallation  *currentIntallation = [BmobInstallation installation];
    [currentIntallation setDeviceTokenFromData:deviceToken];
    [currentIntallation saveInBackground];
    
}
//分享
-(void)initializeShareSDK{
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WXAppkey appSecret:WXAppSecret redirectURL:@""];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:QQAppkey  appSecret:nil redirectURL:@""];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:WBAppkey  appSecret:WBAppSecret redirectURL:@""];
}
//推送
-(void)initializePushSDK{
    // Override point for customization after application launch.
    //注册推送，iOS 8的推送机制与iOS 7有所不同，这里需要分别设置
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        UIMutableUserNotificationCategory *categorys = [[UIMutableUserNotificationCategory alloc]init];
        //注意：此处的Bundle ID要与你申请证书时填写的一致。
        categorys.identifier=@"com.kevindcw.DStarNews";
        UIUserNotificationSettings *userNotifiSetting = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound) categories:[NSSet setWithObjects:categorys,nil]];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:userNotifiSetting];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }else {
        //注册远程推送
        UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound;
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:myTypes];
    }
    
}

- (void)enterMainUI
{
    self.window.rootViewController = [[DTabBarViewController alloc] init];
}
//广点通广告
-(void)initializeGdtSDK{
    //开屏广告初始化并展示代码
    GDTSplashAd *splash = [[GDTSplashAd alloc] initWithAppId:GDTAppkey placementId:GDTPlacementIdK];
    splash.delegate = self;
    UIImage *splashImage = [UIImage imageNamed:@"SplashNormal"];
    if (isIPhoneXSeries()) {
        splashImage = [UIImage imageNamed:@"SplashX"];
    } else if ([UIScreen mainScreen].bounds.size.height == 480) {
        splashImage = [UIImage imageNamed:@"SplashSmall"];
    }
    splash.backgroundImage = splashImage;
    splash.fetchDelay = 5;//设置开屏拉取时长限制，若超时则不再展示广告
    [splash loadAdAndShowInWindow:self.window];
    self.splash = splash;
    
    
}

/**
 *  开屏广告成功展示
 */
-(void)splashAdSuccessPresentScreen:(GDTSplashAd *)splashAd
{
    NSLog(@"%s",__FUNCTION__);
}
/**
 *  开屏广告展示失败
 */
-(void)splashAdFailToPresent:(GDTSplashAd *)splashAd withError:(NSError *)error
{
    
    
    NSLog(@"%s%@",__FUNCTION__,error);
}
/**
 *  应用进入后台时回调
 *  详解: 当点击下载应用时会调用系统程序打开，应用切换到后台
 */
-(void)splashAdApplicationWillEnterBackground:(GDTSplashAd *)splashAd
{
    
    NSLog(@"%s",__FUNCTION__);
}
/**
 *  开屏广告点击回调
 */
-(void)splashAdClicked:(GDTSplashAd *)splashAd
{
    
    
    NSLog(@"%s",__FUNCTION__);
}
/**
 *  开屏广告将要关闭回调
 */
- (void)splashAdWillClosed:(GDTSplashAd *)splashAd
{
    NSLog(@"%s",__FUNCTION__);
}
/**
 *  开屏广告关闭回调
 */
-(void)splashAdClosed:(GDTSplashAd *)splashAd
{
    NSLog(@"%s",__FUNCTION__);
    _splash = nil;
}
/**
 *  开屏广告点击以后即将弹出全屏广告页
 */
-(void)splashAdWillPresentFullScreenModal:(GDTSplashAd *)splashAd
{
    NSLog(@"%s",__FUNCTION__);
}
/**
 * 开屏广告剩余时间回调
 */
-(void)splashAdDidDismissFullScreenModal:(GDTSplashAd *)splashAd
{
    NSLog(@"%s",__FUNCTION__);
}
@end
