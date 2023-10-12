//
//  SegmentViewController.m
//  ZARA
//
//  Created by Eleven on 2023/7/15.
//

#import "SegmentViewController.h"

@interface SegmentViewController ()

@end

@implementation SegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image1 = [UIImage imageNamed:@"jifen_1.png"];
    UITabBarItem *btn1 = [[UITabBarItem alloc] initWithTitle:@"分类" image:image1 tag:101];
    self.tabBarItem = btn1;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(28, 130, 334, 652)];
    self.scrollView.contentSize = CGSizeMake(334 * 5, 652);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    for (int i = 0; i < 4; i++) {
        if (i == 0) {
            UIImage *image = [UIImage imageNamed:@"lyx3.jpg"];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            imageView.frame = CGRectMake(0, 0, 334, 652);
            [self.scrollView addSubview:imageView];
        } else {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"lyx%d.jpg",i]];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            imageView.frame = CGRectMake(334 * i, 0, 334, 652);
            [self.scrollView addSubview:imageView];
        }
    }
    UIImage *image = [UIImage imageNamed:@"lyx1.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(334 * 4, 0, 334, 652);
    [self.scrollView addSubview:imageView];
    
    [self.scrollView setContentOffset:CGPointMake(334, 0)];
    
    [self.view addSubview:self.scrollView];
    
    self.page = [[UIPageControl alloc] initWithFrame:CGRectMake(50, 700, 300, 20)];
    self.page.numberOfPages = 3;
    self.page.currentPage = 0;
    self.page.currentPageIndicatorTintColor = [UIColor whiteColor];
    [self.view addSubview:self.page];
    
    self.segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(45, 80, 300, 52)];
    [self.segment insertSegmentWithTitle:@"男士" atIndex:0 animated:YES];
    [self.segment insertSegmentWithTitle:@"女士" atIndex:1 animated:YES];
    [self.segment insertSegmentWithTitle:@"儿童" atIndex:2 animated:YES];
    self.segment.selectedSegmentIndex = 0;
    [self.segment addTarget:self action:@selector(indexChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segment];
}

- (void)indexChange: (UISegmentedControl*)segment {
    if (segment.selectedSegmentIndex == 0) {
        [self.scrollView setContentOffset:CGPointMake(334, 0) animated:YES];
    }
    if (segment.selectedSegmentIndex == 1) {
        [self.scrollView setContentOffset:CGPointMake(334 * 2, 0) animated:YES];
    }
    if (segment.selectedSegmentIndex == 2) {
        [self.scrollView setContentOffset:CGPointMake(334 * 3, 0) animated:YES];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger pageX = self.scrollView.contentOffset.x/167;
    self.segment.selectedSegmentIndex = (pageX - 1)/2;
    self.page.currentPage = self.segment.selectedSegmentIndex;
    NSLog(@"%ld",pageX);
    if (pageX == 8) {
        [self.scrollView setContentOffset:CGPointMake(334, 0)];
    }
    if (pageX == 0) {
        [self.scrollView setContentOffset:CGPointMake(1160, 0)];
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
