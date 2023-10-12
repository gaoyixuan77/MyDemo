//
//  ImageTableViewCell.m
//  3GShare
//
//  Created by Eleven on 2023/7/21.
//

#import "ImageTableViewCell.h"

@interface ImageTableViewCell ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSTimer *timer;

@end


@implementation ImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(374 * 6, 150);
    for (int i = 0; i < 5; i++) {
        if (i == 0) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xxp4.jpg"]];
            imageView.frame = CGRectMake(0, 0, 374, 150);
            [self.scrollView addSubview:imageView];
        } else {
            NSString *strImage = [NSString stringWithFormat:@"xxp%d.jpg",i];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:strImage]];
            imageView.frame = CGRectMake(i * 374, 0, 374, 150);
            [self.scrollView addSubview:imageView];
        }
    }
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xxp1.jpg"]];
    imageView.frame = CGRectMake(374 * 5, 0, 374, 150);
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(pressImage) userInfo:nil repeats:YES];

    [self.scrollView setContentOffset:CGPointMake(374, 0)];
    [self.scrollView addSubview:imageView];
    [self.contentView addSubview:self.scrollView];
    return self;
}

- (void)layoutSubviews {
    self.scrollView.frame = CGRectMake(8, 0, 374, 150);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger thePage = self.scrollView.contentOffset.x / 374;
    if (thePage == 0) {
        [self.scrollView setContentOffset:CGPointMake(374 * 5, 0)];
    }
}


- (void)pressImage {
    NSInteger pageX = self.scrollView.contentOffset.x / 374;
    if (pageX == 5) {
        [self.scrollView setContentOffset:CGPointMake(374, 0) animated:NO];
        [self.scrollView setContentOffset:CGPointMake(374 * 2, 0) animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(374 * (pageX + 1), 0) animated:YES];
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
