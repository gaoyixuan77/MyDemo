//
//  EnrollViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/21.
//

#import "EnrollViewController.h"
#import "LoginViewController.h"


@interface EnrollViewController ()

@property (nonatomic, strong) UIButton *buttonConfirm;
@property (nonatomic, strong) UIScrollView *scroll;

@end

@implementation EnrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"A");
    
    self.dictionary = [[NSMutableDictionary alloc] init];
    
    self.scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scroll.contentSize = CGSizeMake(394, 1252);
    self.scroll.scrollEnabled = NO;
    
    self.view.backgroundColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login.jpg"]];
    imageView.frame = CGRectMake(140, 100, 110, 110);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(130, 220, 250, 50)];
    label.textColor = [UIColor whiteColor];
    label.text = @"SHARE";
    label.font = [UIFont systemFontOfSize:42];
    [self.scroll addSubview:label];
    [self.scroll addSubview:imageView];
    
    self.textFieldNum = [[UITextField alloc] initWithFrame:CGRectMake(45, 300, 300, 40)];
    self.textFieldKey = [[UITextField alloc] initWithFrame:CGRectMake(45, 360, 300, 40)];
    self.textFieldrepeat = [[UITextField alloc] initWithFrame:CGRectMake(45, 420, 300, 40)];
    self.buttonConfirm = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.textFieldNum.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldKey.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldrepeat.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldKey.secureTextEntry = YES;
    self.textFieldrepeat.secureTextEntry = YES;

    
    self.textFieldNum.placeholder = @"账号";
    self.textFieldKey.placeholder = @"密码";
    self.textFieldrepeat.placeholder = @"再次输入密码";
    
    self.buttonConfirm.frame = CGRectMake(100, 500, 200, 40);
    [self.buttonConfirm setTitle:@"注册" forState:UIControlStateNormal];
    self.buttonConfirm.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonConfirm.layer.borderWidth = 1.0f;
    self.buttonConfirm.tintColor = [UIColor whiteColor];
    [self.buttonConfirm addTarget:self action:@selector(pressConfirm) forControlEvents:UIControlEventTouchUpInside];
    
    self.textFieldrepeat.delegate = self;
    self.textFieldKey.delegate = self;
    self.textFieldNum.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap)];

    [self.scroll addSubview:self.textFieldrepeat];
    [self.scroll addSubview:self.textFieldKey];
    [self.scroll addSubview:self.textFieldNum];
    [self.scroll addSubview:self.buttonConfirm];
    [self.view addSubview:self.scroll];
    [self.view addGestureRecognizer:tap];

}

- (void)pressTap {
    [self.textFieldrepeat resignFirstResponder];
    [self.textFieldKey resignFirstResponder];
    [self.textFieldNum resignFirstResponder];
    [self.scroll setContentOffset:CGPointMake(0, 0) animated:true];

}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.scroll setContentOffset:CGPointMake(0, 150) animated:true];
}

- (void)pressConfirm {
    if (self.textFieldNum.text.length > 10 || self.textFieldKey.text.length > 10) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"账号或密码不能超过10位" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cofirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:cofirm];
        [self presentViewController:alert animated:YES completion:nil];
    } else if ([self.textFieldNum.text isEqual:@" "] || [self.textFieldKey.text isEqual:@" "] || self.textFieldNum.text.length == 0 || self.textFieldKey.text.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"账号或密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cofirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:cofirm];
        [self presentViewController:alert animated:YES completion:nil];
    } else if (![self.textFieldKey.text isEqual:self.textFieldrepeat.text]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"两次输入密码不一致" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cofirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:cofirm];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        NSLog(@"%lu", sizeof(self.textFieldNum.text));
        NSString *strNum = self.textFieldNum.text;
        NSString *strKey = self.textFieldKey.text;
        NSDictionary *dict = [NSDictionary dictionaryWithObject:strKey forKey:strNum];
        [self.dictionary addEntriesFromDictionary:dict];
        [self.delegate stringMode:self.dictionary];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (range.location > 10) {
        return NO;
    } else {
       
        return YES;
    }
}


@end
