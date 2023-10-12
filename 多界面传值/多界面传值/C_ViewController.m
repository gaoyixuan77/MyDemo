//
//  C_ViewController.m
//  多界面传值
//
//  Created by Eleven on 2023/8/4.
//

#import "C_ViewController.h"

@interface C_ViewController ()

@end

@implementation C_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *CToADictionary = [NSDictionary dictionaryWithObject:@"从C传来的值（通知）" forKey:@"label"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CToAString" object:nil userInfo:CToADictionary];
    
    
    UIButton *goAbutton = [UIButton buttonWithType:UIButtonTypeSystem];
    [goAbutton setTitle:@"返回到A界面" forState:UIControlStateNormal];
    goAbutton.frame = CGRectMake(100, 450, 100, 50);
    [goAbutton addTarget:self action:@selector(pressGoA) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goAbutton];
}

- (void)pressGoA {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
