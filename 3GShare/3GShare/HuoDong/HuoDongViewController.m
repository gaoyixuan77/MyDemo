//
//  HuoDongViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/21.
//

#import "HuoDongViewController.h"
#import "HuoDongTableViewCell.h"

@interface HuoDongViewController ()

@end
static NSString *str = @"id";
@implementation HuoDongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1];
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    appearance.backgroundColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1];
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationItem.title = @"活动";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[HuoDongTableViewCell class] forCellReuseIdentifier:str];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 170;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 394, 2)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HuoDongTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:str forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.section == 0) {
        cell.image = [UIImage imageNamed:@"xxp1.jpg"];
        cell.label.text = @"好啊吼啊吼啊好好笑啊哦哈";
    }
    if (indexPath.section == 1) {
        cell.image = [UIImage imageNamed:@"xxp2.jpg"];
        cell.label.text = @"好啊吼啊吼啊好好笑啊哦哈";
    }
    if (indexPath.section == 2) {
        cell.image = [UIImage imageNamed:@"xxp3.jpg"];
        cell.label.text = @"好啊吼啊吼啊好好笑啊哦哈";
    }
    if (indexPath.section == 3) {
        cell.image = [UIImage imageNamed:@"xxp4.jpg"];
        cell.label.text = @"好啊吼啊吼啊好好笑啊哦哈";
    }
    if (indexPath.section == 4) {
        cell.image = [UIImage imageNamed:@"xin7.jpg"];
        cell.label.text = @"好啊吼啊吼啊好好笑啊哦哈";
    }
    return cell;
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
