//
//  VView.h
//  MVCDemo
//
//  Created by Eleven on 2023/9/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VView : UIView

@property (nonatomic, strong) UITextField *zhangHaoTextField;
@property (nonatomic, strong) UITextField *miMaTextField;
@property (nonatomic, strong) UIButton *dengLuButton;
@property (nonatomic, strong) UIButton *zhuCeButton;

- (void)viewInit;

@end

NS_ASSUME_NONNULL_END
