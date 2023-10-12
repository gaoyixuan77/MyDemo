//
//  MiMaViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import "MiMaViewController.h"

@interface MiMaViewController ()

@end

@implementation MiMaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    appearance.backgroundColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1];
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    self.navigationController.navigationBar.standardAppearance = appearance;
    UIBarButtonItem *barbutton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];
    [barbutton setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = barbutton;
    self.title = @"修改密码";

    
    UILabel *labelOld = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 80, 30)];
    labelOld.text = @"旧密码";
    UILabel *labelNew = [[UILabel alloc] initWithFrame:CGRectMake(10, 210, 80, 30)];
    labelNew.text = @"新密码";
    UILabel *labelRepeat = [[UILabel alloc] initWithFrame:CGRectMake(10, 270, 80, 30)];
    labelRepeat.text = @"确认密码";
    
    self.textFieldOld = [[UITextField alloc] initWithFrame:CGRectMake(90, 145, 320, 40)];
    self.textFieldNew = [[UITextField alloc] initWithFrame:CGRectMake(90, 205, 320, 40)];
    self.textFieldRepeat = [[UITextField alloc] initWithFrame:CGRectMake(90, 265, 320, 40)];
    self.textFieldOld.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldNew.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldRepeat.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldOld.secureTextEntry = YES;
    self.textFieldNew.secureTextEntry = YES;
    self.textFieldRepeat.secureTextEntry = YES;
    self.textFieldOld.placeholder = @"原密码";
    self.textFieldNew.placeholder = @"新密码";
    self.textFieldRepeat.placeholder = @"再次输入新密码";
    
    self.buttonUP = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonUP.frame = CGRectMake(140, 370, 100, 30);
    [self.buttonUP setTitle:@"提交" forState:UIControlStateNormal];
    [self.buttonUP setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.buttonUP setBackgroundColor:[UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1]];
    [self.buttonUP addTarget:self action:@selector(pressUP) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:labelOld];
    [self.view addSubview:labelNew];
    [self.view addSubview:labelRepeat];
    [self.view addSubview:self.textFieldOld];
    [self.view addSubview:self.textFieldNew];
    [self.view addSubview:self.textFieldRepeat];
    [self.view addSubview:self.buttonUP];
}

- (void)pressUP {
    if (![self.textFieldNew.text isEqual:self.textFieldRepeat.text]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"两次密码输入不一致" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"修改成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
