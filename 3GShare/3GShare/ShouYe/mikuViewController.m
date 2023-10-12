//
//  mikuViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/22.
//

#import "mikuViewController.h"
#import "InCellTableViewCell.h"
#import "ScrollTableViewCell.h"

@interface mikuViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *str1 = @"id1";
static NSString *str2 = @"id2";
@implementation mikuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    appearance.backgroundColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1];
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    self.navigationController.navigationBar.standardAppearance = appearance;
    UIBarButtonItem *returnButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_return.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];
    [returnButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = returnButton;
    self.navigationItem.title = @"搜索";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[InCellTableViewCell class] forCellReuseIdentifier:str1];
    [self.tableView registerClass:[ScrollTableViewCell class] forCellReuseIdentifier:str2];
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    } else {
        return 1600;
    }
}

- (void) pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InCellTableViewCell *cellmiku = [self.tableView dequeueReusableCellWithIdentifier:str1];
    ScrollTableViewCell *cellScroll = [self.tableView dequeueReusableCellWithIdentifier:str2];
    if (indexPath.section == 0) {
        cellmiku.image = [UIImage imageNamed:@"miku.jpg"];
        cellmiku.labelBiaoTi.text = @"miku美图精选";
        cellmiku.labelZuoZhe.text = @"share小V";
        cellmiku.labelTime.text = @"15分钟前";
        cellmiku.dianZanShu = self.dianZanShu;
        cellmiku.buttonDianZan.selected = self.buttonValue;
        cellmiku.liuLanShu = 201;
        cellmiku.fenXiangShu = 12;
        return cellmiku;
    } else {
        cellScroll.image1.image = [UIImage imageNamed:@"miku1.jpg"];
        cellScroll.image2.image = [UIImage imageNamed:@"miku2.jpg"];
        cellScroll.image3.image = [UIImage imageNamed:@"miku3.jpg"];
        cellScroll.image4.image = [UIImage imageNamed:@"miku4.jpg"];
        cellScroll.image5.image = [UIImage imageNamed:@"miku5.jpg"];
        cellScroll.labelZhengWen.text = @"miku～";
        return cellScroll;
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
