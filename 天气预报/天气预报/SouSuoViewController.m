//
//  SouSuoViewController.m
//  天气预报
//
//  Created by Eleven on 2023/7/31.
//

#import "SouSuoViewController.h"
#import "WeathViewController.h"
#import "AppDelegate.h"

@interface SouSuoViewController ()


@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) NSMutableData *data1;


@property (nonatomic, strong) UITableView *tabView;

@property (nonatomic) NSMutableArray *cityArray;
@property (nonatomic) NSMutableArray *locationNumArray;

@property (nonatomic) NSURLSessionTask *dataTask1;

@property (nonatomic) NSMutableArray *Aarr;
@property (nonatomic) NSMutableArray *cityNameLArray;

@end

@implementation SouSuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 374, 40)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.delegate = self;
    self.textField.placeholder = @"输入要添加的地区";
    [self.view addSubview:self.textField];
    
    self.tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 150, self.view.bounds.size.width, self.view.bounds.size.height - 200)];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"id"];
    [self.view addSubview:self.tabView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];
    return YES;
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //创建URL
    NSString *URLString = [[NSString stringWithFormat:@"https://geoapi.qweather.com/v2/city/lookup?location=%@&key=e73211958cf84a7e8ce990e3486e747e", self.textField.text] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    NSLog(@"%@", URLString);
    NSURL *url = [NSURL URLWithString:URLString];
    //创建会话
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    //创建请求类
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //创建任务
    NSURLSessionTask *task1 = [session dataTaskWithRequest:request];
    //执行任务
    self.dataTask1 = task1;
    NSLog(@"%@", URLString);
    [task1 resume];

    return YES;
}


//接受服务器响应函数
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    if (dataTask == self.dataTask1) {
        if (self.data1 == nil) {
            self.data1 = [[NSMutableData alloc] init];
        } else {
            self.data1.length = 0;
        }
        //NSURLSessionResponseAllow是一个NSURLSession的枚举类型，表示我们接受响应结果。
        completionHandler(NSURLSessionResponseAllow);
    }
}

//接收到数据，该函数可以被调用多次
-(void)URLSession:(NSURLSession *)session dataTask:( NSURLSessionDataTask *)dataTask didReceiveData:( NSData *)data {
    //将数据追加到self.data对象中
    self.cityArray = [[NSMutableArray alloc] init];
    self.locationNumArray = [[NSMutableArray alloc] init];
    self.cityNameLArray = [[NSMutableArray alloc] init];
    //NSLog(@"aaaaaaaaa");
    if (dataTask == self.dataTask1) {
        [self.data1 appendData:data];
    }
}

//数据请求完成或请求出错
-(void)URLSession:(NSURLSession *)session task:( NSURLSessionTask *)task didCompleteWithError:( NSError *)error {
    if (error == nil) {
        //NSLog(@"1");
        //dict即为我们获取到的数据,获取后该行代码会将json格式解析为代码格式
        //转化后我们得到的就是一个字典，该字典的key为code，value是一个包含我们需要的数据的数组
        if (task == self.dataTask1) {
//            NSLog(@"task1");
            
            NSDictionary *dict1 = [NSJSONSerialization JSONObjectWithData:self.data1 options:kNilOptions error:nil];
            
            self.Aarr = [[NSMutableArray alloc] init];
            
            self.Aarr = dict1[@"location"];
            for (int i = 0; i < self.Aarr.count; i++) {
                NSMutableString *str = [NSMutableString stringWithFormat:@"%@ - %@", self.Aarr[i][@"adm1"], self.Aarr[i][@"name"]];
                NSString *strNum = [NSString stringWithFormat:@"%@", self.Aarr[i][@"id"]];
                [self.cityNameLArray addObject:[NSString stringWithFormat:@"%@", self.Aarr[i][@"name"]]];
                [self.cityArray addObject:str];
                [self.locationNumArray addObject:strNum];
            }
            
        } else {
            NSLog(@"error = %@", error);
        }
        [self.tabView reloadData];
        
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cityArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cellNil = [[UITableViewCell alloc] init];
    for (int i = 0; i < self.cityArray.count; i++) {
        if (indexPath.row == i) {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%d",i]];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            cell.textLabel.text = [NSString stringWithFormat:@"%@",self.cityArray[i]];
            return cell;
        }
    }
    return cellNil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    for (int i = 0; i < self.cityArray.count; i++) {
        if (indexPath.row == i) {
            
            WeathViewController *weath = [[WeathViewController alloc] init];
            weath.cityID = self.cityNameLArray[i];
            weath.num = self.locationNumArray[i];
            weath.addWeathBlock = ^(id num) {
                if (num != nil) {
                    self.addNumBackBlock(num);
                }
            };
            weath.addCityNameBlock = ^(NSString *cityName) {
                if (cityName != nil) {
                    self.addCityBackBlock(cityName);
                }
            };
            weath.addIconBlock = ^(id icon) {
                if (icon != nil) {
                    self.addIconBackBlock(icon);
                }
            };
            AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate ;
            mydelegate.TianJia = YES;
            [self.navigationController pushViewController:weath animated:YES];
            return;
        }
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
