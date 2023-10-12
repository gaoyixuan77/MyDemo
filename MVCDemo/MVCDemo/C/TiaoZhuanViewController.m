//
//  TiaoZhuanViewController.m
//  MVCDemo
//
//  Created by Eleven on 2023/9/8.
//

#import "TiaoZhuanViewController.h"

@interface TiaoZhuanViewController ()

@end

@implementation TiaoZhuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.zhuCeView = [[VzhuCeView alloc] initWithFrame:self.view.bounds];
    [self.zhuCeView viewInit];
    [self.zhuCeView.zhuCeButton addTarget:self action:@selector(pressZhuCe) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.zhuCeView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pressZhuCe:) name:@"zhuCe" object:nil];
}

- (void)pressZhuCe {
    [self.mModel zhuCe:self.zhuCeView.zhangHaoTextField.text :self.zhuCeView.miMaTextField.text];
}

- (void)pressZhuCe: (NSNotification*)notification {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注册成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
    [self presentViewController:alert animated:YES completion:nil];
    [alert addAction:action];
    
}

@end
