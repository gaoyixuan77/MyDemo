//
//  SceneDelegate.m
//  3GShare
//
//  Created by Eleven on 2023/7/20.
//

#import "SceneDelegate.h"
#import "StartImageViewController.h"
#import "LoginViewController.h"
#import "ShouYeViewController.h"
#import "SouSuoViewController.h"
#import "HuoDongViewController.h"
#import "WenZhangViewController.h"
#import "GeRenXinXiViewController.h"

@interface SceneDelegate ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.window.frame = [UIScreen mainScreen].bounds;
    
    StartImageViewController *start = [[StartImageViewController alloc] init];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(pressStart) userInfo:nil repeats:NO];
    
    self.window.rootViewController = start;
    [self.window makeKeyAndVisible];
}

- (void)pressStart {
    LoginViewController *login = [[LoginViewController alloc] init];
    
    UINavigationController *navLogin = [[UINavigationController alloc] initWithRootViewController:login];
    
    login.tabBarDelegate = self;
    self.window.rootViewController = navLogin;
    
    [self.window makeKeyAndVisible];
}

- (void)tabBarMode:(UITabBarController *)tabBar {
    self.window.rootViewController = tabBar;
    tabBar.delegate = self;
    [self.window makeKeyAndVisible];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"bbb");
    
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
