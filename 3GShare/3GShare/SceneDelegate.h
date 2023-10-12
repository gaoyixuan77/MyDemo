//
//  SceneDelegate.h
//  3GShare
//
//  Created by Eleven on 2023/7/20.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate, TabBarDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow * window;

- (void)tabBarMode:(UITabBarController *)tabBar;

@end

