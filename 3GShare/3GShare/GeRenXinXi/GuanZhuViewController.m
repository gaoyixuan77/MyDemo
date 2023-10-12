//
//  GuanZhuViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import "GuanZhuViewController.h"
#import "GuanZhuTableViewCell.h"

@interface GuanZhuViewController ()

@property (nonatomic, strong) UITableView *tabView;

@end

static NSString *str9 = @"id9";
@implementation GuanZhuViewController

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
    self.title = @"新的关注";

    
    self.tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.tabView registerClass:[GuanZhuTableViewCell class] forCellReuseIdentifier:str9];
    
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
    GuanZhuTableViewCell *cell = [self.tabView dequeueReusableCellWithIdentifier:str9];
    if (indexPath.row == 0) {
        cell.headView.image = [UIImage imageNamed:@"xxp1.jpg"];
        cell.labelID.text = @"Share小A";
    }
    if (indexPath.row == 1) {
        cell.headView.image = [UIImage imageNamed:@"xxp2.jpg"];
        cell.labelID.text = @"Share小Q";
    }
    if (indexPath.row == 2) {
        cell.headView.image = [UIImage imageNamed:@"xxp3.jpg"];
        cell.labelID.text = @"Share小W";
    }
    if (indexPath.row == 3) {
        cell.headView.image = [UIImage imageNamed:@"xxp4.jpg"];
        cell.labelID.text = @"Share小E";
    }
    if (indexPath.row == 4) {
        cell.headView.image = [UIImage imageNamed:@"xin7.jpg"];
        cell.labelID.text = @"Share小R";
    }
    if (indexPath.row == 5) {
        cell.headView.image = [UIImage imageNamed:@"xin8.jpg"];
        cell.labelID.text = @"Share小T";
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
