//
//  TiaoZhuanViewController.h
//  MVCDemo
//
//  Created by Eleven on 2023/9/8.
//

#import <UIKit/UIKit.h>
#import "VzhuCeView.h"
#import "MModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TiaoZhuanViewController : UIViewController

@property (nonatomic, strong) VzhuCeView *zhuCeView;
@property (nonatomic, strong) MModel *mModel;

@end

NS_ASSUME_NONNULL_END
