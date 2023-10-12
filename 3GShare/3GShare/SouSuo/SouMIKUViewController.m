//
//  SouMIKUViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/24.
//

#import "SouMIKUViewController.h"
#import "NormalImageTableViewCell.h"
#import "OtherSouSuoViewController.h"
#import "mikuViewController.h"
#import "AppDelegate.h"

@interface SouMIKUViewController ()

@end

static NSString *str1 = @"id";
@implementation SouMIKUViewController

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
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 180, 394, 852) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[NormalImageTableViewCell class] forCellReuseIdentifier:str1];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap)];
    [self.view addGestureRecognizer:tap];
    
    [self.view addSubview:self.tableView];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 394, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NormalImageTableViewCell *cellNormal = [self.tableView dequeueReusableCellWithIdentifier:str1];
    AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    cellNormal.backgroundColor = [UIColor whiteColor];
    [cellNormal setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.section == 0) {
        cellNormal.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
        cellNormal.labelBiaoTi.text = @"miku美图精选";
        cellNormal.labelZuoZhe.text = @"share小V";
        cellNormal.labelBiaoQian.text = @"V家-美图-二次元";
        cellNormal.labelTime.text = @"15分钟前";
        cellNormal.buttonDianZan.tag = 301;
        [cellNormal.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
        cellNormal.buttonDianZan.selected = mydelegate.selsect84;
        cellNormal.dianZanShu = 55 + mydelegate.selsect84;
        cellNormal.liuLanShu = 201;
        cellNormal.fenXiangShu = 12;
    }
    if (indexPath.section == 1) {
        cellNormal.imageBig.image = [UIImage imageNamed:@"miku2.jpg"];
        cellNormal.labelBiaoTi.text = @"初音未来图集";
        cellNormal.labelZuoZhe.text = @"share小A";
        cellNormal.labelBiaoQian.text = @"V家-美图-二次元";
        cellNormal.labelTime.text = @"12小时前";
        cellNormal.buttonDianZan.tag = 302;
        [cellNormal.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
        cellNormal.buttonDianZan.selected = mydelegate.selsect94;
        cellNormal.dianZanShu = 55 + mydelegate.selsect94;
        cellNormal.liuLanShu = 563;
        cellNormal.fenXiangShu = 82;
    }
    if (indexPath.section == 2) {
        cellNormal.imageBig.image = [UIImage imageNamed:@"miku4.jpg"];
        cellNormal.labelBiaoTi.text = @"初音未来miku";
        cellNormal.labelZuoZhe.text = @"share小Q";
        cellNormal.labelBiaoQian.text = @"V家-美图-二次元";
        cellNormal.labelTime.text = @"2天前";
        cellNormal.buttonDianZan.tag = 303;
        [cellNormal.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
        cellNormal.buttonDianZan.selected = mydelegate.selsect104;
        cellNormal.dianZanShu = 55 + mydelegate.selsect104;
        cellNormal.liuLanShu = 102;
        cellNormal.fenXiangShu = 7;
    }
    return cellNormal;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"mmm");
    if (indexPath.section == 0) {
        NSLog(@"nnn");
        mikuViewController *miku = [[mikuViewController alloc] init];
        [self.navigationController pushViewController:miku animated:YES];
    }
}

- (void) pressDianZan: (UIButton*) button {
    AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    if (button.tag == 301) {
        if (button.selected == NO) {
            mydelegate.selsect84 = YES;
        } else {
            mydelegate.selsect84 = NO;
        }
    }
    if (button.tag == 302) {
        if (button.selected == NO) {
            mydelegate.selsect94 = YES;
        } else {
            mydelegate.selsect94 = NO;
        }
    }
    if (button.tag == 303) {
        if (button.selected == NO) {
            mydelegate.selsect104 = YES;
        } else {
            mydelegate.selsect104 = NO;
        }
    }
    [self.tableView reloadData];
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
