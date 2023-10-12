//
//  FaBuViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/26.
//

#import "FaBuViewController.h"
#import "PhotoViewController.h"
#import "SouSuoViewController.h"

@interface FaBuViewController ()

@end

static NSString *str = @"id";
@implementation FaBuViewController

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
    self.title = @"发布内容";

    
    self.buttonImage = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonImage.frame = CGRectMake(10, 100, 250, 220);
    [self.buttonImage setTitle:@"+添加图片" forState:UIControlStateNormal];
    [self.buttonImage setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.buttonImage addTarget:self action:@selector(pressPhoto) forControlEvents:UIControlEventTouchUpInside];
    self.buttonImage.backgroundColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1];
    
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"daohang.png"]];
    imageV.frame = CGRectMake(275, 200, 20, 20);
    
    UILabel *labelDingWei = [[UILabel alloc] initWithFrame:CGRectMake(300, 200, 80, 20)];
    labelDingWei.font = [UIFont systemFontOfSize:10];
    labelDingWei.layer.cornerRadius = 15;
    labelDingWei.layer.backgroundColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1].CGColor;
    labelDingWei.textColor = [UIColor whiteColor];
    labelDingWei.text = @"  陕西省·西安市";
    
    self.tabView = [[UITableView alloc] init];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    self.tabView.frame = CGRectMake(270, 255, 120, 0);
    self.tabView.scrollEnabled = NO;
    [self.tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:str];

    self.labelTabel = [[UILabel alloc] initWithFrame:CGRectMake(285, 235, 120, 20)];
    self.labelTabel.text = @"原创作品";
    self.labelTabel.font = [UIFont systemFontOfSize:15];
    
    self.buttonTable = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonTable.frame = CGRectMake(360, 235, 20, 20);
    self.buttonTable.layer.borderWidth = 1.0f;
    self.buttonTable.layer.borderColor = [UIColor systemBlueColor].CGColor;
    
    [self.buttonTable setTitle:@"<" forState:UIControlStateNormal];
    [self.buttonTable setTitle:@"v" forState:UIControlStateSelected];
    [self.buttonTable setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    [self.buttonTable addTarget:self action:@selector(pressOpen) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *choice1 = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *choice2 = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *choice3 = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *choice4 = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *choice5 = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *choice6 = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *choice7 = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *choice8 = [UIButton buttonWithType:UIButtonTypeSystem];
    
    choice1.frame = CGRectMake(10, 330, 80, 40);
    choice2.frame = CGRectMake(105, 330, 80, 40);
    choice3.frame = CGRectMake(205, 330, 80, 40);
    choice4.frame = CGRectMake(305, 330, 80, 40);
    choice5.frame = CGRectMake(10, 380, 80, 40);
    choice6.frame = CGRectMake(105, 380, 80, 40);
    choice7.frame = CGRectMake(205, 380, 80, 40);
    choice8.frame = CGRectMake(305, 380, 80, 40);
    
    [choice1 setTitle:@"平面设计" forState:UIControlStateNormal];
    [choice2 setTitle:@"网页设计" forState:UIControlStateNormal];
    [choice3 setTitle:@"UI/icon" forState:UIControlStateNormal];
    [choice4 setTitle:@"插画手绘" forState:UIControlStateNormal];
    [choice5 setTitle:@"虚拟与设计" forState:UIControlStateNormal];
    [choice6 setTitle:@"影视" forState:UIControlStateNormal];
    [choice7 setTitle:@"摄影" forState:UIControlStateNormal];
    [choice8 setTitle:@"其他" forState:UIControlStateNormal];
    
    [choice1 addTarget:self action:@selector(pressChoice:) forControlEvents:UIControlEventTouchUpInside];
    [choice2 addTarget:self action:@selector(pressChoice:) forControlEvents:UIControlEventTouchUpInside];
    [choice3 addTarget:self action:@selector(pressChoice:) forControlEvents:UIControlEventTouchUpInside];
    [choice4 addTarget:self action:@selector(pressChoice:) forControlEvents:UIControlEventTouchUpInside];
    [choice5 addTarget:self action:@selector(pressChoice:) forControlEvents:UIControlEventTouchUpInside];
    [choice6 addTarget:self action:@selector(pressChoice:) forControlEvents:UIControlEventTouchUpInside];
    [choice7 addTarget:self action:@selector(pressChoice:) forControlEvents:UIControlEventTouchUpInside];
    [choice8 addTarget:self action:@selector(pressChoice:) forControlEvents:UIControlEventTouchUpInside];

    
    self.textFieldBiaoTi = [[UITextField alloc] initWithFrame:CGRectMake(0, 430, 394, 40)];
    self.textFieldBiaoTi.borderStyle = UITextBorderStyleLine;
    self.textFieldBiaoTi.placeholder = @"作品名称";
    
    self.textFieldNeiRong = [[UITextField alloc] initWithFrame:CGRectMake(0, 490, 394, 150)];
    self.textFieldNeiRong.borderStyle = UITextBorderStyleLine;
    self.textFieldNeiRong.placeholder = @"请添加作品说明";
    
    //UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap)];
    
    UIButton *buttonFaBu = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonFaBu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buttonFaBu.frame = CGRectMake(0, 670, 394, 50);
    [buttonFaBu setTitle:@"发布" forState:UIControlStateNormal];
    [buttonFaBu addTarget:self action:@selector(pressFaBu) forControlEvents:UIControlEventTouchUpInside];
    [buttonFaBu setBackgroundColor:[UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1]];
    
    UIButton *buttonJinzhi = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonJinzhi.frame = CGRectMake(20, 730, 20, 20);
    [buttonJinzhi setImage:[UIImage imageNamed:@"xuanzekuangmoren.png"] forState:UIControlStateNormal];
    [buttonJinzhi setImage:[UIImage imageNamed:@"xuanzekuangxuanzhong.png"] forState:UIControlStateSelected];
    [buttonJinzhi addTarget:self action:@selector(pressChoice:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *labelJinZhi = [[UILabel alloc] initWithFrame:CGRectMake(40, 730, 80, 20)];
    labelJinZhi.text = @"禁止下载";
    
    [self.view addSubview:choice1];
    [self.view addSubview:choice2];
    [self.view addSubview:choice3];
    [self.view addSubview:choice4];
    [self.view addSubview:choice5];
    [self.view addSubview:choice6];
    [self.view addSubview:choice7];
    [self.view addSubview:choice8];
    [self.view addSubview:self.textFieldBiaoTi];
    [self.view addSubview:self.textFieldNeiRong];
    [self.view addSubview:imageV];
    [self.view addSubview:labelDingWei];
    [self.view addSubview:self.buttonImage];
    [self.view addSubview:buttonFaBu];
    [self.view addSubview:labelJinZhi];
    [self.view addSubview:buttonJinzhi];
    [self.view addSubview:self.tabView];
    [self.view addSubview:self.buttonTable];
    [self.view addSubview:self.labelTabel];
   // [self.view addGestureRecognizer:tap];
}

//- (void)pressTap {
//    [self.textFieldBiaoTi resignFirstResponder];
//    [self.textFieldNeiRong resignFirstResponder];
//}

- (void)pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) pressPhoto {
    PhotoViewController *photo = [[PhotoViewController alloc] init];
    [self.navigationController pushViewController:photo animated:YES];
    photo.delegate = self;
}

- (void)pressChoice: (UIButton*) button {
    if (button.selected == NO) {
        button.selected = YES;
    } else {
        button.selected = NO;
    }
}

- (void) pressFaBu {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"已发布，正在等待审核～" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(pressWanCheng) userInfo:nil repeats:NO];
}

- (void)pressWanCheng {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)photoMode:(UIImage*)image numMode:(NSInteger) num {
    self.imagePhoto = image;
    NSLog(@"%@", self.imagePhoto);
    if (self.imagePhoto != nil) {
        [self.buttonImage setImage:self.imagePhoto forState:UIControlStateNormal];
    }
    UILabel *labelNum = [[UILabel alloc] initWithFrame:CGRectMake(240, 100, 20, 20)];
    NSString *str = [NSString stringWithFormat:@"%ld", num];
    labelNum.text = str;
    labelNum.backgroundColor = [UIColor systemBlueColor];
    labelNum.textColor = [UIColor whiteColor];
    [self.view addSubview:labelNum];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tabView dequeueReusableCellWithIdentifier:str];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"原创作品";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"设计资料";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"设计师观点";
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = @"设计教程";
    }
    return cell;
}

- (void)pressOpen {
    if (self.buttonTable.selected == NO) {
        self.buttonTable.selected = YES;
        self.tabView.frame = CGRectMake(270, 255, 120, 80);
    } else {
        self.buttonTable.selected = NO;
        self.tabView.frame = CGRectMake(270, 255, 120, 0);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        self.labelTabel.text = @"原创作品";
    }
    if (indexPath.row == 1) {
        self.labelTabel.text = @"设计资料";
    }
    if (indexPath.row == 2) {
        self.labelTabel.text = @"设计师观点";
    }
    if (indexPath.row == 3) {
        self.labelTabel.text = @"设计教程";
    }
}

@end
