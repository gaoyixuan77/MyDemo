//
//  TianQiViewController.m
//  天气预报
//
//  Created by Eleven on 2023/7/31.
//

#import "TianQiViewController.h"
#import "SouSuoViewController.h"
#import "ShouYeTableViewCell.h"
#import "ButtonTableViewCell.h"
#import "WeathViewController.h"
#import "AppDelegate.h"
#import "gunDongViewController.h"

@interface TianQiViewController ()


@property (nonatomic) NSMutableArray *numArray;
@property (nonatomic) NSMutableArray *cityArray;
@property (nonatomic) NSMutableArray *iconArray;
@property (nonatomic, strong) UITableView *tabView;

@property (nonatomic) NSMutableArray *getDictArray;

@end

@implementation TianQiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tabView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.tabView registerClass:[ShouYeTableViewCell class] forCellReuseIdentifier:@"id1"];
    [self.tabView registerClass:[ButtonTableViewCell class] forCellReuseIdentifier:@"id2"];
    [self.view addSubview:self.tabView];
    
    self.numArray = [[NSMutableArray alloc] init];
    self.cityArray = [[NSMutableArray alloc] init];
    self.iconArray = [[NSMutableArray alloc] init];
    self.getDictArray = [[NSMutableArray alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getDictionary:) name:@"cityDict" object:nil];
}

- (void) getDictionary: (NSNotification*) sender {
    [self.getDictArray addObject:sender.userInfo];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cityArray.count + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.cityArray.count) {
        return 50;
    }
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    for (int i = 0; i < self.cityArray.count; i++) {
        if (indexPath.row == i) {
            ShouYeTableViewCell *cellShouYe = [[ShouYeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%d",i]];
            [cellShouYe setSelectionStyle:UITableViewCellSelectionStyleNone];
            cellShouYe.cityNameLabel.text = [NSString stringWithFormat:@"%@", self.cityArray[i]];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"back%@.jpg", self.iconArray[i]]]];
            imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 120);
            cellShouYe.backgroundView = imageView;
            return cellShouYe;
        }
    }
    ButtonTableViewCell *cellButton = [[ButtonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"aaa"]];
    [cellButton.button addTarget:self action:@selector(pressSouSuo) forControlEvents:UIControlEventTouchUpInside];
    return cellButton;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    gunDongViewController *gunViewController = [[gunDongViewController alloc] init];
    gunViewController.arrDictArray = self.getDictArray;
    gunViewController.cityArray = self.cityArray;
    gunViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    gunViewController.location = indexPath.row;
    [self presentViewController:gunViewController animated:YES completion:nil];
}

- (void) pressSouSuo {
    SouSuoViewController *sousuo = [[SouSuoViewController alloc] init];
    sousuo.addNumBackBlock = ^(id num) {
        if (num != nil) {
            [self.numArray addObject:num];
            NSLog(@"%@", self.numArray);
            [self.tabView reloadData];
        }
    };
    sousuo.addCityBackBlock = ^(NSString *cityName) {
        NSLog(@"%@", cityName);
        if (cityName != nil) {
            [self.cityArray addObject:cityName];
            NSLog(@"%@", self.cityArray);
            [self.tabView reloadData];
        }
        NSLog(@"%lu", (unsigned long)self.cityArray.count);
    };
    sousuo.addIconBackBlock = ^(id icon) {
        if (icon != nil) {
            [self.iconArray addObject: icon];
            [self.tabView reloadData];
        }
    };
    [self.navigationController pushViewController:sousuo animated:YES];
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
