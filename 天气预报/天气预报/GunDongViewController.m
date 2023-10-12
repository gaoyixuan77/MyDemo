//
//  gunDongViewController.m
//  天气预报
//
//  Created by Eleven on 2023/8/3.
//

#import "gunDongViewController.h"
#import "WeathViewController.h"
#import "WeathTableViewCell.h"
#import "OtherTableViewCell.h"

@interface gunDongViewController ()


@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic) NSMutableArray *nextTimeArray;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation gunDongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * self.arrDictArray.count, self.view.bounds.size.height);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width * self.location, 0)];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    button.frame = CGRectMake(self.view.bounds.size.width - 80, self.view.bounds.size.height - 70, 50, 50);
    [button addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, self.view.bounds.size.height -
    50, 200, 20)];
    self.pageControl.numberOfPages = self.cityArray.count;
    self.pageControl.currentPage = self.location;
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    [self.view addSubview:self.pageControl];
    
    [self.pageControl bringSubviewToFront: button];
    
    NSLog(@"%@", self.arrDictArray);
    
    for (int i = 0; i < self.arrDictArray.count; i++) {
        UIScrollView *BigScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, self.view.bounds.size.height - 80)];
        BigScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 1200);
        [self.scrollView addSubview:BigScrollView];
        
        UILabel *cityNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, 60)];
        cityNameLabel.text = self.cityArray[i];
        cityNameLabel.textColor = [UIColor whiteColor];
        cityNameLabel.numberOfLines = 1;
        cityNameLabel.textAlignment = NSTextAlignmentCenter;
        cityNameLabel.font = [UIFont systemFontOfSize:42];
        [BigScrollView addSubview:cityNameLabel];
        
        UILabel *weathLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, self.view.bounds.size.width, 40)];
        weathLabel.text = self.arrDictArray[i][@"xiangQingArray"][0];
        weathLabel.textColor = [UIColor whiteColor];
        weathLabel.font = [UIFont systemFontOfSize:18];
        weathLabel.textAlignment = NSTextAlignmentCenter;
        [BigScrollView addSubview:weathLabel];
        
        UILabel *wenDuLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, self.view.bounds.size.width, 80)];
        wenDuLabel.text = self.arrDictArray[i][@"xiangQingArray"][1];
        wenDuLabel.textColor = [UIColor whiteColor];
        wenDuLabel.font = [UIFont systemFontOfSize:72];
        wenDuLabel.textAlignment = NSTextAlignmentCenter;
        [BigScrollView addSubview:wenDuLabel];
        
        UIScrollView *hengXiangScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 270, self.view.bounds.size.width, 200)];
        hengXiangScroll.contentSize = CGSizeMake(120 * 24 + 20, 200);
        [BigScrollView addSubview:hengXiangScroll];
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 480, self.view.bounds.size.width, 750) style:UITableViewStylePlain];
        tableView.tag = i;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.scrollEnabled = NO;
        tableView.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.4 alpha:0.3];
        [tableView registerClass:[WeathTableViewCell class] forCellReuseIdentifier:@"id"];
        [BigScrollView addSubview:tableView];
        
        for (int j = 0; j < 24; j++) {
            UILabel *wenDu = [[UILabel alloc] initWithFrame:CGRectMake(40 + 120.5 * j, 160, 100, 40)];
            wenDu.text = self.arrDictArray[i][@"hourArray"][j][1];
            wenDu.textColor = [UIColor whiteColor];
            [hengXiangScroll addSubview:wenDu];
            
            UILabel *hourTime = [[UILabel alloc] initWithFrame:CGRectMake(40 + 120 * j, 10, 100, 40)];
            NSDate *dateNow = [NSDate date];
            NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
            unsigned unitFlags = NSCalendarUnitHour;
            NSDateComponents *comp = [gregorian components: unitFlags fromDate: dateNow];
            hourTime.text = [NSString stringWithFormat:@"%02ld时", (comp.hour + j + 1) % 24];
            hourTime.textColor = [UIColor whiteColor];
            
            UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"weath%@.png", self.arrDictArray[i][@"hourArray"][j][0]]]];
            imageV.frame = CGRectMake(20 + 120.5 * j, 65, 70, 70);
            
            [hengXiangScroll addSubview:imageV];
            [hengXiangScroll addSubview: hourTime];
        }
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"back%@.jpg", self.arrDictArray[i][@"xiangQingArray"][2]]];
        [self.scrollView insertSubview:imageView atIndex:0];
    }
    self.nextTimeArray = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 7; i++) {
        NSDate *dataNext = [[NSDate alloc] initWithTimeIntervalSinceNow:3600 * 24 * i];
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
        unsigned unitFlags = NSCalendarUnitWeekday;
        NSDateComponents *comp = [gregorian components: unitFlags fromDate: dataNext];
        [self.nextTimeArray addObject:[NSString stringWithFormat:@"%@", [self xingQi:comp.weekday]]];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger pageX = self.scrollView.contentOffset.x / self.view.bounds.size.width;
    self.pageControl.currentPage = pageX;
}

