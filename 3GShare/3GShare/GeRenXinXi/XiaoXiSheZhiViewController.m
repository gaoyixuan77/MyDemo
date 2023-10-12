//
//  XiaoXiSheZhiViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import "XiaoXiSheZhiViewController.h"
#import "XiaoXISheZhiTableViewCell.h"
#import "AppDelegate.h"

@interface XiaoXiSheZhiViewController ()

@property (nonatomic, strong) UITableView *tabView;

@end

static NSString *str15 = @"id15";
@implementation XiaoXiSheZhiViewController

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
    self.title = @"消息设置";

    
    self.tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.tabView registerClass:[XiaoXISheZhiTableViewCell class] forCellReuseIdentifier:str15];
    
    [self.view addSubview:self.tabView];
}

- (void)pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XiaoXISheZhiTableViewCell *cell = [self.tabView dequeueReusableCellWithIdentifier:str15];
    AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate ;
    
    if (indexPath.row == 0) {
        cell.label.text = @"接受所有新消息通知";
        cell.switchSheZhi.tag = 101;
        [cell.switchSheZhi setOn:mydelegate.switchValue1];
    }
    if (indexPath.row == 1) {
        cell.label.text = @"通知显示栏";
        cell.switchSheZhi.tag = 102;
        [cell.switchSheZhi setOn:mydelegate.switchValue2];

    }
    if (indexPath.row == 2) {
        cell.label.text = @"声音";
        cell.switchSheZhi.tag = 103;
        [cell.switchSheZhi setOn:mydelegate.switchValue3];

    }
    if (indexPath.row == 3) {
        cell.label.text = @"振动";
        cell.switchSheZhi.tag = 104;
        [cell.switchSheZhi setOn:mydelegate.switchValue4];

    }
    if (indexPath.row == 4) {
        cell.label.text = @"关注更新";
        cell.switchSheZhi.tag = 105;
        [cell.switchSheZhi setOn:mydelegate.switchValue5];

    }
    [cell.switchSheZhi addTarget:self action:@selector(pressSwitch:) forControlEvents:UIControlEventValueChanged];
    return cell;
}


- (void) pressSwitch: (UISwitch*) Aswitch {
    AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate ;
    if (Aswitch.tag == 101) {
        if (Aswitch.on == NO) {
            mydelegate.switchValue1 = NO;
        } else {
            mydelegate.switchValue1 = YES;
        }
        NSLog(@"%d",mydelegate.switchValue1);
    }
    if (Aswitch.tag == 102) {
        if (Aswitch.on == NO) {
            mydelegate.switchValue2 = NO;
        } else {
            mydelegate.switchValue2 = YES;
        }
        NSLog(@"%d",mydelegate.switchValue2);
    }
    if (Aswitch.tag == 103) {
        if (Aswitch.on == NO) {
            mydelegate.switchValue3 = NO;
        } else {
            mydelegate.switchValue3 = YES;
        }
        NSLog(@"%d",mydelegate.switchValue3);

    }
    if (Aswitch.tag == 104) {
        if (Aswitch.on == NO) {
            mydelegate.switchValue4 = NO;
        } else {
            mydelegate.switchValue4 = YES;
        }
        NSLog(@"%d",mydelegate.switchValue4);

    }
    if (Aswitch.tag == 105) {
        if (Aswitch.on == NO) {
            mydelegate.switchValue5 = NO;
        } else {
            mydelegate.switchValue5 = YES;
        }
        NSLog(@"%d",mydelegate.switchValue5);

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
