//
//  ViewController.h
//  MVCDemo
//
//  Created by Eleven on 2023/9/7.
//

#import <UIKit/UIKit.h>
#import "MModel.h"
#import "VView.h"
#import "TiaoZhuanViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController

@property (nonatomic, strong) MModel *mModel;
@property (nonatomic, strong) VView *vView;
@end

NS_ASSUME_NONNULL_END
