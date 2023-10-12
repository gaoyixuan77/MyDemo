//
//  WenZhangViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/21.
//

#import "WenZhangViewController.h"
#import "NormalImageTableViewCell.h"
#import "AppDelegate.h"

@interface WenZhangViewController ()

@end

static NSString *str77 = @"id77";

@implementation WenZhangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1];
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    appearance.backgroundColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1];
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    self.navigationController.navigationBar.standardAppearance = appearance;
    
    self.scroll = [[UIScrollView alloc] init];
    self.scroll.contentSize = CGSizeMake(self.view.bounds.size.width * 3, 700);
    self.scroll.delegate = self;
    self.scroll.pagingEnabled = YES;
    self.scroll.frame = CGRectMake(0, 60, self.view.bounds.size.width, 852);
    self.scroll.bounces = NO;
    
    self.tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 700) style:UITableViewStyleGrouped];
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;
    [self.tableView1 registerClass:[NormalImageTableViewCell class] forCellReuseIdentifier:str77];
    
    self.tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, 700) style:UITableViewStyleGrouped];
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    [self.tableView2 registerClass:[NormalImageTableViewCell class] forCellReuseIdentifier:str77];
    
    self.tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * 2, 0, self.view.bounds.size.width, 700) style:UITableViewStyleGrouped];
    self.tableView3.delegate = self;
    self.tableView3.dataSource = self;
    [self.tableView3 registerClass:[NormalImageTableViewCell class] forCellReuseIdentifier:str77];

    
    self.segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50)];
    [self.segment insertSegmentWithTitle:@"精选文章" atIndex:0 animated:YES];
    [self.segment insertSegmentWithTitle:@"热门推荐" atIndex:1 animated:YES];
    [self.segment insertSegmentWithTitle:@"全部文章" atIndex:2 animated:YES];
    self.segment.selectedSegmentIndex = 0;
    [self.segment addTarget:self action:@selector(pressSegment) forControlEvents:UIControlEventValueChanged];
    
    [self.scroll addSubview:self.tableView1];
    [self.scroll addSubview:self.tableView2];
    [self.scroll addSubview:self.tableView3];

    [self.view addSubview:self.scroll];
    [self.view addSubview:self.segment];
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
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 394, 4)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NormalImageTableViewCell *cell1 = [self.tableView1 dequeueReusableCellWithIdentifier:str77];
    NormalImageTableViewCell *cell2 = [self.tableView2 dequeueReusableCellWithIdentifier:str77];
    NormalImageTableViewCell *cell3 = [self.tableView3 dequeueReusableCellWithIdentifier:str77];
    AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;

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
            cell1.buttonDianZan.selected = mydelegate.selsect6;
            cell1.buttonDianZan.tag = 201;
            [cell1.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
            cell1.dianZanShu = 55 + mydelegate.selsect6;
            cell1.liuLanShu = 201;
            cell1.fenXiangShu = 12;
        }
        if (indexPath.section == 1) {
            cell1.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell1.labelBiaoTi.text = @"miku美图精选";
            cell1.labelZuoZhe.text = @"share小V";
            cell1.labelBiaoQian.text = @"V家-美图-二次元";
            cell1.labelTime.text = @"15分钟前";
            cell1.buttonDianZan.selected = mydelegate.selsect7;
            cell1.buttonDianZan.tag = 202;
            [cell1.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
            cell1.dianZanShu = 55 + mydelegate.selsect7;
            cell1.liuLanShu = 201;
            cell1.fenXiangShu = 12;
        }
        if (indexPath.section == 2) {
            cell1.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell1.labelBiaoTi.text = @"miku美图精选";
            cell1.labelZuoZhe.text = @"share小V";
            cell1.labelBiaoQian.text = @"V家-美图-二次元";
            cell1.labelTime.text = @"15分钟前";
            cell1.buttonDianZan.selected = mydelegate.selsect8;
            cell1.buttonDianZan.tag = 203;
            [cell1.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
            cell1.dianZanShu = 55 + mydelegate.selsect8;
            cell1.liuLanShu = 201;
            cell1.fenXiangShu = 12;
        }
        if (indexPath.section == 3) {
            cell1.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell1.labelBiaoTi.text = @"miku美图精选";
            cell1.labelZuoZhe.text = @"share小V";
            cell1.labelBiaoQian.text = @"V家-美图-二次元";
            cell1.labelTime.text = @"15分钟前";
            cell1.buttonDianZan.tag = 204;
            [cell1.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
            cell1.dianZanShu = 55 + mydelegate.selsect9;
            cell1.liuLanShu = 201;
            cell1.fenXiangShu = 12;
        }
        if (indexPath.section == 4) {
            cell1.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell1.labelBiaoTi.text = @"miku美图精选";
            cell1.labelZuoZhe.text = @"share小V";
            cell1.labelBiaoQian.text = @"V家-美图-二次元";
            cell1.labelTime.text = @"15分钟前";
            cell1.buttonDianZan.tag = 205;
            [cell1.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
            cell1.dianZanShu = 55 + mydelegate.selsect10;
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
            cell2.buttonDianZan.tag = 206;
            [cell2.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
            cell2.dianZanShu = 55 + mydelegate.selsect62;
            cell2.liuLanShu = 201;
            cell2.fenXiangShu = 12;
        }
        if (indexPath.section == 1) {
            cell2.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell2.labelBiaoTi.text = @"miku美图精选";
            cell2.labelZuoZhe.text = @"share小V";
            cell2.labelBiaoQian.text = @"V家-美图-二次元";
            cell2.labelTime.text = @"15分钟前";
            cell2.buttonDianZan.tag = 207;
            [cell2.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
            cell2.dianZanShu = 55 + mydelegate.selsect72;
            cell2.liuLanShu = 201;
            cell2.fenXiangShu = 12;
        }
        if (indexPath.section == 2) {
            cell2.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell2.labelBiaoTi.text = @"miku美图精选";
            cell2.labelZuoZhe.text = @"share小V";
            cell2.labelBiaoQian.text = @"V家-美图-二次元";
            cell2.labelTime.text = @"15分钟前";
            cell2.buttonDianZan.tag = 208;
            [cell2.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
            cell2.dianZanShu = 55 + mydelegate.selsect82;
            cell2.liuLanShu = 201;
            cell2.fenXiangShu = 12;
        }
        if (indexPath.section == 3) {
            cell2.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell2.labelBiaoTi.text = @"miku美图精选";
            cell2.labelZuoZhe.text = @"share小V";
            cell2.labelBiaoQian.text = @"V家-美图-二次元";
            cell2.labelTime.text = @"15分钟前";
            cell2.buttonDianZan.tag = 209;
            [cell2.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
            cell2.dianZanShu = 55 + mydelegate.selsect92;
            cell2.liuLanShu = 201;
            cell2.fenXiangShu = 12;
        }
        if (indexPath.section == 4) {
            cell2.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell2.labelBiaoTi.text = @"miku美图精选";
            cell2.labelZuoZhe.text = @"share小V";
            cell2.labelBiaoQian.text = @"V家-美图-二次元";
            cell2.labelTime.text = @"15分钟前";
            cell2.buttonDianZan.tag = 210;
            [cell2.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
            cell2.dianZanShu = 55 + mydelegate.selsect102;
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
            cell1.buttonDianZan.tag = 211;
            [cell1.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
            cell1.dianZanShu = 55 + mydelegate.selsect63;
            cell3.liuLanShu = 201;
            cell3.fenXiangShu = 12;
        }
        if (indexPath.section == 1) {
            cell3.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell3.labelBiaoTi.text = @"miku美图精选";
            cell3.labelZuoZhe.text = @"share小V";
            cell3.labelBiaoQian.text = @"V家-美图-二次元";
            cell3.labelTime.text = @"15分钟前";
            cell1.buttonDianZan.tag = 212;
            [cell1.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
            cell1.dianZanShu = 55 + mydelegate.selsect73;
            cell3.liuLanShu = 201;
            cell3.fenXiangShu = 12;
        }
        if (indexPath.section == 2) {
            cell3.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell3.labelBiaoTi.text = @"miku美图精选";
            cell3.labelZuoZhe.text = @"share小V";
            cell3.labelBiaoQian.text = @"V家-美图-二次元";
            cell3.labelTime.text = @"15分钟前";
            cell1.buttonDianZan.tag = 213;
            [cell1.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
            cell1.dianZanShu = 55 + mydelegate.selsect83;
            cell3.liuLanShu = 201;
            cell3.fenXiangShu = 12;
        }
        if (indexPath.section == 3) {
            cell3.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell3.labelBiaoTi.text = @"miku美图精选";
            cell3.labelZuoZhe.text = @"share小V";
            cell3.labelBiaoQian.text = @"V家-美图-二次元";
            cell3.labelTime.text = @"15分钟前";
            cell1.buttonDianZan.tag = 214;
            [cell1.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
            cell1.dianZanShu = 55 + mydelegate.selsect93;
            cell3.fenXiangShu = 12;
        }
        if (indexPath.section == 4) {
            cell3.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
            cell3.labelBiaoTi.text = @"miku美图精选";
            cell3.labelZuoZhe.text = @"share小V";
            cell3.labelBiaoQian.text = @"V家-美图-二次元";
            cell3.labelTime.text = @"15分钟前";
            cell1.buttonDianZan.tag = 215;
            [cell1.buttonDianZan addTarget:self action:@selector(pressDianZan:) forControlEvents:UIControlEventTouchUpInside];
            cell1.dianZanShu = 55 + mydelegate.selsect103;
            cell3.liuLanShu = 201;
            cell3.fenXiangShu = 12;
        }
    }
    return cell3;
}

- (void)pressDianZan: (UIButton*)button {
    AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate ;
    if (button.tag == 201) {
        if (button.selected == NO) {
            mydelegate.selsect6 = YES;
        } else {
            mydelegate.selsect6 = NO;
        }
    }
    if (button.tag == 202) {
        if (button.selected == NO) {
            mydelegate.selsect7 = YES;
        } else {
            mydelegate.selsect7 = NO;
        }
    }
    if (button.tag == 203) {
        if (button.selected == NO) {
            mydelegate.selsect8 = YES;
        } else {
            mydelegate.selsect8 = NO;
        }
    }
    if (button.tag == 204) {
        if (button.selected == NO) {
            mydelegate.selsect8 = YES;
        } else {
            mydelegate.selsect8 = NO;
        }
    }
    if (button.tag == 205) {
        if (button.selected == NO) {
            mydelegate.selsect8 = YES;
        } else {
            mydelegate.selsect8 = NO;
        }
    }
    if (button.tag == 206) {
        if (button.selected == NO) {
            mydelegate.selsect62 = YES;
        } else {
            mydelegate.selsect62 = NO;
        }
    }
    if (button.tag == 207) {
        if (button.selected == NO) {
            mydelegate.selsect72 = YES;
        } else {
            mydelegate.selsect72 = NO;
        }
    }
    if (button.tag == 208) {
        if (button.selected == NO) {
            mydelegate.selsect82 = YES;
        } else {
            mydelegate.selsect82 = NO;
        }
    }
    if (button.tag == 209) {
        if (button.selected == NO) {
            mydelegate.selsect92 = YES;
        } else {
            mydelegate.selsect92 = NO;
        }
    }if (button.tag == 210) {
        if (button.selected == NO) {
            mydelegate.selsect102 = YES;
        } else {
            mydelegate.selsect102 = NO;
        }
    }
    if (button.tag == 211) {
        if (button.selected == NO) {
            mydelegate.selsect63 = YES;
        } else {
            mydelegate.selsect63 = NO;
        }
    }
    if (button.tag == 212) {
        if (button.selected == NO) {
            mydelegate.selsect73 = YES;
        } else {
            mydelegate.selsect73 = NO;
        }
    }
    if (button.tag == 213) {
        if (button.selected == NO) {
            mydelegate.selsect83 = YES;
        } else {
            mydelegate.selsect83 = NO;
        }
    }
    if (button.tag == 214) {
        if (button.selected == NO) {
            mydelegate.selsect93 = YES;
        } else {
            mydelegate.selsect93 = NO;
        }
    }
    if (button.tag == 215) {
        if (button.selected == NO) {
            mydelegate.selsect103 = YES;
        } else {
            mydelegate.selsect103 = NO;
        }
    }
    [self.tableView1 reloadData];
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
