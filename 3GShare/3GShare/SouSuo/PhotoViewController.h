//
//  PhotoViewController.h
//  3GShare
//
//  Created by Eleven on 2023/7/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol PhotoDelegate <NSObject>

- (void)photoMode: (UIImage*)image numMode:(NSInteger) num;

@end

@interface PhotoViewController : UIViewController

@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic) NSInteger Atag;
@property (nonatomic, assign) id<PhotoDelegate> delegate;
@property (nonatomic, assign) int num;

@end

NS_ASSUME_NONNULL_END
