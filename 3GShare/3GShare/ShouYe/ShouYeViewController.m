//
//  ShouYeViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/21.
//

#import "ShouYeViewController.h"
#import "ImageTableViewCell.h"
#import "NormalImageTableViewCell.h"
#import "mikuViewController.h"
#import "AppDelegate.h"

static NSString *str1 = @"id1";
static NSString *str2 = @"id2";
@interface ShouYeViewController ()

@property (nonatomic, strong) UITableView *table;


@end

@implementation ShouYeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    appearance.backgroundColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1];
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    self.navigationController.navigationBar.standardAppearance = appearance;
    
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.showsHorizontalScrollIndicator = NO;
    
    [self.table registerClass:[ImageTableViewCell class] forCellReuseIdentifier:str1];
    [self.table registerClass:[NormalImageTableViewCell class] forCellReuseIdentifier:str2];
    
    [self.view addSubview:self.table];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 394, 5)];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 394, 5)];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageTableViewCell *cellImage = [self.table dequeueReusableCellWithIdentifier:str1];
    [cellImage setSelectionStyle:UITableViewCellSelectionStyleNone];
    AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate ;

    if (indexPath.section == 0) {
        return cellImage;
    }
    if (indexPath.section == 1) {
        NormalImageTableViewCell *cellNormal1 = [[NormalImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"0"];
        cellNormal1.imageBig.image = [UIImage imageNamed:@"miku1.jpg"];
        cellNormal1.labelBiaoTi.text = @"miku美图精选";
        cellNormal1.labelZuoZhe.text = @"share小V";
        cellNormal1.labelBiaoQian.text = @"V家-美图-二次元";
        cellNormal1.labelTime.text = @"15分钟前";
        cellNormal1.buttonDianZan.selected = mydelegate.selsect1;
        cellNormal1.dianZanShu = 55 + mydelegate.selsect1;
        cellNormal1.liuLanShu = 201;
        cellNormal1.fenXiangShu = 12;
        cellNormal1.backgroundColor = [UIColor whiteColor];
        [cellNormal1 setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cellNormal1.buttonDianZan addTarget:self action:@selector(pressDianzan1:) forControlEvents:UIControlEventTouchUpInside];
        return cellNormal1;
    }
    if (indexPath.section == 2) {
        NormalImageTableViewCell *cellNormal2 = [[NormalImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"1"];
        cellNormal2.imageBig.image = [UIImage imageNamed:@"xin7.jpg"];
        cellNormal2.labelBiaoTi.text = @"毕加索名作合集";
        cellNormal2.labelZuoZhe.text = @"share小A";
        cellNormal2.labelBiaoQian.text = @"大师-抽象派-名画";
        cellNormal2.labelTime.text = @"22分钟前";
        cellNormal2.buttonDianZan.selected = mydelegate.selsect2;
        cellNormal2.dianZanShu = 167 + mydelegate.selsect2;
        cellNormal2.liuLanShu = 563;
        cellNormal2.fenXiangShu = 82;
        [cellNormal2.buttonDianZan addTarget:self action:@selector(pressDianzan2:) forControlEvents:UIControlEventTouchUpInside];
        cellNormal2.backgroundColor = [UIColor whiteColor];
        [cellNormal2 setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cellNormal2;
    }
    if (indexPath.section == 3) {
        NormalImageTableViewCell *cellNormal3 = [[NormalImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"2"];
        cellNormal3.imageBig.image = [UIImage imageNamed:@"jing.jpg"];
        cellNormal3.labelBiaoTi.text = @"风景摄影作品精选";
        cellNormal3.labelZuoZhe.text = @"share小Q";
        cellNormal3.labelBiaoQian.text = @"摄影-风景-唯美";
        cellNormal3.labelTime.text = @"42分钟前";
        cellNormal3.buttonDianZan.selected = mydelegate.selsect3;
        cellNormal3.dianZanShu = 34 + mydelegate.selsect3;
        cellNormal3.liuLanShu = 102;
        cellNormal3.fenXiangShu = 7;
        [cellNormal3.buttonDianZan addTarget:self action:@selector(pressDianzan3:) forControlEvents:UIControlEventTouchUpInside];
        cellNormal3.backgroundColor = [UIColor whiteColor];
        [cellNormal3 setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cellNormal3;
    }
    if (indexPath.section == 4) {
        NormalImageTableViewCell *cellNormal4 = [[NormalImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"3"];
        cellNormal4.imageBig.image = [UIImage imageNamed:@"xin8.jpg"];
        cellNormal4.labelBiaoTi.text = @"平涂插画鉴赏";
        cellNormal4.labelZuoZhe.text = @"share小S";
        cellNormal4.labelBiaoQian.text = @"绘画-平涂-二次元";
        cellNormal4.labelTime.text = @"57分钟前";
        cellNormal4.buttonDianZan.selected = mydelegate.selsect4;
        cellNormal4.dianZanShu = 61 + mydelegate.selsect4;
        cellNormal4.liuLanShu = 311;
        cellNormal4.fenXiangShu = 11;
        [cellNormal4.buttonDianZan addTarget:self action:@selector(pressDianzan4:) forControlEvents:UIControlEventTouchUpInside];
        cellNormal4.backgroundColor = [UIColor whiteColor];
        [cellNormal4 setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cellNormal4;
    }
    if (indexPath.section == 5) {
        NormalImageTableViewCell *cellNormal5 = [[NormalImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"4"];
        cellNormal5.imageBig.image = [UIImage imageNamed:@"tian.jpg"];
        cellNormal5.labelBiaoTi.text = @"绝美天空分享";
        cellNormal5.labelZuoZhe.text = @"share小D";
        cellNormal5.labelBiaoQian.text = @"摄影-风景-天空";
        cellNormal5.labelTime.text = @"1小时前";
        cellNormal5.buttonDianZan.selected = mydelegate.selsect5;
        cellNormal5.dianZanShu = 27 + mydelegate.selsect5;
        cellNormal5.liuLanShu = 192;
        cellNormal5.fenXiangShu = 2;
        [cellNormal5.buttonDianZan addTarget:self action:@selector(pressDianzan5:) forControlEvents:UIControlEventTouchUpInside];
        cellNormal5.backgroundColor = [UIColor whiteColor];
        [cellNormal5 setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cellNormal5;
    }
    return cellImage;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate ;
    if (indexPath.section == 1) {
        mikuViewController *miku = [[mikuViewController alloc] init];
        miku.dianZanShu = 55 + mydelegate.selsect1;
        miku.buttonValue = mydelegate.selsect1;
        [self.navigationController pushViewController:miku animated:YES];
    }
}

- (void)pressDianzan1: (UIButton*) buttonDianZan {
    AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate ;
    if (buttonDianZan.selected == NO) {
        mydelegate.selsect1 = YES;
    } else {
        mydelegate.selsect1 = NO;
    }
    [self.table reloadData];
}

- (void)pressDianzan2: (UIButton*) buttonDianZan {
    AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate ;
    NSLog(@"%d",mydelegate.selsect2);

    if (buttonDianZan.selected == NO) {
        mydelegate.selsect2 = YES;
    } else {
        mydelegate.selsect2 = NO;
    }
    [self.table reloadData];

}

- (void)pressDianzan3: (UIButton*) buttonDianZan {
    AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate ;
    if (buttonDianZan.selected == NO) {
        mydelegate.selsect3 = YES;
    } else {
        mydelegate.selsect3 = NO;
    }
    [self.table reloadData];

}

- (void)pressDianzan4: (UIButton*) buttonDianZan {
    AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate ;
    if (buttonDianZan.selected == NO) {
        mydelegate.selsect4 = YES;
    } else {
        mydelegate.selsect4 = NO;
    }
    [self.table reloadData];

}

- (void)pressDianzan5: (UIButton*) buttonDianZan {
    AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate ;
    if (buttonDianZan.selected == NO) {
        mydelegate.selsect5 = YES;
    } else {
        mydelegate.selsect5 = NO;
    }
    [self.table reloadData];

}

- (void)viewWillAppear:(BOOL)animated {
    [self.table reloadData];
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
