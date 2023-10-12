//
//  LoginViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/20.
//

#import "LoginViewController.h"
#import "EnrollViewController.h"
#import "ShouYeViewController.h"
#import "SouSuoViewController.h"
#import "HuoDongViewController.h"
#import "WenZhangViewController.h"
#import "GeRenXinXiViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) UIButton *buttonLogin;
@property (nonatomic, strong) UIButton *buttonEnroll;
@property (nonatomic, strong) UIButton *buttonZiDong;
@property (nonatomic, strong) UILabel *labelZiDong;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dict = [[NSMutableDictionary alloc] init];
    
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1];
    
    self.scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scroll.contentSize = CGSizeMake(394, 1252);
    self.scroll.scrollEnabled = NO;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login.jpg"]];
    imageView.frame = CGRectMake(140, 100, 110, 110);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(130, 220, 250, 50)];
    label.textColor = [UIColor whiteColor];
    label.text = @"SHARE";
    label.font = [UIFont systemFontOfSize:42];
    [self.scroll addSubview:label];
    [self.scroll addSubview:imageView];
    
    self.textFieldNum = [[UITextField alloc] initWithFrame:CGRectMake(45, 300, 300, 40)];
    self.textFieldNum.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldNum.placeholder = @"账号";
    
    self.textFieldKey = [[UITextField alloc] initWithFrame:CGRectMake(45, 360, 300, 40)];
    self.textFieldKey.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldKey.placeholder = @"密码";
    self.textFieldKey.secureTextEntry = YES;
    
    self.buttonLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonLogin setTitle:@"登录" forState:UIControlStateNormal];
    self.buttonLogin.frame = CGRectMake(55, 430, 120, 30);
    self.buttonLogin.layer.borderWidth = 1.0f;
    self.buttonLogin.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.buttonLogin addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    
    self.buttonEnroll = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonEnroll setTitle:@"注册" forState:UIControlStateNormal];
    self.buttonEnroll.frame = CGRectMake(217, 430, 120, 30);
    self.buttonEnroll.layer.borderWidth = 1.0f;
    self.buttonEnroll.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.buttonEnroll addTarget:self action:@selector(pressEnroll) forControlEvents:UIControlEventTouchUpInside];
    
    self.buttonZiDong = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonZiDong setImage:[UIImage imageNamed:@"xuanzekuangmoren.png"] forState:UIControlStateNormal];
    [self.buttonZiDong addTarget:self action:@selector(pressSelect) forControlEvents:UIControlEventTouchUpInside];
    
    [self.buttonZiDong setImage:[UIImage imageNamed:@"xuanzekuangxuanzhong.png"] forState:UIControlStateSelected];
    self.buttonZiDong.frame = CGRectMake(50, 480, 20, 20);
    
    self.labelZiDong = [[UILabel alloc] initWithFrame:CGRectMake(75, 480, 80, 20)];
    self.labelZiDong.text = @"自动登录";
    
    self.textFieldKey.delegate = self;
    self.textFieldNum.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap)];
    
    [self.scroll addSubview:self.textFieldKey];
    [self.scroll addSubview:self.textFieldNum];
    [self.scroll addSubview:self.buttonLogin];
    [self.scroll addSubview:self.buttonEnroll];
    [self.scroll addSubview:self.buttonZiDong];
    [self.scroll addSubview:self.labelZiDong];
    [self.view addSubview:self.scroll];
    [self.view addGestureRecognizer:tap];
}

- (void)pressSelect {
    if (self.buttonZiDong.selected == NO) {
        self.buttonZiDong.selected = YES;
    } else {
        self.buttonZiDong.selected = NO;
    }
}

- (void)pressTap {
    [self.textFieldKey resignFirstResponder];
    [self.textFieldNum resignFirstResponder];
    [self.scroll setContentOffset:CGPointMake(0, 0) animated:true];

}

- (void)pressEnroll {
    EnrollViewController *enroll = [[EnrollViewController alloc] init];
    enroll.delegate = self;
    [self.navigationController pushViewController:enroll animated:YES];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.scroll setContentOffset:CGPointMake(0, 100) animated:true];
}

- (void)pressLogin {
    self.stringKey = [self.dict valueForKey:self.textFieldNum.text];
    if ((self.stringKey != nil) && [self.textFieldKey.text isEqual: self.stringKey]) {
        ShouYeViewController *shouye = [[ShouYeViewController alloc] init];
        SouSuoViewController *souSuo = [[SouSuoViewController alloc] init];
        WenZhangViewController *wenZhang = [[WenZhangViewController alloc] init];
        HuoDongViewController *huoDong = [[HuoDongViewController alloc] init];
        GeRenXinXiViewController *geRen = [[GeRenXinXiViewController alloc] init];
        
        UINavigationController *navShouYe = [[UINavigationController alloc] initWithRootViewController:shouye];
        UINavigationController *navSouSuo = [[UINavigationController alloc] initWithRootViewController:souSuo];
        UINavigationController *navWenZhang = [[UINavigationController alloc] initWithRootViewController:wenZhang];
        UINavigationController *navHuoDong = [[UINavigationController alloc] initWithRootViewController:huoDong];
        UINavigationController *navGeRen = [[UINavigationController alloc] initWithRootViewController:geRen];
        
        UITabBarController *tabBar = [[UITabBarController alloc] init];
        
        shouye.title = @"SHARE";
        souSuo.title = @"搜索";
        wenZhang.title = @"文章";
        geRen.title = @"个人信息";
        
        UITabBarItem *tabBarShouYe = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"56.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button1_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        shouye.tabBarItem = tabBarShouYe;
        
        UITabBarItem *tabBarSouSuo = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button2_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button2_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        souSuo.tabBarItem = tabBarSouSuo;
        
        
        UITabBarItem *tabBarWenZhang = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button3_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button3_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        wenZhang.tabBarItem = tabBarWenZhang;
        
        UITabBarItem *tabBarHuoDong = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button4_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button4_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        huoDong.tabBarItem = tabBarHuoDong;
        
        UITabBarItem *tabBarGeRen = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button5_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button5_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        geRen.tabBarItem = tabBarGeRen;

        
        tabBar.tabBar.tintColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1];
        
        NSArray *arr = [NSArray arrayWithObjects:navShouYe, navSouSuo, navWenZhang, navHuoDong, navGeRen, nil];
        tabBar.viewControllers = arr;
        
        [self.tabBarDelegate tabBarMode:tabBar];
        
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"账号或密码错误，请重试" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cofirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:cofirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
}


- (void)stringMode:(NSMutableDictionary*)dictionary {
    [self.dict addEntriesFromDictionary:dictionary];
    NSLog(@"%@",self.dict);
}


@end
