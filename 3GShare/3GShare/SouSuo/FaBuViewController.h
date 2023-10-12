//
//  FaBuViewController.h
//  3GShare
//
//  Created by Eleven on 2023/7/26.
//

#import <UIKit/UIKit.h>
#import "PhotoViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FaBuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, PhotoDelegate>

@property (nonatomic, strong) UIButton *buttonImage;
@property (nonatomic, strong) UITableView *tabView;
@property (nonatomic, strong) UIImage *imagePhoto;
@property (nonatomic, strong) UIButton *buttonTable;
@property (nonatomic) NSString *stringTable;
@property (nonatomic, strong) UILabel *labelTabel;
@property (nonatomic) NSInteger num;
@property (nonatomic, strong) UITextField *textFieldBiaoTi;
@property (nonatomic, strong) UITextField *textFieldNeiRong;
@property (nonatomic, strong) UIScrollView *scroll;

- (void)photoMode: (UIImage*)image numMode:(NSInteger) num;

@end

NS_ASSUME_NONNULL_END
