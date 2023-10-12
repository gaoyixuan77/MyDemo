//
//  WeathViewController.m
//  天气预报
//
//  Created by Eleven on 2023/8/1.
//

#import "WeathViewController.h"
#import "WeathTableViewCell.h"
#import "AppDelegate.h"
#import "OtherTableViewCell.h"

@interface WeathViewController ()

@property (nonatomic) BOOL quXiao;

@property (nonatomic, strong) UIScrollView *bigScroll;
@property (nonatomic) id icon;
@property (nonatomic, strong) UILabel *cityNameLabel;
@property (nonatomic, strong) UILabel *weathLabel;
@property (nonatomic, strong) UILabel *wenDuLabel;
@property (nonatomic, strong) UILabel *xingQiLabel;
@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableData *data2;
@property (nonatomic, strong) NSMutableData *data3;
@property (nonatomic, strong) NSMutableData *data4;
@property (nonatomic, strong) NSMutableData *data5;


@property (nonatomic) NSURLSessionTask *dataTask2;
@property (nonatomic) NSURLSessionTask *dataTask3;
@property (nonatomic) NSURLSessionTask *dataTask4;
@property (nonatomic) NSURLSessionTask *dataTask5;


@property (nonatomic) NSArray *xiangQingArray;
@property (nonatomic) NSMutableArray *yuCeArray;
@property (nonatomic) NSMutableArray *hourArray;

@property (nonatomic) NSMutableArray *yuBaoArray;

@property (nonatomic) NSMutableArray *arr2;
@property (nonatomic) NSMutableArray *arr4;

@property (nonatomic) NSMutableArray *locationNumArray;

//time

@property (nonatomic) NSDate *dataNow;
@property (nonatomic) NSMutableArray *arrNextTimeArray;

//Other

@property (nonatomic) NSString *shiDuStr;
@property (nonatomic) NSString *fengDuStr;
@property (nonatomic) NSString *tiGanWenDuStr;
@property (nonatomic) NSString *daQiYaQiangStr;
@property (nonatomic) NSString *nengJianDuStr;
@property (nonatomic) NSString *yunDongStr;
@property (nonatomic) NSString *pingJiaStr;


@end

@implementation WeathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIBarButtonItem *buttonAdd = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(pressAdd)];
    self.navigationItem.rightBarButtonItem = buttonAdd;
    [buttonAdd setTintColor:[UIColor systemBlueColor]];
    
    UIBarButtonItem *buttonCancer = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(pressCancer)];
    self.navigationItem.leftBarButtonItem = buttonCancer;
    [buttonCancer setTintColor:[UIColor systemBlueColor]];

    
    self.bigScroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.bigScroll.contentSize = CGSizeMake(self.view.bounds.size.width, 1200);
    [self.view addSubview:self.bigScroll];
        
