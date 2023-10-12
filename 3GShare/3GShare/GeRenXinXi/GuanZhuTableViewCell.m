//
//  GuanZhuTableViewCell.m
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import "GuanZhuTableViewCell.h"

@implementation GuanZhuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.labelID = [[UILabel alloc] init];
    self.headView = [[UIImageView alloc] initWithImage:self.head];
    
    
    [self.contentView addSubview:self.labelID];
    [self.contentView addSubview:self.headView];
    return self;
}

- (void)layoutSubviews {
    self.labelID.frame = CGRectMake(60, 10, 270, 50);
    self.headView.frame = CGRectMake(5, 5, 50, 50);
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button setTitle:@"+关注" forState:UIControlStateNormal];
    [self.button setTitle:@"已关注" forState:UIControlStateSelected];
    [self.button setBackgroundColor:[UIColor whiteColor]];
    [self.button setTitleColor:[UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1] forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    self.button.titleLabel.font = [UIFont systemFontOfSize:15];
    self.button.layer.cornerRadius = 20;
    self.button.layer.masksToBounds = YES;
    self.button.layer.borderWidth = 1.0f;
    self.button.layer.borderColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1].CGColor;
    self.button.frame = CGRectMake(320, 15, 60, 30);
    [self.button addTarget:self action:@selector(pressTouch) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.button];
}

- (void)pressTouch {
    if (self.button.selected == NO) {
        self.button.selected = YES;
        [self.button setBackgroundColor:[UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1]];
    } else {
        self.button.selected = NO;
        [self.button setBackgroundColor:[UIColor whiteColor]];
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
