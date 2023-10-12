//
//  WoDeViewController.h
//  WangYiyun
//
//  Created by Eleven on 2023/7/17.
//

#import <UIKit/UIKit.h>
#import "ShouYeViewController.h"

NS_ASSUME_NONNULL_BEGIN


@interface WoDeViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,SwitchDeValue>

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) UISegmentedControl *segment;
@property (nonatomic) BOOL switchOn;

- (void)SwitchMode:(BOOL)switchValueOn;

@end

NS_ASSUME_NONNULL_END
