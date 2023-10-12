//
//  SheZhiViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import "SheZhiViewController.h"
#import "JiBenZiLiaoViewController.h"
#import "MiMaViewController.h"
#import "XiaoXiSheZhiViewController.h"

@interface SheZhiViewController ()

@property (nonatomic, strong) UITableView *tabView;

@end

static NSString *str14 = @"id14";
@implementation SheZhiViewController

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
    self.title = @"设置";

    self.tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:str14];
    
    [self.view addSubview:self.tabView];
}

- (void)pressBack {
    [self.delegate sexChoiceMode:self.sexBoy];
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tabView dequeueReusableCellWithIdentifier:str14];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"基本资料";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"修改密码";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"消息设置";
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = @"关于SHARE";
    }
    if (indexPath.row == 4) {
        cell.textLabel.text = @"清除缓存";
    }
    return cell;
}

- (void) sexMode:(BOOL)boy {
    self.sexBoy = boy;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        JiBenZiLiaoViewController *jiBenZiLiao = [[JiBenZiLiaoViewController alloc] init];
        jiBenZiLiao.delegate = self;
        if (self.sexBoy) {
            jiBenZiLiao.sexSelectBoy = YES;
        } else {
            jiBenZiLiao.sexSelectBoy = NO;
        }
        [self.navigationController pushViewController:jiBenZiLiao animated:YES];
    }
    if (indexPath.row == 1) {
        MiMaViewController *mima = [[MiMaViewController alloc] init];
        [self.navigationController pushViewController:mima animated:YES];
    }
    if (indexPath.row == 2) {
        XiaoXiSheZhiViewController *xiaoXi = [[XiaoXiSheZhiViewController alloc] init];
        [self.navigationController pushViewController:xiaoXi animated:YES];
    }
    if (indexPath.row == 3) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"关于Share" message:@"SHAER，于2014年12月开始研究设计。\n为那些艺术院校师生等设计创意群体所建造的分享交流平台，涉及艺术创作、广告创意、交互设计、影视动漫、时尚文化等诸多创意文化领域未来。\n加入SHARE，好东西就要晒！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cofirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:cofirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
    if (indexPath.row == 4) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"已清除缓存" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(pressHuanCun) userInfo:nil repeats:NO];
    }
}

- (void)pressHuanCun {
    [self dismissViewControllerAnimated:YES completion:nil];
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
