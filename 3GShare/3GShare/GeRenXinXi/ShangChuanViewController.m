//
//  ShangChuanViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import "ShangChuanViewController.h"
#import "NormalImageTableViewCell.h"

@interface ShangChuanViewController ()

@end

static NSString *str8 = @"id88";
@implementation ShangChuanViewController

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
    self.title = @"我上传的";
    
    
    self.scroll = [[UIScrollView alloc] init];
    self.scroll.contentSize = CGSizeMake(self.view.bounds.size.width * 3, 700);
    self.scroll.delegate = self;
    self.scroll.pagingEnabled = YES;
    self.scroll.frame = CGRectMake(0, 60, self.view.bounds.size.width, 852);
    self.scroll.bounces = NO;
    
    self.tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 700) style:UITableViewStyleGrouped];
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;
    [self.tableView1 registerClass:[NormalImageTableViewCell class] forCellReuseIdentifier:str8];
    
    self.tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, 700) style:UITableViewStyleGrouped];
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    [self.tableView2 registerClass:[NormalImageTableViewCell class] forCellReuseIdentifier:str8];

    
    self.tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * 2, 0, self.view.bounds.size.width, 700) style:UITableViewStyleGrouped];
    self.tableView3.delegate = self;
    self.tableView3.dataSource = self;
    [self.tableView3 registerClass:[NormalImageTableViewCell class] forCellReuseIdentifier:str8];

    
    self.segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50)];
    [self.segment insertSegmentWithTitle:@"上传时间" atIndex:0 animated:YES];
    [self.segment insertSegmentWithTitle:@"喜欢最多" atIndex:1 animated:YES];
    [self.segment insertSegmentWithTitle:@"分享最多" atIndex:2 animated:YES];
    self.segment.selectedSegmentIndex = 0;
    [self.segment addTarget:self action:@selector(pressSegment) forControlEvents:UIControlEventValueChanged];
    
    [self.scroll addSubview:self.tableView1];
    [self.scroll addSubview:self.tableView2];
    [self.scroll addSubview:self.tableView3];

    [self.view addSubview:self.scroll];
    [self.view addSubview:self.segment];
}

- (void)pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger pageX = self.scroll.contentOffset.x / 167;
    self.segment.selectedSegmentIndex = (pageX + 1) / 2;
}

