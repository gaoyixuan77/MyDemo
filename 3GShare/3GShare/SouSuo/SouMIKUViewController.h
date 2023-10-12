//
//  SouMIKUViewController.h
//  3GShare
//
//  Created by Eleven on 2023/7/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SouMIKUViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic) NSString *strSouSuo;

@end

NS_ASSUME_NONNULL_END
