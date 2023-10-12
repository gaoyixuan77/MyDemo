//
//  A_ViewController.m
//  多界面传值
//
//  Created by Eleven on 2023/8/4.
//

#import "A_ViewController.h"
#import "B_ViewController.h"

@interface A_ViewController ()

@end

@implementation A_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.ALabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 200, 50)];
    [self.view addSubview:self.ALabel];
    
    UIButton *goBbutton = [UIButton buttonWithType:UIButtonTypeSystem];
    [goBbutton setTitle:@"跳转到B界面" forState:UIControlStateNormal];
    goBbutton.frame = CGRectMake(100, 450, 100, 50);
    [goBbutton addTarget:self action:@selector(pressGoB) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBbutton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CToAPress:) name:@"CToAString" object:nil];
}

- (void) CToAPress: (NSNotification*) sender {
    self.ALabel.text = sender.userInfo[@"label"];
}

- (void)pressGoB {
    B_ViewController *bView = [[B_ViewController alloc] init];
    bView.aToBStr = @"从A传来的值";
    bView.bToABlock = ^(NSString *bToAStr) {
        self.ALabel.text = bToAStr;
    };
    [self.navigationController pushViewController:bView animated:YES];
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
