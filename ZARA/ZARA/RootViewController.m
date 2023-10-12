//
//  RootViewController.m
//  ZARA
//
//  Created by Eleven on 2023/6/12.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image1 = [UIImage imageNamed:@"shouye.png"];
    UITabBarItem *btn1 = [[UITabBarItem alloc] initWithTitle:@"首页" image:image1 tag:101];
    self.tabBarItem = btn1;
    
    //设置滚动视图的按钮
    _btnl = [UIButton buttonWithType:UIButtonTypeSystem];
    _btnr = [UIButton buttonWithType:UIButtonTypeSystem];
    _btnl.frame = CGRectMake(4, 426, 30, 30);
    _btnr.frame = CGRectMake(370, 426, 30, 30);
    //为按钮添加tag值方便判断应该相应执行的操作
    _btnl.tag = 111;
    _btnr.tag = 222;
    [_btnl setTitle:@"<" forState:UIControlStateNormal];
    [_btnr setTitle:@">" forState:UIControlStateNormal];
    
    //创建滚动视图，给视图添加九个图片
    _ScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(28, 130, 334, 652)];
    _ScrollView.contentSize = CGSizeMake(334 * 10, 652);
    _ScrollView.pagingEnabled = YES;
    //是否开启滚动视图的水平滚动条，因为要用页面控件所以这里就设置为NO
    _ScrollView.showsHorizontalScrollIndicator = NO;
    self.ScrollView.delegate = self;
    for (int i = 0; i < 9; i++) {
        if (i == 0) {
            NSString *strName = [NSString stringWithFormat:@"lyx8.jpg"];
            UIImage *image = [UIImage imageNamed:strName];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            imageView.frame = CGRectMake(0, 0, 334, 652);
            [_ScrollView addSubview:imageView];
        } else {
            NSString *strName = [NSString stringWithFormat:@"lyx%d.jpg", i];
            UIImage *image = [UIImage imageNamed:strName];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            imageView.frame = CGRectMake(334 * i, 0, 334, 652);
            [_ScrollView addSubview:imageView];
        }
    }
    NSString *strName = [NSString stringWithFormat:@"lyx1.jpg"];
    UIImage *image = [UIImage imageNamed:strName];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(334 * 9, 0, 334, 652);
    [_ScrollView addSubview:imageView];
    
    [self.ScrollView setContentOffset:CGPointMake(334, 0)];
    
    //为两个按钮添加相应的事件函数
    [_btnl addTarget:self action:@selector(scrollChange:) forControlEvents:UIControlEventTouchUpInside];
    [_btnr addTarget:self action:@selector(scrollChange:) forControlEvents:UIControlEventTouchUpInside];
    
    //创建一个页面控件
    self.page = [[UIPageControl alloc] init];
    //将页面控件的页面数置为8，是我们添加的图片数
    self.page.numberOfPages = 8;
    //将页面控件一开始的位置置于页面为0的位置
    self.page.currentPage = 0;
    //设置页面控件的小圆点的位置
    self.page.frame = CGRectMake(50, 700, 300, 20);
    //设置页面控件的小圆点的颜色
    self.page.currentPageIndicatorTintColor = [UIColor whiteColor];
    
    [self.view addSubview:_btnl];
    [self.view addSubview:_btnr];
    [self.view addSubview:_ScrollView];
    [self.view addSubview:_page];
    //将页面控件显示在父视图的前面
    [self.view bringSubviewToFront:_page];
    
}

//在翻页过程的方法中写
//在翻页滑动的过程中，对每一次翻页的偏移量进行判断以对页面控件的页数进行赋值
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //定义一个office变量做为滑动滚动视图时的偏移量
    CGFloat office = _ScrollView.contentOffset.x;
    //NSLog(@"%f", office);
    //当滑动滚动视图的偏移量超过屏幕宽度的一半时，也当作翻了一次页
    office = office + 334 / 2;
    //页面视图的页数就相当于整个滚动视图偏移量除以屏幕宽度
    int page2 = office / 334 - 1;
    self.page.currentPage = page2;
    
}

//按钮的事件函数
- (void)scrollChange: (UIButton*) btn {
    //定义一个变量来记录当前所在的页数
    //currentPage方法返回的是当前页面控件的页数
    NSInteger page3 = _page.currentPage + 1;
    //对按钮的tag值进行判断
    if (btn.tag == 111) {
        //当选择向左滑按钮，且滚动视图位于第一张图片时，按下按钮就将页数跳到最后一张图片
        if (page3 == 1) {
            page3 = 8;
            [self.ScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
            [self.ScrollView setContentOffset:CGPointMake(9 * 334, 0)];
        } else {
            //滚动视图不在第一张图片的时候，每次按下按钮，页数就光是向前跳一张
            page3--;
            [self.ScrollView setContentOffset:CGPointMake(page3 * 334, 0) animated:YES];
        }
    }
    if (btn.tag == 222) {
        //当选择向右按钮的时候，且滚动视图位于最后一张图片的时候，按下按钮就将页数跳到第一章图片
        if (page3 == 8) {
            page3 = 0;
            [self.ScrollView setContentOffset:CGPointMake(9 * 334, 0) animated:YES];
            [self.ScrollView setContentOffset:CGPointMake(0, 0)];
        } else {
            //当滚动视图不在最后一张图片的时候，按下按钮就光是页数向后跳一张
            page3++;
            [self.ScrollView setContentOffset:CGPointMake(page3 * 334, 0) animated:YES];
        }
    }
    //根据上方代码确定的页数，将当前视图跳转到指定的位置
    //setContentOffset方法的功能是跳转到你指定内容的坐标
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger pageX = self.ScrollView.contentOffset.x/167;
    NSLog(@"%f",self.ScrollView.contentOffset.x);
    if (pageX == 18) {
        [self.ScrollView setContentOffset:CGPointMake(334, 0)];
    }
    if (pageX == 0) {
        [self.ScrollView setContentOffset:CGPointMake(334 * 8, 0)];
    }
}
 


@end
