//
//  RootViewController.h
//  ZARA
//
//  Created by Eleven on 2023/6/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RootViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *ScrollView;
@property (nonatomic, strong) UIButton *btnl;
@property (nonatomic, strong) UIButton *btnr;
@property (nonatomic, strong) UIPageControl *page;


@end

NS_ASSUME_NONNULL_END
