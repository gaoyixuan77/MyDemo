//
//  TuPianTableViewCell.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/19.
//

#import "TuPianTableViewCell.h"

@implementation TuPianTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.scroll = [[UIScrollView alloc] init];
    self.scroll.contentSize = CGSizeMake(370 * 6, 180);
    self.scroll.delegate = self;
    self.scroll.pagingEnabled = YES;
    self.scroll.showsHorizontalScrollIndicator = NO;
    
    for (int i = 0; i < 5; i++) {
        if (i == 0) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xxp4.jpg"]];
            imageView.frame = CGRectMake(0, 0, 370, 180);
            [self.scroll addSubview:imageView];
        } else {
            NSString *str = [NSString stringWithFormat:@"xxp%d.jpg",i];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:str]];
            imageView.frame = CGRectMake(370 * i, 0, 370, 180);
            [self.scroll addSubview:imageView];
        }
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(pressPic:) userInfo:nil repeats:YES];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xxp1.jpg"]];
    imageView.frame = CGRectMake(370 * 5, 0, 370, 180);
    [self.scroll addSubview:imageView];
    
    self.page = [[UIPageControl alloc] init];
    self.page.currentPage = 0;
    self.page.numberOfPages = 4;
    self.page.currentPageIndicatorTintColor = [UIColor blackColor];
    [self.scroll setContentOffset:CGPointMake(370, 0)];
    [self.contentView addSubview:self.page];
    [self.contentView addSubview:self.scroll];
    [self.scroll sendSubviewToBack:self.page];
    return self;
}


- (void)layoutSubviews {
    self.scroll.frame = CGRectMake(10, 0, 370, 180);
    self.page.frame = CGRectMake(160, 120, 100, 20);

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger thePage = self.scroll.contentOffset.x / 370;
    if (thePage == 0) {
        [self.scroll setContentOffset:CGPointMake(370 * 5, 0) animated:NO];
    }
    
}


- (void)pressPic: (TuPianTableViewCell*) cell {
    NSInteger pageX = self.scroll.contentOffset.x / 370;
    self.page.currentPage = pageX;
    if (pageX == 5) {
        [self.scroll setContentOffset:CGPointMake(370, 0) animated:NO];
        [self.scroll setContentOffset:CGPointMake(370 * 2, 0) animated:YES];
        pageX = 2;
    } else {
        [self.scroll setContentOffset:CGPointMake(370 * (pageX + 1), 0) animated:YES];
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
