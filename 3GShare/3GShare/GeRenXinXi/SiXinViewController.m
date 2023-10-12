//
//  SiXinViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import "SiXinViewController.h"
#import "SiXinTableViewCell.h"

@interface SiXinViewController ()

@property (nonatomic, strong) UITableView *tabView;

@end

static NSString *str12 = @"id12";
@implementation SiXinViewController

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
    self.title = @"我的私信";

    
    self.tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.tabView registerClass:[SiXinTableViewCell class] forCellReuseIdentifier:str12];
    
    [self.view addSubview:self.tabView];
}

- (void)pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SiXinTableViewCell *cell = [self.tabView dequeueReusableCellWithIdentifier:str12];
    if (indexPath.row == 0) {
        cell.headView.image = [UIImage imageNamed:@"photo4.jpg"];
        cell.labelID.text = @"Share小Y";
        cell.labelXiaoXi.text = @"咪请问谷子还在咩？";
        cell.labelTime.text = @"2023年7月25日";
    }
    if (indexPath.row == 1) {
        cell.headView.image = [UIImage imageNamed:@"photo17.jpg"];
        cell.labelID.text = @"Share小U";
        cell.labelXiaoXi.text = @"咪请问谷子还在咩？";
        cell.labelTime.text = @"2023年6月23日";
    }
    if (indexPath.row == 2) {
        cell.headView.image = [UIImage imageNamed:@"photo31.jpg"];
        cell.labelID.text = @"Share小I";
        cell.labelXiaoXi.text = @"咪请问谷子还在咩？";
        cell.labelTime.text = @"2023年6月12日";
    }
    if (indexPath.row == 3) {
        cell.headView.image = [UIImage imageNamed:@"photo19.jpg"];
        cell.labelID.text = @"Share小O";
        cell.labelXiaoXi.text = @"咪请问谷子还在咩？";
        cell.labelTime.text = @"2023年5月5日";
    }
    if (indexPath.row == 4) {
        cell.headView.image = [UIImage imageNamed:@"photo20.jpg"];
        cell.labelID.text = @"Share小P";
        cell.labelXiaoXi.text = @"咪请问谷子还在咩？";
        cell.labelTime.text = @"2023年3月17日";
    }
    if (indexPath.row == 5) {
        cell.headView.image = [UIImage imageNamed:@"photo5.jpg"];
        cell.labelID.text = @"Share小K";
        cell.labelXiaoXi.text = @"咪请问谷子还在咩？";
        cell.labelTime.text = @"2022年12月25日";
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
