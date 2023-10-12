//
//  SegmentViewController.h
//  ZARA
//
//  Created by Eleven on 2023/7/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SegmentViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic, strong) UISegmentedControl *segment;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *page;

@end

NS_ASSUME_NONNULL_END
