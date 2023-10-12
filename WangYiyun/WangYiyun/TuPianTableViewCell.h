//
//  TuPianTableViewCell.h
//  WangYiyun
//
//  Created by Eleven on 2023/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TuPianTableViewCell : UITableViewCell<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIPageControl *page;

@end

NS_ASSUME_NONNULL_END
