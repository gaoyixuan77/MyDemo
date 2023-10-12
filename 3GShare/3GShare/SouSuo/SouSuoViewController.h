//
//  SouSuoViewController.h
//  3GShare
//
//  Created by Eleven on 2023/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SouSuoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@end

NS_ASSUME_NONNULL_END