- (void) pressSegment {
    if (self.segment.selectedSegmentIndex == 0) {
        [self.scroll setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    if (self.segment.selectedSegmentIndex == 1) {
        [self.scroll setContentOffset:CGPointMake(394, 0) animated:YES];
    }
    if (self.segment.selectedSegmentIndex == 2) {
        [self.scroll setContentOffset:CGPointMake(394 * 2, 0) animated:YES];
    }
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
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 394, 50)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 50;
    }
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 394, 6)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NormalImageTableViewCell *cell1 = [self.tableView1 dequeueReusableCellWithIdentifier:str8];
    NormalImageTableViewCell *cell2 = [self.tableView2 dequeueReusableCellWithIdentifier:str8];
    NormalImageTableViewCell *cell3 = [self.tableView3 dequeueReusableCellWithIdentifier:str8];

    cell1.backgroundColor = [UIColor whiteColor];
    cell2.backgroundColor = [UIColor whiteColor];
    cell3.backgroundColor = [UIColor whiteColor];

    [cell1 setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell2 setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell3 setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (tableView == self.tableView1) {
        if (indexPath.section == 0) {
            cell1.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell1.labelBiaoTi.text = @"miku美图精选";
            cell1.labelZuoZhe.text = @"share小V";
            cell1.labelBiaoQian.text = @"V家-美图-二次元";
            cell1.labelTime.text = @"15分钟前";
            cell1.dianZanShu = 55;
            cell1.liuLanShu = 201;
            cell1.fenXiangShu = 12;
        }
        if (indexPath.section == 1) {
            cell1.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell1.labelBiaoTi.text = @"miku美图精选";
            cell1.labelZuoZhe.text = @"share小V";
            cell1.labelBiaoQian.text = @"V家-美图-二次元";
            cell1.labelTime.text = @"15分钟前";
            cell1.dianZanShu = 55;
            cell1.liuLanShu = 201;
            cell1.fenXiangShu = 12;
        }
        if (indexPath.section == 2) {
            cell1.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell1.labelBiaoTi.text = @"miku美图精选";
            cell1.labelZuoZhe.text = @"share小V";
            cell1.labelBiaoQian.text = @"V家-美图-二次元";
            cell1.labelTime.text = @"15分钟前";
            cell1.dianZanShu = 55;
            cell1.liuLanShu = 201;
            cell1.fenXiangShu = 12;
        }
        if (indexPath.section == 3) {
            cell1.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell1.labelBiaoTi.text = @"miku美图精选";
            cell1.labelZuoZhe.text = @"share小V";
            cell1.labelBiaoQian.text = @"V家-美图-二次元";
            cell1.labelTime.text = @"15分钟前";
            cell1.dianZanShu = 55;
            cell1.liuLanShu = 201;
            cell1.fenXiangShu = 12;
        }
        if (indexPath.section == 4) {
            cell1.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell1.labelBiaoTi.text = @"miku美图精选";
            cell1.labelZuoZhe.text = @"share小V";
            cell1.labelBiaoQian.text = @"V家-美图-二次元";
            cell1.labelTime.text = @"15分钟前";
            cell1.dianZanShu = 55;
            cell1.liuLanShu = 201;
            cell1.fenXiangShu = 12;
        }
        return cell1;
    }
    if (tableView == self.tableView2) {
        if (indexPath.section == 0) {
            cell2.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell2.labelBiaoTi.text = @"miku美图精选";
            cell2.labelZuoZhe.text = @"share小V";
            cell2.labelBiaoQian.text = @"V家-美图-二次元";
            cell2.labelTime.text = @"15分钟前";
            cell2.dianZanShu = 55;
            cell2.liuLanShu = 201;
            cell2.fenXiangShu = 12;
        }
        if (indexPath.section == 1) {
            cell2.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell2.labelBiaoTi.text = @"miku美图精选";
            cell2.labelZuoZhe.text = @"share小V";
            cell2.labelBiaoQian.text = @"V家-美图-二次元";
            cell2.labelTime.text = @"15分钟前";
            cell2.dianZanShu = 55;
            cell2.liuLanShu = 201;
            cell2.fenXiangShu = 12;
        }
        if (indexPath.section == 2) {
            cell2.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell2.labelBiaoTi.text = @"miku美图精选";
            cell2.labelZuoZhe.text = @"share小V";
            cell2.labelBiaoQian.text = @"V家-美图-二次元";
            cell2.labelTime.text = @"15分钟前";
            cell2.dianZanShu = 55;
            cell2.liuLanShu = 201;
            cell2.fenXiangShu = 12;
        }
        if (indexPath.section == 3) {
            cell2.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell2.labelBiaoTi.text = @"miku美图精选";
            cell2.labelZuoZhe.text = @"share小V";
            cell2.labelBiaoQian.text = @"V家-美图-二次元";
            cell2.labelTime.text = @"15分钟前";
            cell2.dianZanShu = 55;
            cell2.liuLanShu = 201;
            cell2.fenXiangShu = 12;
        }
        if (indexPath.section == 4) {
            cell2.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell2.labelBiaoTi.text = @"miku美图精选";
            cell2.labelZuoZhe.text = @"share小V";
            cell2.labelBiaoQian.text = @"V家-美图-二次元";
            cell2.labelTime.text = @"15分钟前";
            cell2.dianZanShu = 55;
            cell2.liuLanShu = 201;
            cell2.fenXiangShu = 12;
        }
        return cell2;
    }
    if (tableView == self.tableView3) {
        if (indexPath.section == 0) {
            cell3.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell3.labelBiaoTi.text = @"miku美图精选";
            cell3.labelZuoZhe.text = @"share小V";
            cell3.labelBiaoQian.text = @"V家-美图-二次元";
            cell3.labelTime.text = @"15分钟前";
            cell3.dianZanShu = 55;
            cell3.liuLanShu = 201;
            cell3.fenXiangShu = 12;
        }
        if (indexPath.section == 1) {
            cell3.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell3.labelBiaoTi.text = @"miku美图精选";
            cell3.labelZuoZhe.text = @"share小V";
            cell3.labelBiaoQian.text = @"V家-美图-二次元";
            cell3.labelTime.text = @"15分钟前";
            cell3.dianZanShu = 55;
            cell3.liuLanShu = 201;
            cell3.fenXiangShu = 12;
        }
        if (indexPath.section == 2) {
            cell3.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell3.labelBiaoTi.text = @"miku美图精选";
            cell3.labelZuoZhe.text = @"share小V";
            cell3.labelBiaoQian.text = @"V家-美图-二次元";
            cell3.labelTime.text = @"15分钟前";
            cell3.dianZanShu = 55;
            cell3.liuLanShu = 201;
            cell3.fenXiangShu = 12;
        }
        if (indexPath.section == 3) {
            cell3.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell3.labelBiaoTi.text = @"miku美图精选";
            cell3.labelZuoZhe.text = @"share小V";
            cell3.labelBiaoQian.text = @"V家-美图-二次元";
            cell3.labelTime.text = @"15分钟前";
            cell3.dianZanShu = 55;
            cell3.liuLanShu = 201;
            cell3.fenXiangShu = 12;
        }
        if (indexPath.section == 4) {
            cell3.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell3.labelBiaoTi.text = @"miku美图精选";
            cell3.labelZuoZhe.text = @"share小V";
            cell3.labelBiaoQian.text = @"V家-美图-二次元";
            cell3.labelTime.text = @"15分钟前";
            cell3.dianZanShu = 55;
            cell3.liuLanShu = 201;
            cell3.fenXiangShu = 12;
        }
    }
    return cell3;
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
