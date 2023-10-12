//
//  B_ViewController.m
//  多界面传值
//
//  Created by Eleven on 2023/8/4.
//

#import "B_ViewController.h"
#import "A_ViewController.h"
#import "C_ViewController.h"

@interface B_ViewController ()

@end

@implementation B_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *BLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 200, 50)];
    BLabel.text = self.aToBStr;
    [self.view addSubview:BLabel];

    UIButton *goCbutton = [UIButton buttonWithType:UIButtonTypeSystem];
    [goCbutton setTitle:@"跳转到C界面" forState:UIControlStateNormal];
    goCbutton.frame = CGRectMake(100, 450, 100, 50);
    [goCbutton addTarget:self action:@selector(pressGoC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goCbutton];
}

- (void)pressGoC {
    C_ViewController *cView = [[C_ViewController alloc] init];
    [self.navigationController pushViewController:cView animated:YES];
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