//    NSLog(@"跳转");
    self.cityNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, 60)];
    self.cityNameLabel.text = self.cityID;
    self.cityNameLabel.textColor = [UIColor whiteColor];
    self.cityNameLabel.numberOfLines = 1;
    self.cityNameLabel.textAlignment = NSTextAlignmentCenter;
    self.cityNameLabel.font = [UIFont systemFontOfSize:42];
    [self.bigScroll addSubview:self.cityNameLabel];
    self.weathLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, self.view.bounds.size.width, 40)];
    self.weathLabel.textColor = [UIColor whiteColor];
    self.weathLabel.font = [UIFont systemFontOfSize:18];
    self.weathLabel.textAlignment = NSTextAlignmentCenter;
    [self.bigScroll addSubview:self.weathLabel];
    self.wenDuLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, self.view.bounds.size.width, 80)];
    self.wenDuLabel.textColor = [UIColor whiteColor];
    self.wenDuLabel.font = [UIFont systemFontOfSize:72];
    self.wenDuLabel.textAlignment = NSTextAlignmentCenter;
    [self.bigScroll addSubview:self.wenDuLabel];
    
    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 270, self.view.bounds.size.width, 200)];
    self.scroll.delegate = self;
    self.scroll.contentSize = CGSizeMake(120 * 24 + 20, 200);
    [self.bigScroll addSubview:self.scroll];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 480, self.view.bounds.size.width, 750) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.4 alpha:0.3];
    [self.tableView registerClass:[WeathTableViewCell class] forCellReuseIdentifier:@"id"];
    [self.bigScroll addSubview:self.tableView];
    
    self.dataNow = [NSDate date];
    self.xingQiLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 240, 200, 30)];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    unsigned unitFlags = NSCalendarUnitWeekday;
    NSDateComponents *comp = [gregorian components: unitFlags fromDate: _dataNow];
    self.xingQiLabel.text = [self xingQi: comp.weekday];
    self.xingQiLabel.textColor = [UIColor whiteColor];
    [self.bigScroll addSubview:self.xingQiLabel];
    
    self.arrNextTimeArray = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 7; i++) {
        NSDate *dataNext = [[NSDate alloc] initWithTimeIntervalSinceNow:3600 * 24 * i];
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
        unsigned unitFlags = NSCalendarUnitWeekday;
        NSDateComponents *comp = [gregorian components: unitFlags fromDate: dataNext];
        [self.arrNextTimeArray addObject:[NSString stringWithFormat:@"%@", [self xingQi:comp.weekday]]];
    }
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
    for (int i = 0; i < 7; i++) {
        if (indexPath.row == i) {
            WeathTableViewCell *cell = [[WeathTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%d",i]];
            cell.wenDuHeighLabel.text = self.yuBaoArray[i][1];
            cell.wenDuLowLabel.text = self.yuBaoArray[i][2];
            cell.timeLabel.text = self.arrNextTimeArray[i];
            cell.timeWeathImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"weath%@.png", self.yuBaoArray[i][0]]];
            return cell;
        }
    }
    if (indexPath.row == 7) {
        UITableViewCell *cellPingLun = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"pingLun"];
        cellPingLun.backgroundColor = [UIColor clearColor];
        cellPingLun.textLabel.text = self.pingJiaStr;
        cellPingLun.textLabel.numberOfLines = 2;
        cellPingLun.textLabel.textColor = [UIColor whiteColor];
        return cellPingLun;
    }
    if (indexPath.row == 8) {
        OtherTableViewCell *cell1 = [[OtherTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        cell1.biaoTi1Label.text = @"湿度";
        cell1.biaoTi2Label.text = @"风速";
        cell1.neiRong1Label.text = self.shiDuStr;
        cell1.neiRong2Label.text = self.fengDuStr;
        return cell1;
    }
    if (indexPath.row == 9) {
        OtherTableViewCell *cell2 = [[OtherTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
        cell2.biaoTi1Label.text = @"体感温度";
        cell2.biaoTi2Label.text = @"气压";
        cell2.neiRong1Label.text = self.tiGanWenDuStr;
        cell2.neiRong2Label.text = self.daQiYaQiangStr;
        return cell2;
    }
    if (indexPath.row == 10) {
        OtherTableViewCell *cell3 = [[OtherTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
        cell3.biaoTi1Label.text = @"能见度";
        cell3.biaoTi2Label.text = @"运动指数";
        cell3.neiRong1Label.text = self.nengJianDuStr;
        cell3.neiRong2Label.text = self.yunDongStr;
        return cell3;
    }
    return cellNil;
}

- (void) creatURL {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://devapi.qweather.com/v7/weather/7d?location=%@&key=e73211958cf84a7e8ce990e3486e747e",self.num]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionTask *task2 = [session dataTaskWithRequest:request];
    self.dataTask2 = task2;
    NSLog(@"%@", url);
    [task2 resume];
    
    NSURL *url2 = [NSURL URLWithString:[NSString stringWithFormat:@"https://devapi.qweather.com/v7/weather/now?location=%@&key=e73211958cf84a7e8ce990e3486e747e",self.num]];
    NSURLRequest *request2 = [NSURLRequest requestWithURL:url2];
    NSURLSessionConfiguration *config2 = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session2 = [NSURLSession sessionWithConfiguration:config2 delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionTask *task3 = [session2 dataTaskWithRequest:request2];
    self.dataTask3 = task3;
    NSLog(@"%@", url2);
    [task3 resume];
    
    NSURL *url3 = [NSURL URLWithString:[NSString stringWithFormat:@"https://devapi.qweather.com/v7/weather/24h?location=%@&key=e73211958cf84a7e8ce990e3486e747e",self.num]];
    NSURLRequest *request3 = [NSURLRequest requestWithURL:url3];
    NSURLSessionConfiguration *config3 = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session3 = [NSURLSession sessionWithConfiguration:config3 delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionTask *task4 = [session3 dataTaskWithRequest:request3];
    self.dataTask4 = task4;
    NSLog(@"%@", url3);
    [task4 resume];
    
    NSURL *url4 = [NSURL URLWithString:[NSString stringWithFormat:@"https://devapi.qweather.com/v7/indices/1d?type=1,2&location=%@&key=e73211958cf84a7e8ce990e3486e747e",self.num]];
    NSURLRequest *request4 = [NSURLRequest requestWithURL:url4];
    NSURLSessionConfiguration *config4 = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session4 = [NSURLSession sessionWithConfiguration:config4 delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionTask *task5 = [session4 dataTaskWithRequest:request4];
    NSLog(@"%@", url4);
    self.dataTask5 = task5;
    [task5 resume];
}


-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    if (dataTask == self.dataTask2) {
        if (self.data2 == nil) {
            self.data2 = [[NSMutableData alloc] init];
        } else {
            self.data2.length = 0;
        }
        completionHandler(NSURLSessionResponseAllow);
    }
    if (dataTask == self.dataTask3) {
        if (self.data3 == nil) {
            self.data3 = [[NSMutableData alloc] init];
        } else {
            self.data3.length = 0;
        }
        completionHandler(NSURLSessionResponseAllow);
    }
    if (dataTask == self.dataTask4) {
        if (self.data4 == nil) {
            self.data4 = [[NSMutableData alloc] init];
        } else {
            self.data4.length = 0;
        }
        completionHandler(NSURLSessionResponseAllow);
    }
    if (dataTask == self.dataTask5) {
        if (self.data5 == nil) {
            self.data5 = [[NSMutableData alloc] init];
        } else {
            self.data5.length = 0;
        }
        completionHandler(NSURLSessionResponseAllow);
    }
}

-(void)URLSession:(NSURLSession *)session dataTask:( NSURLSessionDataTask *)dataTask didReceiveData:( NSData *)data {
    
    
    if (dataTask == self.dataTask2) {
        [self.data2 appendData:data];
    }
    if (dataTask == self.dataTask3) {
        [self.data3 appendData:data];
    }
    if (dataTask == self.dataTask4) {
        [self.data4 appendData:data];
    }
    if (dataTask == self.dataTask5) {
        [self.data5 appendData:data];
    }
}

-(void)URLSession:(NSURLSession *)session task:( NSURLSessionTask *)task didCompleteWithError:( NSError *)error {
    if (error == nil) {
        if (task == self.dataTask2) {

            NSDictionary *dict2 = [NSJSONSerialization JSONObjectWithData:self.data2 options:kNilOptions error:nil];
            
            self.arr2 = [[NSMutableArray alloc] init];
            self.arr2 = dict2[@"daily"];
            for (int i = 0; i < self.arr2.count; i++) {
                NSArray *arrXiangQing = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%@", self.arr2[i][@"iconDay"]], [NSString stringWithFormat:@"%@", self.arr2[i][@"tempMax"]], [NSString stringWithFormat:@"%@", self.arr2[i][@"tempMin"]], nil];
                [self.yuCeArray addObject:arrXiangQing];
            }
        }
        if (task == self.dataTask3) {
            NSDictionary *dict3 = [NSJSONSerialization JSONObjectWithData:self.data3 options:kNilOptions error:nil];
           
            NSMutableDictionary *arr3 = [[NSMutableDictionary alloc] init];
            
            arr3 = dict3[@"now"];
            
            self.xiangQingArray = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%@", arr3[@"text"]], [NSString stringWithFormat:@"%@", arr3[@"temp"]], arr3[@"icon"], nil];
            self.shiDuStr = [NSString stringWithFormat:@"%@%%", arr3[@"humidity"]];
            self.fengDuStr = [NSString stringWithFormat:@"%@公里/小时", arr3[@"windSpeed"]];
            self.tiGanWenDuStr = [NSString stringWithFormat:@"%@", arr3[@"feelsLike"]];
            self.daQiYaQiangStr = [NSString stringWithFormat:@"%@百帕", arr3[@"pressure"]];
            self.nengJianDuStr = [NSString stringWithFormat:@"%@公里", arr3[@"vis"]];
            
        }
        if (task == self.dataTask4) {
            NSDictionary *dict4 = [NSJSONSerialization JSONObjectWithData:self.data4 options:kNilOptions error:nil];
            
            self.arr4 = [[NSMutableArray alloc] init];
            
            self.arr4 = dict4[@"hourly"];
            for (int i = 0; i < self.arr4.count; i++) {
                NSArray *arr = [NSArray arrayWithObjects: self.arr4[i][@"icon"], [NSString stringWithFormat:@"%@", self.arr4[i][@"temp"]], nil];
                [self.hourArray addObject:arr];
            }
        }
        if (task == self.dataTask5) {
            NSDictionary *dict5 = [NSJSONSerialization JSONObjectWithData:self.data5 options:kNilOptions error:nil];
            NSMutableArray *arr5 = [[NSMutableArray alloc] init];
            arr5 = dict5[@"daily"];
            self.yunDongStr = [NSString stringWithFormat:@"%@", arr5[0][@"level"]];
            self.pingJiaStr = [NSString stringWithFormat:@"%@", arr5[0][@"text"]];
        }
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if (task == self.dataTask2) {
                self.yuBaoArray = [NSMutableArray arrayWithArray:self.yuCeArray];
                [self.tableView reloadData];
            }
            if (task == self.dataTask3) {
                self.weathLabel.text = [NSString stringWithFormat:@"%@", self.xiangQingArray[0]];
                self.wenDuLabel.text = [NSString stringWithFormat:@"%@", self.xiangQingArray[1]];
                
                UIImageView *imageView = [[UIImageView alloc] initWithFrame: self.view.bounds];
                imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"back%@.jpg", self.xiangQingArray[2]]];
                self.icon = self.xiangQingArray[2];
                [self.view insertSubview:imageView atIndex:0];
            }
            if (task == self.dataTask4) {
                
                for (int i = 0; i < 24; i++) {
                    UILabel *wenDu = [[UILabel alloc] initWithFrame:CGRectMake(40 + 120.5 * i, 160, 100, 40)];
                    wenDu.text = self.hourArray[i][1];
                    wenDu.textColor = [UIColor whiteColor];
                    [self.scroll addSubview:wenDu];
                    
                    UILabel *hourTime = [[UILabel alloc] initWithFrame:CGRectMake(40 + 120 * i, 10, 100, 40)];
                    NSDate *dateNow = [NSDate date];
                    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
                    unsigned unitFlags = NSCalendarUnitHour;
                    NSDateComponents *comp = [gregorian components: unitFlags fromDate: dateNow];
                    hourTime.text = [NSString stringWithFormat:@"%02ld时", (comp.hour + i + 1) % 24];
                    hourTime.textColor = [UIColor whiteColor];
                    
                    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"weath%@.png", self.hourArray[i][0]]]];
                    imageV.frame = CGRectMake(20 + 120.5 * i, 65, 70, 70);
                    
                    [self.scroll addSubview:imageV];
                    [self.scroll addSubview: hourTime];
                    [self.tableView reloadData];
                }
            }
            if (task == self.dataTask5) {
                [self.tableView reloadData];
            }
        }];
        [self.tableView reloadData];
    } else {
        NSLog(@"error");
    }
}

