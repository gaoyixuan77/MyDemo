//
//  TuiJianViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import "TuiJianViewController.h"
#import "NormalImageTableViewCell.h"

@interface TuiJianViewController ()

@property (nonatomic, strong) UITableView *tabView;

@end

static NSString *str13 = @"id13";
@implementation TuiJianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1];
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    appearance.backgroundColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1];
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    self.navigationController.navigationBar.standardAppearance = appearance;
    UIBarButtonItem *barbutton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];
    [barbutton setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = barbutton;
    self.title = @"我的喜欢";

    
    self.tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.tabView registerClass:[NormalImageTableViewCell class] forCellReuseIdentifier:str13];
    
    [self.view addSubview:self.tabView];
}

- (void)pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 394, 2)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 394, 4)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NormalImageTableViewCell *cell1 = [self.tabView dequeueReusableCellWithIdentifier:str13];
    cell1.backgroundColor = [UIColor whiteColor];
    [cell1 setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.section == 0) {
        cell1.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
        cell1.labelBiaoTi.text = @"miku美图精选";
        cell1.labelZuoZhe.text = @"share小V";
        cell1.labelBiaoQian.text = @"V家-美图-二次元";
        cell1.labelTime.text = @"15分钟前";
        cell1.buttonDianZan.selected = YES;
        cell1.dianZanShu = 56;
        cell1.liuLanShu = 201;
        cell1.fenXiangShu = 12;
    }
    if (indexPath.section == 1) {
        cell1.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
        cell1.labelBiaoTi.text = @"miku美图精选";
        cell1.labelZuoZhe.text = @"share小V";
        cell1.labelBiaoQian.text = @"V家-美图-二次元";
        cell1.labelTime.text = @"15分钟前";
        cell1.buttonDianZan.selected = YES;
        cell1.dianZanShu = 56;
        cell1.liuLanShu = 201;
        cell1.fenXiangShu = 12;
    }
    if (indexPath.section == 2) {
        cell1.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
        cell1.labelBiaoTi.text = @"miku美图精选";
        cell1.labelZuoZhe.text = @"share小V";
        cell1.labelBiaoQian.text = @"V家-美图-二次元";
        cell1.labelTime.text = @"15分钟前";
        cell1.buttonDianZan.selected = YES;
        cell1.dianZanShu = 56;
        cell1.liuLanShu = 201;
        cell1.fenXiangShu = 12;
    }
    if (indexPath.section == 3) {
        cell1.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
        cell1.labelBiaoTi.text = @"miku美图精选";
        cell1.labelZuoZhe.text = @"share小V";
        cell1.labelBiaoQian.text = @"V家-美图-二次元";
        cell1.labelTime.text = @"15分钟前";
        cell1.buttonDianZan.selected = YES;
        cell1.dianZanShu = 56;
        cell1.liuLanShu = 201;
        cell1.fenXiangShu = 12;
    }
    if (indexPath.section == 4) {
        cell1.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
        cell1.labelBiaoTi.text = @"miku美图精选";
        cell1.labelZuoZhe.text = @"share小V";
        cell1.labelBiaoQian.text = @"V家-美图-二次元";
        cell1.labelTime.text = @"15分钟前";
        cell1.buttonDianZan.selected = YES;
        cell1.dianZanShu = 56;
        cell1.liuLanShu = 201;
        cell1.fenXiangShu = 12;
    }
    return cell1;
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
