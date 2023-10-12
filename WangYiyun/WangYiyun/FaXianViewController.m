//
//  FaXianViewController.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/19.
//

#import "FaXianViewController.h"
#import "TuPianTableViewCell.h"
#import "XuanXiangTableViewCell.h"
#import "SmallBiaoTiTableViewCell.h"
#import "TuiGeTableViewCell.h"
#import "MusicTableViewCell.h"
#import "ShouYeViewController.h"
#import "MusicFindViewController.h"
#import "ChouTiTableViewCell.h"

@interface FaXianViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITableView *tabView;
//@property (nonatomic, strong) UISearchBar
@end

static NSString *str1 = @"id1";
static NSString *str2 = @"id2";
static NSString *str3 = @"id3";
static NSString *str4 = @"id4";
static NSString *str5 = @"id5";
static NSString *str6 = @"id6";
static NSString *str7 = @"id7";
@implementation FaXianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 280, 40)];
    self.textField.backgroundColor = [UIColor colorWithRed:0.56 green:0.32 blue:0.51 alpha:0.1];
    self.textField.keyboardType = UIKeyboardTypeWebSearch;
    self.textField.placeholder = @"I Got Smoke - 理塘丁真";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    
    UIBarButtonItem *moreButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"gengduo-2.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressMore)];
    moreButton.tintColor = [UIColor redColor];
    UIBarButtonItem *textItem = [[UIBarButtonItem alloc] initWithCustomView:self.textField];
    NSArray *arr = [NSArray arrayWithObjects:moreButton,textItem, nil];
    self.navigationItem.leftBarButtonItems = arr;
    
    UIBarButtonItem *musicButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"maikefeng.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressMusic)];
    musicButton.tintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = musicButton;

    self.tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:str1];
    [self.tabView registerClass:[TuPianTableViewCell class] forCellReuseIdentifier:str2];
    [self.tabView registerClass:[XuanXiangTableViewCell class] forCellReuseIdentifier:str3];
    [self.tabView registerClass:[SmallBiaoTiTableViewCell class] forCellReuseIdentifier:str4];
    [self.tabView registerClass:[TuiGeTableViewCell class] forCellReuseIdentifier:str5];
    [self.tabView registerClass:[MusicTableViewCell class] forCellReuseIdentifier:str6];
    [self.tabView registerClass:[ChouTiTableViewCell class] forCellReuseIdentifier:str7];
    self.tabView.backgroundColor = [UIColor whiteColor];
    
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    
    //这里是给tabView添加了手势操作，即点击一次执行事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    //设置点击手势的点击次数
    tap.numberOfTapsRequired = 1;
    
    [self.tabView addGestureRecognizer:tap];
    
    
    [self.view addSubview:self.tabView];
    [self.view addSubview:self.textField];
}

- (void)tap: (UIGestureRecognizer*)tap1 {
    [self.textField resignFirstResponder];
}

- (void)pressMore {
    ShouYeViewController *shouye = [[ShouYeViewController alloc] init];
    [self.textField resignFirstResponder];
    [self.view endEditing:YES];
    [self.navigationController pushViewController:shouye animated:YES];
}

