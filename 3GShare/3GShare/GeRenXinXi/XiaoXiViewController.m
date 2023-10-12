//
//  XiaoXiViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import "XiaoXiViewController.h"
#import "GuanZhuViewController.h"
#import "SiXinViewController.h"

@interface XiaoXiViewController ()

@property (nonatomic, strong) UITableView *tabView;

@end

static NSString *str01 = @"id01";
@implementation XiaoXiViewController

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
    self.title = @"我的消息";

    
    self.tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:str01];
    
    [self.view addSubview:self.tabView];
}

- (void)pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tabView dequeueReusableCellWithIdentifier:str01];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"评论";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"推荐我的";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"新关注的";
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = @"私信";
    }
    if (indexPath.row == 4) {
        cell.textLabel.text = @"活动通知";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"当前暂无评论" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cofirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:cofirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
    if (indexPath.row == 1) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"当前暂无推荐" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cofirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:cofirm];
        [self presentViewController:alert animated:YES completion:nil];
    }if (indexPath.row == 2) {
        GuanZhuViewController *guanzhu = [[GuanZhuViewController alloc] init];
        [self.navigationController pushViewController:guanzhu animated:YES];
    }
    if (indexPath.row == 3) {
        SiXinViewController *siXin = [[SiXinViewController alloc] init];
        [self.navigationController pushViewController:siXin animated:YES];
    }
    if (indexPath.row == 4) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"当前暂无活动" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cofirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:cofirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
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
