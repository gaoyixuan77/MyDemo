//
//  JiBenZiLiaoViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import "JiBenZiLiaoViewController.h"

@interface JiBenZiLiaoViewController ()

@end

@implementation JiBenZiLiaoViewController

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
    self.title = @"基本资料";

    
    UILabel *labelHead = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 50, 30)];
    labelHead.text = @"头像";
    labelHead.font = [UIFont systemFontOfSize:20];
    
    UILabel *labelID = [[UILabel alloc] initWithFrame:CGRectMake(10, 210, 50, 30)];
    labelID.text = @"昵称";
    labelID.font = [UIFont systemFontOfSize:20];
    
    UILabel *labelQianMing = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 50, 30)];
    labelQianMing.text = @"签名";
    labelQianMing.font = [UIFont systemFontOfSize:20];
    
    UILabel *labelSex = [[UILabel alloc] initWithFrame:CGRectMake(10, 290, 50, 30)];
    labelSex.text = @"性别";
    labelSex.font = [UIFont systemFontOfSize:20];
    
    UILabel *labelEmail = [[UILabel alloc] initWithFrame:CGRectMake(10, 330, 50, 30)];
    labelEmail.text = @"邮箱";
    labelEmail.font = [UIFont systemFontOfSize:20];
    
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"miku.jpg"]];
    imageV.frame = CGRectMake(80, 120, 75, 75);
    
    UILabel *labelid = [[UILabel alloc] initWithFrame:CGRectMake(80, 210, 330, 30)];
    labelid.text = @"Share小V";
    
    UILabel *labelqianming = [[UILabel alloc] initWithFrame:CGRectMake(80, 250, 330, 30)];
    labelqianming.text = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    
    self.Boy = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.Boy setImage:[UIImage imageNamed:@"xuanzekuangmoren.png"] forState:UIControlStateNormal];
    [self.Boy setImage:[UIImage imageNamed:@"xuanzekuangxuanzhong.png"] forState:UIControlStateSelected];
    self.Boy.frame = CGRectMake(80, 295, 20, 20);
    [self.Boy addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.Girl = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.Girl setImage:[UIImage imageNamed:@"xuanzekuangmoren.png"] forState:UIControlStateNormal];
    [self.Girl setImage:[UIImage imageNamed:@"xuanzekuangxuanzhong.png"] forState:UIControlStateSelected];
    self.Girl.frame = CGRectMake(140, 295, 20, 20);
    [self.Girl addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.sexSelectBoy) {
        self.Boy.selected = YES;
        self.Girl.selected = NO;
    } else {
        self.Girl.selected = YES;
        self.Boy.selected = NO;
    }
    
    UILabel *labelemail = [[UILabel alloc] initWithFrame:CGRectMake(80, 330, 330, 30)];
    labelemail.text = @"181xxxx926@qq.com";
    
    UILabel *labelBoy = [[UILabel alloc] initWithFrame:CGRectMake(100, 295, 20, 20)];
    labelBoy.text = @"男";
    UILabel *labelGirl = [[UILabel alloc] initWithFrame:CGRectMake(160, 295, 20, 20)];
    labelGirl.text = @"女";
    
    [self.view addSubview:labelid];
    [self.view addSubview:labelID];
    [self.view addSubview:labelqianming];
    [self.view addSubview:labelSex];
    [self.view addSubview:labelHead];
    [self.view addSubview:labelEmail];
    [self.view addSubview:labelQianMing];
    [self.view addSubview:labelemail];
    [self.view addSubview:self.Boy];
    [self.view addSubview:self.Girl];
    [self.view addSubview:imageV];
    [self.view addSubview:labelBoy];
    [self.view addSubview:labelGirl];
}

- (void) pressButton: (UIButton*) button {
    if (button == self.Boy) {
        if (self.Boy.selected == NO) {
            self.Boy.selected = YES;
            self.Girl.selected = NO;
        }
    }
    if (button == self.Girl) {
        if (self.Girl.selected == NO) {
            self.Girl.selected = YES;
            self.Boy.selected = NO;
        }
    }
}

- (void)pressBack {
    [self.delegate sexMode:(BOOL*)self.Boy.isSelected];
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
