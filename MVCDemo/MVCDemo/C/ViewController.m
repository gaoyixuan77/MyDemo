//
//  ViewController.m
//  MVCDemo
//
//  Created by Eleven on 2023/9/7.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vView = [[VView alloc] initWithFrame:self.view.bounds];
    [self.vView viewInit];
    [self.vView.zhuCeButton addTarget:self action:@selector(pressZhuCeTiaoZhuan) forControlEvents:UIControlEventTouchUpInside];
    [self.vView.dengLuButton addTarget:self action:@selector(pressDengLu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.vView];
    
    self.mModel = [[MModel alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dengLu:) name:@"dengLu" object:nil];
}

- (void)pressZhuCeTiaoZhuan {
    TiaoZhuanViewController *tiaoZhuan = [[TiaoZhuanViewController alloc] init];
    [self presentViewController:tiaoZhuan animated:YES completion:nil];
    tiaoZhuan.mModel = self.mModel;
}

- (void)pressDengLu {
    [self.mModel dengLu];
}

- (void)dengLu: (NSNotification*)notification {
    NSString *zhangHaoStr = [NSString stringWithFormat:@"%@",self.vView.zhangHaoTextField.text];
    if ([self.vView.miMaTextField.text isEqual: notification.userInfo[zhangHaoStr]]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"登录成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [self presentViewController:alert animated:YES completion:nil];
        [alert addAction:action];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"登录失败" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [self presentViewController:alert animated:YES completion:nil];
        [alert addAction:action];
    }
}

@end
