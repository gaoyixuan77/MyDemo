//
//  GeRenXinXiViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/21.
//

#import "GeRenXinXiViewController.h"
#import "GeRenXinXiTableViewCell.h"
#import "SheZhiTableViewCell.h"
#import "ShangChuanViewController.h"
#import "XiaoXiViewController.h"
#import "TuiJianViewController.h"
#import "SheZhiViewController.h"

@interface GeRenXinXiViewController ()

@property (nonatomic, strong) UITableView *tabView;

@end

static NSString *str6 = @"id66";
static NSString *str7 = @"id77";
@implementation GeRenXinXiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.tabView registerClass:[GeRenXinXiTableViewCell class] forCellReuseIdentifier:str6];
    [self.tabView registerClass:[SheZhiTableViewCell class] forCellReuseIdentifier:str7];
    
    [self.view addSubview:self.tabView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 150;
    }
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GeRenXinXiTableViewCell *cellGeRen = [self.tabView dequeueReusableCellWithIdentifier:str6];
    SheZhiTableViewCell *cellSheZhi = [self.tabView dequeueReusableCellWithIdentifier:str7];
    cellGeRen.backgroundColor = [UIColor whiteColor];
    cellSheZhi.backgroundColor = [UIColor whiteColor];
    [cellGeRen setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cellSheZhi setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.section == 0) {
        cellGeRen.image = [UIImage imageNamed:@"miku.jpg"];
        cellGeRen.labelID.text = @"share小V";
        cellGeRen.labelbiaoQian.text = @"初音未来爱好者";
        cellGeRen.labelYuLu.text = @"该用户尚未设置个性签名～";
        cellGeRen.dianZanShu = 15;
        cellGeRen.liuLanShu = 120;
        cellGeRen.fenXiangShu = 89;
        return cellGeRen;
    }else {
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                cellSheZhi.labelBiaoTi.text = @"我上传的";
                cellSheZhi.imageViewFront.image = [UIImage imageNamed:@"jifen.png"];
            }
            if (indexPath.row == 1) {
                cellSheZhi.labelBiaoTi.text = @"我的消息";
                cellSheZhi.imageViewFront.image = [UIImage imageNamed:@"richangjilu.png"];
            }
            if (indexPath.row == 2) {
                cellSheZhi.labelBiaoTi.text = @"我喜欢的";
                cellSheZhi.imageViewFront.image = [UIImage imageNamed:@"jifen_1.png"];
            }
            if (indexPath.row == 3) {
                cellSheZhi.labelBiaoTi.text = @"院系通知";
                cellSheZhi.imageViewFront.image = [UIImage imageNamed:@"mendianruzhu.png"];
            }
            if (indexPath.row == 4) {
                cellSheZhi.labelBiaoTi.text = @"设置";
                cellSheZhi.imageViewFront.image = [UIImage imageNamed:@"shezhi.png"];
            }
            if (indexPath.row == 5) {
                cellSheZhi.labelBiaoTi.text = @"退出";
                cellSheZhi.imageViewFront.image = [UIImage imageNamed:@"qianwang.png"];
            }
        }
    }
    return cellSheZhi;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            ShangChuanViewController *shangChuan = [[ShangChuanViewController alloc] init];
            [self.navigationController pushViewController:shangChuan animated:YES];
        }
        if (indexPath.row == 1) {
            XiaoXiViewController *xiaoxi = [[XiaoXiViewController alloc] init];
            [self.navigationController pushViewController:xiaoxi animated:YES];
        }
        if (indexPath.row == 2) {
            TuiJianViewController *tuiJian = [[TuiJianViewController alloc] init];
            [self.navigationController pushViewController:tuiJian animated:YES];
        }
        if (indexPath.row == 3) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"当前暂无通知" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cofirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:cofirm];
            [self presentViewController:alert animated:YES completion:nil];
        }
        if (indexPath.row == 4) {
            SheZhiViewController *sheZhi = [[SheZhiViewController alloc] init];
            sheZhi.delegate = self;
            sheZhi.sexBoy = self.sexChoice;
            [self.navigationController pushViewController:sheZhi animated:YES];
        }
        if (indexPath.row == 5) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"已退出" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cofirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:cofirm];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
}

- (void) sexChoiceMode:(BOOL)choiceBoy {
    self.sexChoice = choiceBoy;
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
