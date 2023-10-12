//
//  ViewController.h
//  网络请求
//
//  Created by Eleven on 2023/8/1.
//

#import <UIKit/UIKit.h>

//在开始网络请求前，要遵守NSURLSessionDelegate协议，该协议包含一些网络请求相关的函数
@interface ViewController : UIViewController<NSURLSessionDelegate, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

//在这里我们使用输入框来为网络请求项添加信息，并使用单元格来显示获取的信息
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITableView *tabView;

//NSMutableData用于存储和修改json数据（它也可以存储视频、音频、图片等），将其初始化为一个空的数组或字典
@property (nonatomic, strong) NSMutableData *data;

//定义一个数组用于存放我们获取到的需要的数据
@property (nonatomic, strong) NSMutableArray *arrWeNeed;

@end

