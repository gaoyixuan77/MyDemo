//
//  WoDeViewController.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/17.
//

#import "WoDeViewController.h"
#import "MyOneTableViewCell.h"
#import "TwoTableViewCell.h"
#import "MusicTableViewCell.h"
#import "ShouYeViewController.h"
#import "FindViewController.h"

@interface WoDeViewController ()

@end

static NSString *str11 = @"id11";
static NSString *str22 = @"id22";
static NSString *str33 = @"id33";
@implementation WoDeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.table registerClass:[MyOneTableViewCell class] forCellReuseIdentifier:str11];
    [self.table registerClass:[TwoTableViewCell class] forCellReuseIdentifier:str22];
    [self.table registerClass:[MusicTableViewCell class] forCellReuseIdentifier:str33];
    
    ShouYeViewController *shouye = [[ShouYeViewController alloc] init];
    shouye.delegate = self;
    
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
    
    UIBarButtonItem *moreButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"cloud.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressMore)];
    self.navigationItem.leftBarButtonItem = moreButton;
    
    UIBarButtonItem *findButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"wxbsousuotuiguang.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressFind)];
    self.navigationItem.rightBarButtonItem = findButton;
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
}

- (void)SwitchMode:(BOOL)switchValueOn {
    //NSLog(@"1111");
    self.switchOn = switchValueOn;
    //NSLog(@"%d", self.switchOn);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 3;
    }
    if (section == 2) {
        return 1;
    }
    if (section == 3) {
        return 5;
    }
    if (section == 4) {
        return 2;
    }
    if (section == 5) {
        return 1;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 140;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 85;
        }
        if (indexPath.row == 1) {
            return 85;
        }
        if (indexPath.row == 2) {
            return 30;
        }
    }
    if (indexPath.section == 2) {
        return 110;
    }
    if (indexPath.section == 3) {
        return 110;
    }
    if (indexPath.section == 4) {
        return 110;
    }
    if (indexPath.section == 5) {
        return 150;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyOneTableViewCell *oneCell = [self.table dequeueReusableCellWithIdentifier:str11];
    TwoTableViewCell *twoCell = [self.table dequeueReusableCellWithIdentifier:str22];
    MusicTableViewCell *musicCell = [self.table dequeueReusableCellWithIdentifier:str33];
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    [oneCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [twoCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [musicCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (self.switchOn) {
        oneCell.backgroundColor = [UIColor darkGrayColor];
        twoCell.backgroundColor = [UIColor darkGrayColor];
        musicCell.backgroundColor = [UIColor darkGrayColor];
        cell.backgroundColor = [UIColor darkGrayColor];

    } else {
        oneCell.backgroundColor = [UIColor whiteColor];
        twoCell.backgroundColor = [UIColor whiteColor];
        musicCell.backgroundColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    if (indexPath.section == 0) {
        oneCell.backgroundColor = [UIColor whiteColor];
        return oneCell;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            twoCell.image1 = [UIImage imageNamed:@"zuijinbofang.png"];
            twoCell.image2 = [UIImage imageNamed:@"bendixiazai.png"];
            twoCell.image3 = [UIImage imageNamed:@"yunpan-shangchuan.png"];
            twoCell.image4 = [UIImage imageNamed:@"yigou.png"];
            twoCell.label1.text = @"最近播放";
            twoCell.label2.text = @"本地下载";
            twoCell.label3.text = @"   云盘";
            twoCell.label4.text = @"   已购";
            return twoCell;
        }
        if (indexPath.row == 1) {
            twoCell.image1 = [UIImage imageNamed:@"wodehaoyou.png"];
            twoCell.image2 = [UIImage imageNamed:@"shoucang.png"];
            twoCell.image3 = [UIImage imageNamed:@"boke1.png"];
            twoCell.image4 = [UIImage imageNamed:@"icon-test.png"];
            twoCell.label1.text = @"我的好友";
            twoCell.label2.text = @"收藏和赞";
            twoCell.label3.text = @"我的博客";
            twoCell.label4.text = @" 乐迷团";
            return twoCell;
        }
        if (indexPath.row == 2) {
            cell.textLabel.text = @"                                +音乐应用";
            cell.textLabel.frame = CGRectMake(150, 0, 100, 30);
            cell.textLabel.textColor = [UIColor grayColor];
            return cell;
        }
    }
    if (indexPath.section == 2) {
        musicCell.MusicLabel.text = @"我喜欢的音乐";
        musicCell.MusicimageView.image = [UIImage imageNamed:@"xin.png"];
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            musicCell.MusicLabel.text = @"I Got Smoke";
            musicCell.MusicimageView.image = [UIImage imageNamed:@"dingzhen.jpg"];
        }
        if (indexPath.row == 1) {
            musicCell.MusicLabel.text = @"INTERNET OVERDOSE";
            musicCell.MusicimageView.image = [UIImage imageNamed:@"chaotianjiang.jpg"];
        }
        if (indexPath.row == 2) {
            musicCell.MusicLabel.text = @"龙哥就是龙！";
            musicCell.MusicimageView.image = [UIImage imageNamed:@"xuangou.jpg"];
        }
        if (indexPath.row == 3) {
            musicCell.MusicLabel.text = @"his theme";
            musicCell.MusicimageView.image = [UIImage imageNamed:@"xin4.jpg"];
        }
        if (indexPath.row == 4) {
            musicCell.MusicLabel.text = @"「アイドル/偶像」";
            musicCell.MusicimageView.image = [UIImage imageNamed:@"xin8.jpg"];
        }
    }
    if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            musicCell.MusicLabel.text = @"远空";
            musicCell.MusicimageView.image = [UIImage imageNamed:@"qiong.jpg"];
        }
        if (indexPath.row == 1) {
            musicCell.MusicLabel.text = @"モラトリアム";
            musicCell.MusicimageView.image = [UIImage imageNamed:@"xin1.jpg"];
        }
    }
    if (indexPath.section == 5) {
        musicCell.MusicLabel.text = @"可爱炫狗宝宝";
        musicCell.MusicimageView.image = [UIImage imageNamed:@"xuangou.jpg"];
    }
    return musicCell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return @"我喜欢的音乐";
    }
    if (section == 3) {
        return @"我的歌单";
    }
    if (section == 4) {
        return @"收藏歌单";
    }
    if (section == 5) {
        return @"歌单助手";
    }
    return nil;
}

- (void)pressMore {
    ShouYeViewController *shouye = [[ShouYeViewController alloc] init];
    [self.navigationController pushViewController:shouye animated:YES];
}

- (void)pressFind {
    FindViewController *find = [[FindViewController alloc] init];
    [self.navigationController pushViewController:find animated:YES];
}

@end
