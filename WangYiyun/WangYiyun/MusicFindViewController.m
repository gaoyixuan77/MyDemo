//
//  MusicFindViewController.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/20.
//

#import "MusicFindViewController.h"

@interface MusicFindViewController ()

@end

@implementation MusicFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"maikefeng-2.png"]];
    imageView.frame = CGRectMake(120, 300, 150, 150);
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"正在聆听......";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:24];
    label.frame = CGRectMake(130, 470, 200, 50);
    
    [self.view addSubview:imageView];
    [self.view addSubview:label];
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
