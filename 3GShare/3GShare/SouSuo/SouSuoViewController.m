//
//  SouSuoViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/21.
//

#import "SouSuoViewController.h"
#import "ChoiceTableViewCell.h"
#import "SouMIKUViewController.h"
#import "OtherSouSuoViewController.h"
#import "PhotoViewController.h"
#import "FaBuViewController.h"


@interface SouSuoViewController ()

@property (nonatomic, strong) UITableView *tabView;

@end

static NSString *str1 = @"id1";
static NSString *str2 = @"id2";
@implementation SouSuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1];
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    appearance.backgroundColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1];
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    self.navigationController.navigationBar.standardAppearance = appearance;
    
    UIBarButtonItem *upButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"shangchuan.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressUP)];
    [upButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = upButton;
    
    self.textField = [[UITextField alloc] init];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"搜索 用户名/作品分类 文章";
    self.textField.returnKeyType = UIReturnKeyYahoo;
    self.textField.delegate = self;
    self.textField.frame = CGRectMake(10, 110, 374, 50);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap)];
    [self.view addGestureRecognizer:tap];
    
    self.tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 160, 394, 792)];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    self.tabView.backgroundColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1];
    self.tabView.scrollEnabled = NO;
    
    [self.view addSubview:self.textField];
    [self.tabView registerClass:[ChoiceTableViewCell class] forCellReuseIdentifier:str2];
    [self.view addSubview:self.tabView];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];
    if ([self.textField.text isEqual: @"miku"]) {
        SouMIKUViewController *miku = [[SouMIKUViewController alloc] init];
        miku.strSouSuo = self.textField.text;
        [self.navigationController pushViewController:miku animated:YES];
    } else {
        OtherSouSuoViewController *other = [[OtherSouSuoViewController alloc] init];
        other.strSouSuo = self.textField.text;
        [self.navigationController pushViewController:other animated:YES];
    }
    return YES;
}

- (void)pressTap {
    [self.textField resignFirstResponder];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *viewHead = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 394, 30)];
    UIView *kuai = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
    UIView *xian = [[UIView alloc] initWithFrame:CGRectMake(0, 30, 394, 2)];
    kuai.backgroundColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1];
    xian.backgroundColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 50, 30)];
    label.font = [UIFont systemFontOfSize:20];
    label.textColor = [UIColor whiteColor];
    [viewHead addSubview:kuai];
    [viewHead addSubview:xian];
    if (section == 0) {
        label.text = @"分类";
        [kuai addSubview:label];
    }
    if (section == 1) {
        label.text = @"推荐";
        [kuai addSubview:label];
    }
    if (section == 2) {
        label.text = @"时间";
        [kuai addSubview:label];
    }
    return viewHead;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChoiceTableViewCell *cellChoice = [self.tabView dequeueReusableCellWithIdentifier:str2];

    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [cellChoice.choice1 setTitle:@"平面设计" forState:UIControlStateNormal];
            [cellChoice.choice2 setTitle:@"网页设计" forState:UIControlStateNormal];
            [cellChoice.choice3 setTitle:@"UI/icon" forState:UIControlStateNormal];
            [cellChoice.choice4 setTitle:@"插画手绘" forState:UIControlStateNormal];

        }
        if (indexPath.row == 1) {
            [cellChoice.choice1 setTitle:@"虚拟设计" forState:UIControlStateNormal];
            [cellChoice.choice2 setTitle:@"影视" forState:UIControlStateNormal];
            [cellChoice.choice3 setTitle:@"摄影" forState:UIControlStateNormal];
            [cellChoice.choice4 setTitle:@"其他" forState:UIControlStateNormal];
        }
    }
    if (indexPath.section == 1) {
        [cellChoice.choice1 setTitle:@"人气最高" forState:UIControlStateNormal];
        [cellChoice.choice2 setTitle:@"收藏最多" forState:UIControlStateNormal];
        [cellChoice.choice3 setTitle:@"评论最多" forState:UIControlStateNormal];
        [cellChoice.choice4 setTitle:@"编辑精选" forState:UIControlStateNormal];
    }
    if (indexPath.section == 2) {
        [cellChoice.choice1 setTitle:@"今天" forState:UIControlStateNormal];
        [cellChoice.choice2 setTitle:@"本周" forState:UIControlStateNormal];
        [cellChoice.choice3 setTitle:@"本月" forState:UIControlStateNormal];
        [cellChoice.choice4 setTitle:@"本年" forState:UIControlStateNormal];
    }
    return cellChoice;
}

- (void) pressUP {
    FaBuViewController *faBu = [[FaBuViewController alloc] init];
    [self.navigationController pushViewController:faBu animated:YES];
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
