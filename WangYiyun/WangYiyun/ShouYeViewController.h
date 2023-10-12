//
//  ShouYeViewController.h
//  WangYiyun
//
//  Created by Eleven on 2023/7/17.
//

#import <UIKit/UIKit.h>
#import "NightTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SwitchDeValue <NSObject>

- (void)SwitchMode: (BOOL) switchValueOn;

@end

@interface ShouYeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
}

@property (nonatomic, strong) UITableView *tab;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) BOOL SwitchValue;
@property (nonatomic, weak) id<SwitchDeValue> delegate;

@end

NS_ASSUME_NONNULL_END
