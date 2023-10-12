//
//  FindViewController.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/19.
//

#import "FindViewController.h"

@interface FindViewController ()

@property (nonatomic, strong) UITextField *text;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.text = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 300, 50)];
    
    UIBarButtonItem *buttonBack = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_return.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];
    
    self.navigationItem.leftBarButtonItem = buttonBack;
    
    [self.view addSubview:self.text];
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
