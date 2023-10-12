//
//  VView.m
//  MVCDemo
//
//  Created by Eleven on 2023/9/7.
//

#import "VView.h"

@implementation VView

- (void)viewInit {
    self.backgroundColor = [UIColor whiteColor];
    
    self.zhangHaoTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    self.zhangHaoTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.zhangHaoTextField.placeholder = @"账号";
    [self addSubview:self.zhangHaoTextField];
    
    self.miMaTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 350, 200, 50)];
    self.miMaTextField.placeholder = @"密码";
    self.miMaTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.miMaTextField];
    
    self.dengLuButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.dengLuButton setTitle:@"登录" forState:UIControlStateNormal];
    self.dengLuButton.frame = CGRectMake(100, 500, 90, 80);
    [self addSubview:self.dengLuButton];
    
    self.zhuCeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.zhuCeButton setTitle:@"注册" forState:UIControlStateNormal];
    self.zhuCeButton.frame = CGRectMake(200, 500, 90, 80);
    [self addSubview:self.zhuCeButton];
}

@end