- (void) pressBack {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSString*) xingQi:(NSInteger) weekday {
    if (weekday == 1) {
        return @"星期日";
    }
    if (weekday == 2) {
        return @"星期一";
    }
    if (weekday == 3) {
        return @"星期二";
    }
    if (weekday == 4) {
        return @"星期三";
    }
    if (weekday == 5) {
        return @"星期四";
    }
    if (weekday == 6) {
        return @"星期五";
    }
    if (weekday == 7) {
        return @"星期六";
    }
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < 7) {
        return 50;
    }
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cellNil = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"g"];
    for (int j = 0; j < self.arrDictArray.count; j++) {
        if (tableView.tag == j) {
            for (int i = 0; i < 7; i++) {
                if (indexPath.row == i) {
                    WeathTableViewCell *cell = [[WeathTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%d",i]];
                    cell.wenDuHeighLabel.text = self.arrDictArray[j][@"yuceArray"][i][1];
                    cell.wenDuLowLabel.text = self.arrDictArray[j][@"yuceArray"][i][2];
                    cell.timeLabel.text = self.nextTimeArray[i];
                    return cell;
                }
            }
            if (indexPath.row == 7) {
                UITableViewCell *cellPingLun = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"pingLun"];
                cellPingLun.backgroundColor = [UIColor clearColor];
                cellPingLun.textLabel.text = self.arrDictArray[j][@"pingJiaStr"];
                cellPingLun.textLabel.numberOfLines = 2;
                cellPingLun.textLabel.textColor = [UIColor whiteColor];
                return cellPingLun;
            }
            if (indexPath.row == 8) {
                OtherTableViewCell *cell1 = [[OtherTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
                cell1.biaoTi1Label.text = @"湿度";
                cell1.biaoTi2Label.text = @"风速";
                cell1.neiRong1Label.text = self.arrDictArray[j][@"shiduStr"];
                cell1.neiRong2Label.text = self.arrDictArray[j][@"fengDuStr"];
                return cell1;
            }
            if (indexPath.row == 9) {
                OtherTableViewCell *cell2 = [[OtherTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
                cell2.biaoTi1Label.text = @"体感温度";
                cell2.biaoTi2Label.text = @"气压";
                cell2.neiRong1Label.text = self.arrDictArray[j][@"tiganWenDuStr"];
                cell2.neiRong2Label.text = self.arrDictArray[j][@"daQiYaStr"];
                NSLog(@"%@",cell2.neiRong1Label.text);
                return cell2;
            }
            if (indexPath.row == 10) {
                OtherTableViewCell *cell3 = [[OtherTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
                cell3.biaoTi1Label.text = @"能见度";
                cell3.biaoTi2Label.text = @"运动指数";
                cell3.neiRong1Label.text = self.arrDictArray[j][@"nengJianDuStr"];
                cell3.neiRong2Label.text = self.arrDictArray[j][@"yunDongStr"];
                return cell3;
            }
        }
    }
    return cellNil;
}


//NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.yuCe, @"yuceArray", self.xiangQing, @"xiangQingArray", self.shiDu, @"shiduStr", self.fengDu, @"fengDuStr", self.tiGanWenDu, @"tiganWenDuStr", self.daQiYaQiang, @"daQiYaStr", self.nengJianDu, @"nengJianDuStr", self.hour, @"hourArray", self.yunDong, @"yunDongStr", self.pingJia, @"pingJiaStr", nil];
//[[NSNotificationCenter defaultCenter] postNotificationName:@"cityDict" object:nil userInfo:dictionary];

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
