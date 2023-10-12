//
//  SecondViewController.m
//  ZARA
//
//  Created by Eleven on 2023/6/12.
//

#import "SecondViewController.h"
#import "MyTableViewCell.h"
#import "BigTableViewCell.h"
#import "OtherViewController.h"

@interface SecondViewController ()

@end

static NSString* str = @"id";
@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image1 = [UIImage imageNamed:@"jifen.png"];
    UITabBarItem *btn1 = [[UITabBarItem alloc] initWithTitle:@"我的" image:image1 tag:102];
    self.tabBarItem = btn1;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tab = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self.tab registerClass:[BigTableViewCell class] forCellReuseIdentifier:str];
    [self.tab registerClass:[MyTableViewCell class] forCellReuseIdentifier:str];
    [self.view addSubview:_tab];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 3;
    }
    if (section == 2) {
        return 1;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 150;
    } else {
        return 44;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        BigTableViewCell *cell1 = [[BigTableViewCell alloc] init];
        [cell1 setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell1.backgroundColor = [UIColor whiteColor];
        return cell1;
    } else {
        MyTableViewCell *cell2 = [self.tab dequeueReusableCellWithIdentifier:str];
        [cell2 setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell2.backgroundColor = [UIColor whiteColor];
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                cell2.label.text = @"订单";
                cell2.imageview.image = [UIImage imageNamed:@"richangjilu.png"];
            }
            if (indexPath.row == 1) {
                cell2.label.text = @"收藏";
                cell2.imageview.image = [UIImage imageNamed:@"fuwu.png"];
            }
            if (indexPath.row == 2) {
                cell2.label.text = @"地址";
                cell2.imageview.image = [UIImage imageNamed:@"mendianruzhu.png"];
            }
        }
        if (indexPath.section == 2) {
            cell2.label.text = @"设置";
            cell2.imageview.image = [UIImage imageNamed:@"shezhi.png"];
        }
        return cell2;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    OtherViewController *ovc = [[OtherViewController alloc] init];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        [self presentViewController:ovc animated:YES completion:nil];
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [self.navigationController pushViewController:ovc animated:YES];
        }
        if (indexPath.row == 1) {
            [self.navigationController pushViewController:ovc animated:YES];
        }
        if (indexPath.row == 2) {
            [self.navigationController pushViewController:ovc animated:YES];
        }
    }
    if (indexPath.section == 2) {
        [self presentViewController:ovc animated:YES completion:nil];
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
