//
//  OtherSouSuoViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/24.
//

#import "OtherSouSuoViewController.h"
#import "SouMIKUViewController.h"

@interface OtherSouSuoViewController ()

@end

@implementation OtherSouSuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:240/255.0f green:240/255.0f blue:246/255.0f alpha:1];
    
    UIBarButtonItem *returnButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_return.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];
    [returnButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = returnButton;
    self.navigationItem.title = @"搜索";

    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 110, 374, 50)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.backgroundColor = [UIColor whiteColor];
    self.textField.text = self.strSouSuo;
    self.textField.delegate = self;
    self.textField.placeholder = @"搜索 用户名/作品分类 文章";
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap)];
    [self.view addGestureRecognizer:tap];
    
    [self.view addSubview:self.textField];
}

- (void) pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([self.textField.text isEqual: @"miku"]) {
        SouMIKUViewController *miku = [[SouMIKUViewController alloc] init];
        miku.strSouSuo = self.textField.text;
        [self.navigationController pushViewController:miku animated:YES];
    } else {
        OtherSouSuoViewController *other = [[OtherSouSuoViewController alloc] init];
        other.strSouSuo = self.textField.text;
        [self.navigationController pushViewController:other animated:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];
    return YES;
}

- (void)pressTap {
    [self.textField resignFirstResponder];
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
