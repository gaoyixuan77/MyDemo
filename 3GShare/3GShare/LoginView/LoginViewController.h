//
//  LoginViewController.h
//  3GShare
//
//  Created by Eleven on 2023/7/20.
//

#import <UIKit/UIKit.h>
#import "EnrollViewController.h"

NS_ASSUME_NONNULL_BEGIN
@protocol TabBarDelegate <NSObject>

- (void)tabBarMode: (UITabBarController*) tabBar;

@end


@interface LoginViewController : UIViewController<UITextFieldDelegate, StringDelegate, UITabBarDelegate>

@property (nonatomic, strong) UITextField *textFieldNum;
@property (nonatomic, strong) UITextField *textFieldKey;
@property (nonatomic) NSString *stringNum;
@property (nonatomic) NSString *stringKey;
@property (nonatomic) NSMutableDictionary *dict;
@property (nonatomic, assign) id<TabBarDelegate> tabBarDelegate;

- (void)stringMode:(NSMutableDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
