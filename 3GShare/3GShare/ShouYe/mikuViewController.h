//
//  mikuViewController.h
//  3GShare
//
//  Created by Eleven on 2023/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface mikuViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) int dianZanShu;
@property (nonatomic) BOOL buttonValue;

@end

NS_ASSUME_NONNULL_END