- (void) pressAdd {
    AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate ;
    NSLog(@"%@", mydelegate.setNum);
    NSSet *set = [NSSet setWithObject:self.num];
    if ((mydelegate.setNum.count != 0) && [set isSubsetOfSet:mydelegate.setNum]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"添加失败" message:@"该地区已添加" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        self.quXiao = YES;
        [self presentViewController:alert animated:YES completion:nil];
        [self.navigationController popToRootViewControllerAnimated:YES];
        return;
    } else {
        self.addCityNameBlock(self.cityID);
        self.addWeathBlock(self.num);
        self.addIconBlock(self.icon);
        self.quXiao = NO;
        [mydelegate.setNum addObject:self.num];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void) pressCancer {
    self.quXiao = YES;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    
    self.yuCeArray = [[NSMutableArray alloc] init];
    self.hourArray = [[NSMutableArray alloc] init];
    [self creatURL];
    animated = YES;
}
    
    - (void)viewWillDisappear:(BOOL)animated {
        NSLog(@"%@", self.hourArray);
        if (_quXiao == NO) {
            NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.yuCeArray, @"yuceArray", self.xiangQingArray, @"xiangQingArray", self.shiDuStr, @"shiduStr", self.fengDuStr, @"fengDuStr", self.tiGanWenDuStr, @"tiganWenDuStr", self.daQiYaQiangStr, @"daQiYaStr", self.nengJianDuStr, @"nengJianDuStr", self.hourArray, @"hourArray", self.yunDongStr, @"yunDongStr", self.pingJiaStr, @"pingJiaStr", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"cityDict" object:nil userInfo:dictionary];
        }
    }



@end
