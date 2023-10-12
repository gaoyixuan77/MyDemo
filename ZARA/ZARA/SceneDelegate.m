//
//  SceneDelegate.m
//  ZARA
//
//  Created by Eleven on 2023/6/12.
//

#import "SceneDelegate.h"
#import "RootViewController.h"
#import "SecondViewController.h"
#import "SegmentViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.window.frame = [UIScreen mainScreen].bounds;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 300, 100)];
    label.text = @"ZARA";
    label.font = [UIFont systemFontOfSize:84];
    label.textColor = [UIColor whiteColor];
    
    RootViewController *root = [[RootViewController alloc] init];
    SecondViewController *vc2 = [[SecondViewController alloc] init];
    SegmentViewController *vc4 = [[SegmentViewController alloc] init];
    
    vc4.view.backgroundColor = [UIColor whiteColor];
    
    root.title = @"首页";
    vc2.title = @"我的";
    vc4.title = @"分类";
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc2];
    
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:root, vc4, nav, nil];
    
    UITabBarController *_tabBar = [[UITabBarController alloc] init];
    _tabBar.tabBar.backgroundColor = [UIColor whiteColor];
    
    [root.view addSubview:label];
    
    self.window.rootViewController = _tabBar;
    _tabBar.viewControllers = arr;
    
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
