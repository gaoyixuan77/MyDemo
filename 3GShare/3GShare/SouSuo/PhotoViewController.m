//
//  PhotoViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/24.
//

#import "PhotoViewController.h"
#import "FaBuViewController.h"

@interface PhotoViewController ()


@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.num = 0;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"选择图片";
    UIBarButtonItem *buttonUP = [[UIBarButtonItem alloc] initWithTitle:@"上传" style:UIBarButtonItemStylePlain target:self action:@selector(pressUPImage)];
    [buttonUP setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = buttonUP;
    self.title = @"选择图片";

    
    self.scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scroll.contentSize = CGSizeMake(self.view.bounds.size.width, 900);
    self.scroll.bounces = NO;
    self.scroll.alwaysBounceHorizontal = NO;
    
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 4; j++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            NSString *str = [NSString stringWithFormat:@"photo%d.jpg",i * 4 + j + 1];
            UIImage *image = [UIImage imageNamed:str];
            NSLog(@"%@", image);
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"xuanzhong.png"] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            [button setImageEdgeInsets:UIEdgeInsetsMake(0, 49, 59, 0)];
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            button.tag = i * 4 + j + 1;
            button.frame = CGRectMake(j * 99, i * 99, 95, 95);
            [self.scroll addSubview:button];
        }
    }
    
    [self.view addSubview:self.scroll];
}

- (void)pressButton: (UIButton*)button {
    if (button.isSelected == NO) {
        button.selected = YES;
        self.Atag = button.tag;
        self.num++;
    } else {
        button.selected = NO;
        self.num--;
        if (button.tag == self.Atag) {
            self.Atag = 0;
        }
    }
}

- (void)pressUPImage {
    NSString *strImage = [NSString stringWithFormat:@"photo%ld.jpg",self.Atag];
    [self.delegate photoMode:[UIImage imageNamed:strImage] numMode:self.num];
    [self.navigationController popViewControllerAnimated:YES];
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
