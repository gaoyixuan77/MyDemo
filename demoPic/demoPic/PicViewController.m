//
//  PicViewController.m
//  demoPic
//
//  Created by Eleven on 2023/8/30.
//

#import "PicViewController.h"
#import "Masonry.h"

@interface PicViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *backButton;

@end

@implementation PicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height*2);
    [self.view addSubview:self.scrollView];
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 3; j++) {
            UIButton *pictureButton = [UIButton buttonWithType:UIButtonTypeCustom];
            NSString *strPic = [NSString stringWithFormat:@"pict%d.jpg",3 * i + j + 1];
            UIImage *image = [UIImage imageNamed:strPic];
            [pictureButton setBackgroundImage:image forState:UIControlStateNormal];
            [self.scrollView addSubview:pictureButton];
            [pictureButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(110 * j + 30);
                make.top.mas_equalTo(200 * i + 50);
                make.width.and.height.mas_equalTo(@100);
            }];
            pictureButton.selected = NO;
            pictureButton.tag = i*10+j;
            [pictureButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (void)pressButton :(UIButton*)button {
    if (button.selected == NO) {
        [self.scrollView bringSubviewToFront:button ];
        [button mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.width.and.height.mas_equalTo(@300);
        }];
        button.selected = YES;
    } else {
        [self.scrollView addSubview:button];
        NSInteger j = button.tag%10;
        NSInteger i = button.tag/10;
        [button mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(110 * j + 30);
            make.top.mas_equalTo(200 * i + 50);
            make.width.and.height.mas_equalTo(@100);
        }];
        button.selected = NO;
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
