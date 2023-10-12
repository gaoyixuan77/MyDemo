//
//  SceneDelegate.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/17.
//

#import "SceneDelegate.h"
#import "ShouYeViewController.h"
#import "WoDeViewController.h"
#import "StartViewController.h"
#import "FindViewController.h"
#import "FaXianViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {

    self.window.frame = [UIScreen mainScreen].bounds;
    
    StartViewController *start = [[StartViewController alloc] init];
    self.window.rootViewController = start;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(pressStart) userInfo:nil repeats:NO];
    
    [self.window makeKeyAndVisible];
    
}

- (void)pressStart {
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    ShouYeViewController *shouye = [[ShouYeViewController alloc] init];
    WoDeViewController *wode = [[WoDeViewController alloc] init];
    FaXianViewController *faxian = [[FaXianViewController alloc] init];
    
    wode.title = @"我的";
    
    UITabBarItem *btn = [[UITabBarItem alloc] initWithTitle:@"设置" image:[UIImage imageNamed:@"shouye.png"] tag:101];
    shouye.tabBarItem = btn;
    UITabBarItem *btn2 = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"icon-home.png"] tag:103];
    wode.tabBarItem = btn2;
    UITabBarItem *btnFaxian = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageNamed:@"compass.png"] tag: 102];
    faxian.tabBarItem = btnFaxian;
    
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:wode];
    UINavigationController *faxianNavigation = [[UINavigationController alloc] initWithRootViewController:faxian];
    
    NSArray *arr = [NSArray arrayWithObjects:faxianNavigation, navigation, shouye, nil];
    tabbar.viewControllers = arr;
    
    tabbar.tabBar.translucent = YES;
    
    
    tabbar.tabBar.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = tabbar;
    tabbar.tabBar.tintColor = [UIColor redColor];
    [self.window makeKeyAndVisible];
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
