//
//  ShouYeViewController.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/17.
//

#import "ShouYeViewController.h"
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "ThirdTableViewCell.h"
#import "NightTableViewCell.h"
#import "WoDeViewController.h"

static NSString *str1 = @"id1";
static NSString *str2 = @"id2";
static NSString *str3 = @"id3";
static NSString *str4 = @"id4";
@implementation ShouYeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tab = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tab.backgroundColor = [UIColor whiteColor];
    [self.tab registerClass:[FirstTableViewCell class] forCellReuseIdentifier:str1];
    [self.tab registerClass:[SecondTableViewCell class] forCellReuseIdentifier:str2];
    [self.tab registerClass:[ThirdTableViewCell class] forCellReuseIdentifier:str3];
    [self.tab registerClass:[NightTableViewCell class] forCellReuseIdentifier:str4];
    UIBarButtonItem *buttonBack = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_return.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];
    buttonBack.tintColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = buttonBack;
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self.view addSubview:self.tab];
    
}

-(void)pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 1;
    } else if (section == 2) {
        return 1;
    } else if (section == 3) {
        return 4;
    } else if (section == 4) {
        return 12;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 40;
    }
    if (indexPath.section == 1 ) {
        return 70;
    }
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell *cell1 = [self.tab dequeueReusableCellWithIdentifier:str1];
    SecondTableViewCell *cell2 = [self.tab dequeueReusableCellWithIdentifier:str2];
    ThirdTableViewCell *cell3 = [self.tab dequeueReusableCellWithIdentifier:str3];
    NightTableViewCell *cell4 = [self.tab dequeueReusableCellWithIdentifier:str4];
    [cell1 setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell2 setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell3 setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell4 setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (self.SwitchValue == 1) {
        cell4.switch1.on = YES;
        cell1.backgroundColor = [UIColor grayColor];
        cell2.backgroundColor = [UIColor grayColor];
        cell3.backgroundColor = [UIColor grayColor];
        cell4.backgroundColor = [UIColor grayColor];
        self.view.backgroundColor = [UIColor blackColor];
        self.tab.backgroundColor = [UIColor darkGrayColor];
        self.tabBarController.tabBar.backgroundColor = [UIColor blackColor];
    } else {
        cell4.switch1.on = NO;
        cell1.backgroundColor = [UIColor whiteColor];
        cell2.backgroundColor = [UIColor whiteColor];
        cell3.backgroundColor = [UIColor whiteColor];
        cell4.backgroundColor = [UIColor whiteColor];
        self.view.backgroundColor = [UIColor whiteColor];
        self.tab.backgroundColor = [UIColor whiteColor];
        self.tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    }
    WoDeViewController *wode = [[WoDeViewController alloc] init];
    wode.switchOn = self.SwitchValue;

    if (indexPath.section == 0) {
        return cell1;
    } else if (indexPath.section == 1) {
        return cell2;
    } else if (indexPath.section == 2) {
        cell3.imageV.image = [UIImage imageNamed:@"icon-person.png"];
        cell3.label.text = @"创作者中心";
    } else if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            cell3.imageV.image = [UIImage imageNamed:@"fire.png"];
            cell3.label.text = @"演出";
        }
        if (indexPath.row == 1) {
            cell3.imageV.image = [UIImage imageNamed:@"shop.png"];
            cell3.label.text = @"商城";
        }
        if (indexPath.row == 2) {
            cell3.imageV.image = [UIImage imageNamed:@"phone.png"];
            cell3.label.text = @"口袋彩铃";
        }
        if (indexPath.row == 3) {
            cell3.imageV.image = [UIImage imageNamed:@"tag.png"];
            cell3.label.text = @"在线听歌免流量";
        }
    } else if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            cell3.imageV.image = [UIImage imageNamed:@"settings.png"];

            cell3.label.text = @"设置";
        }
        if (indexPath.row == 1) {
            cell4.label.text = @"夜间模式";
            cell4.imageV.image = [UIImage imageNamed:@"yueliang.png"];
            [cell4.switch1 addTarget:self action:@selector(pressNight:) forControlEvents:UIControlEventValueChanged];
            return cell4;
        }
        if (indexPath.row == 2) {
            cell3.imageV.image = [UIImage imageNamed:@"miaobiao.png"];

            cell3.label.text = @"定时关闭";
        }
        if (indexPath.row == 3) {
            cell3.imageV.image = [UIImage imageNamed:@"heimingdan-02.png"];

            cell3.label.text = @"音乐黑名单";
        }
        if (indexPath.row == 4) {
            cell3.imageV.image = [UIImage imageNamed:@"jujing.png"];

            cell3.label.text = @"鲸鱼音效";
        }
        if (indexPath.row == 5) {
            cell3.imageV.image = [UIImage imageNamed:@"location.png"];

            cell3.label.text = @"添加siri捷径";
        }
        if (indexPath.row == 6) {
            cell3.imageV.image = [UIImage imageNamed:@"naozhong_huaban.png"];

            cell3.label.text = @"音乐闹钟";
        }
        if (indexPath.row == 7) {
            cell3.imageV.image = [UIImage imageNamed:@"ertongpiao.png"];

            cell3.label.text = @"青少年模式";
        }
        if (indexPath.row == 8) {
            cell3.imageV.image = [UIImage imageNamed:@"gongsijianjie.png"];

            cell3.label.text = @"我的订单";
        }
        if (indexPath.row == 9) {
            cell3.imageV.image = [UIImage imageNamed:@"touzichanpin.png"];

            cell3.label.text = @"优惠券";
        }
        if (indexPath.row == 10) {
            cell3.imageV.image = [UIImage imageNamed:@"tuiguang.png"];

            cell3.label.text = @"分享网易云音乐";
        }
        if (indexPath.row == 11) {
            cell3.imageV.image = [UIImage imageNamed:@"guanyu.png"];

            cell3.label.text = @"关于";
        }
    }
    return cell3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 3) {
        return @"音乐服务";
    }
    if (section == 4) {
        return @"小工具";
    }
    return nil;
}

- (void)pressNight: (UISwitch*) SwitchOn {
    
    self.SwitchValue = SwitchOn.isOn;
    [self.delegate SwitchMode:SwitchOn.isOn];

    [self.tab reloadData];
}


@end
