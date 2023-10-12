//
//  ViewController.m
//  网络请求
//
//  Created by Eleven on 2023/8/1.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //先设置一个输入框并设置代理
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 200, 374, 40)];
    self.textField.delegate = self;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
    
    self.tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 250, self.view.bounds.size.width, self.view.bounds.size.height - 300)];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"id"];
    [self.view addSubview:self.tabView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField resignFirstResponder];
}

//首先先写一个创建网络请求的函数
//创建网络请求五大步骤：
//1. 创建URL请求地址
//2. 创建请求类
//3. 创建会话
//4. 根据会话创建任务
//5. 执行任务
- (void)creatURL {
    //该代码是根据我们的API的地址来创建一个URL，输入框中输入的内容就会被放入该地址，通过后面的服务器响应函数，我们就能通过该地址获得服务器返回的数据
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://geoapi.qweather.com/v2/city/lookup?location=%@&key=a7b9eca504f04d4d88216d70cc39ff69",self.textField.text]];
    //根据URL创建一个请求类
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //创建一个会话，其中NSURLSessionConfiguration用于配置NSSession对象的行为，这里传入的[NSOperationQueue mainQueue]是指协议方法在主线程中执行
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    //根据会话创建任务
    NSURLSessionTask *task = [session dataTaskWithRequest:request];
    //执行任务
    [task resume];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [self creatURL];
    
    return YES;
}

//接收服务器响应
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    //若data属性为空时为其创建实例对象，若不为空，则将其长度置为0来清除原数据，以便我们可以将新的响应数据存入该NSMutableData
    if (self.data == nil) {
        self.data = [[NSMutableData alloc] init];
    } else {
        self.data.length = 0;
    }
    
    //completionHandler(NSURLSessionResponseAllow)是一个函数参数，它的作用是在数据任务完成时通知系统我们可以接受响应结果
    //如果我们想要拒绝响应结果，就可以将NSURLSessionResponseReject作为参数传递给它
    completionHandler(NSURLSessionResponseAllow);
}

//接受到数据函数，该函数在每当我们接受到一次数据时就会调用一次
-(void)URLSession:(NSURLSession *)session dataTask:( NSURLSessionDataTask *)dataTask didReceiveData:( NSData *)data {
    //该函数名中的“data”就是我们接收到的数据
    //接收后，我们将该数据存入NSMutableData中，以便在后面的函数来解析数据
    [self.data appendData:data];
    
    //为arrWeNeed属性初始化
    self.arrWeNeed = [[NSMutableArray alloc] init];
}

//数据请求完成或者请求出错函数(重点）
//调用到该函数的时候，说明我们的网络请求已经获取到的数据，要么就是网络请求失败了，因此我们要对其判断是否失败，然后进行相应的操作
-(void)URLSession:(NSURLSession *)session task:( NSURLSessionTask *)task didCompleteWithError:( NSError *)error {
    //判断请求是否失败
    if (error == nil) {
        //创建一个字典来存储data中json数据编译后的数据
        //通过编译后的json数据会转化为一个字典，我们可以通过将URL中那个地址复制到浏览器上查看json数据，然后再将json数据赋值到json编译器中查看编译后的数据
        //编译后的数据是一个字典，它的key是“location”，value是若干个数组（每个数组的元素又是一个字典）。该数组中的数据就包含着我们所需要的数据，接下来我们来演示如何使用这些数据
        NSMutableDictionary *dictBianYi = [NSJSONSerialization JSONObjectWithData:self.data options:kNilOptions error:nil];
        
        //初始化一个数组，该数组用来获取上面字典中的value，该value是若干个数组（每个数组的元素又是一个字典）
        NSMutableArray *arrValue = [[NSMutableArray alloc] init];
        //获取名为location的键对应的数组，并将该数组赋给arrValue
        arrValue = dictBianYi[@"location"];
        
        //通过一个for循环，依次从获取到的数组中取出我们需要的值并放入arrWeNeed数组
        //arrWeNeed数组中的每个元素又是一个字典，因此我们可以在每个数组中通过相应的key取到它们的value，value就是我们最终要输出的值
        for (int i = 0; i < arrValue.count; i++) {
            NSMutableString *str = [NSMutableString stringWithFormat:@"%@ - %@", arrValue[i][@"name"], arrValue[i][@"adm1"]];
            [self.arrWeNeed addObject:str];
        }
    } else {
        NSLog(@"errol = %@", error);
    }
    
    [self.tabView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrWeNeed.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cellNil = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mm"];
    for (int i = 0; i < self.arrWeNeed.count; i++) {
        if (indexPath.row == i) {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%d",i]];
            cell.textLabel.text = [NSString stringWithFormat:@"%@",self.arrWeNeed[i]];
            return cell;
        }
    }
    return cellNil;
}

@end