- (void)pressMusic {
    MusicFindViewController *findMusic = [[MusicFindViewController alloc] init];
    [self.textField resignFirstResponder];
    [self.view endEditing:YES];
    [self presentViewController:findMusic animated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 1;
    } else if (section == 3) {
        return 2;
    } else {
        return 2;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 180;
    }
    if (indexPath.section == 1) {
        return 80;
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return 30;
        }
        if (indexPath.row == 1) {
            return 140;
        }
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            return 30;
        } else {
            return 300;
        }
    }
    if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            return 30;
        }
        if (indexPath.row == 1) {
            return 140;
        }
    }
    if (indexPath.section == 5) {
        if (indexPath.row == 0) {
            return 30;
        }
        if (indexPath.row == 1) {
            return 140;
        }
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cellNormol = [self.tabView dequeueReusableCellWithIdentifier:str1];
    TuPianTableViewCell *cellPic = [self.tabView dequeueReusableCellWithIdentifier:str2];
    XuanXiangTableViewCell *cellXuanXiang = [self.tabView dequeueReusableCellWithIdentifier:str3];
    SmallBiaoTiTableViewCell *cellSmall = [self.tabView dequeueReusableCellWithIdentifier:str4];
    TuiGeTableViewCell *cellMusic = [self.tabView dequeueReusableCellWithIdentifier:str5];
    MusicTableViewCell *cellOtherMusic = [self.tabView dequeueReusableCellWithIdentifier:str6];
    if (indexPath.section == 0) {
        return cellPic;
    }
    if (indexPath.section == 1) {
        return cellXuanXiang;
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cellSmall.FrontLabel.text = @"推荐歌单 >";
            cellSmall.FrontLabel.textColor = [UIColor darkGrayColor];
            return cellSmall;
        }
        if (indexPath.row == 1) {
            [cellMusic.FirstMusicButton setImage:[UIImage imageNamed:@"miku.jpg"] forState:UIControlStateNormal];
            [cellMusic.SecondMusicButton setImage:[UIImage imageNamed:@"xiaoyuan.jpg"] forState:UIControlStateNormal];
            [cellMusic.ThirdMusicButton setImage:[UIImage imageNamed:@"xxp3.jpg"] forState:UIControlStateNormal];
            cellMusic.LabelFirst.text = @"VOCALOID传说级名曲全收录！";
            cellMusic.LabelSecond.text = @"《魔法少女小圆》OP/ED合辑";
            cellMusic.LabelThird.text = @"《Arcaea v4.5.1》相关曲目全收录";
            return cellMusic;
        }
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            cellSmall.FrontLabel.text = @"为你推荐 >";
            cellSmall.FrontLabel.textColor = [UIColor darkGrayColor];
            return cellSmall;
        }
        if (indexPath.row == 1) {
            ChouTiTableViewCell *cellOtherMusic = [self.tabView dequeueReusableCellWithIdentifier:str7];
            return cellOtherMusic;
        }
    }
    if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            cellSmall.FrontLabel.text = @"你的雷达歌单 >";
            cellSmall.FrontLabel.textColor = [UIColor darkGrayColor];
            return cellSmall;
        }
        if (indexPath.row == 1) {
            [cellMusic.FirstMusicButton setImage:[UIImage imageNamed:@"xin1.jpg"] forState:UIControlStateNormal];
            [cellMusic.SecondMusicButton setImage:[UIImage imageNamed:@"xin2.jpg"] forState:UIControlStateNormal];
            [cellMusic.ThirdMusicButton setImage:[UIImage imageNamed:@"xin3.jpg"] forState:UIControlStateNormal];
            cellMusic.LabelFirst.text = @"从0开始的音乐世界生活！";
            cellMusic.LabelSecond.text = @"吹响吧！上低音号";
            cellMusic.LabelThird.text = @"岛（你的关注）与你相遇｜乐迷雷达";
            return cellMusic;
        }
    }
    if (indexPath.section == 5) {
        if (indexPath.row == 0) {
            cellSmall.FrontLabel.text = @"每个人都是一首歌 >";
            return cellSmall;
        }
        if (indexPath.row == 1) {
            [cellMusic.FirstMusicButton setImage:[UIImage imageNamed:@"xin5.jpg"] forState:UIControlStateNormal];
            [cellMusic.SecondMusicButton setImage:[UIImage imageNamed:@"xin6.jpg"] forState:UIControlStateNormal];
            [cellMusic.ThirdMusicButton setImage:[UIImage imageNamed:@"xin7.jpg"] forState:UIControlStateNormal];
            cellMusic.LabelFirst.text = @"P.Y.T - 马思唯";
            cellMusic.LabelSecond.text = @"步步 - 五月天";
            cellMusic.LabelThird.text = @"Producer Man - Lyn Lapid";
            return cellMusic;
        }
    }
    return cellNormol;
    
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
