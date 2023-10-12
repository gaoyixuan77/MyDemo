//
//  HuoDongTableViewCell.m
//  3GShare
//
//  Created by Eleven on 2023/7/24.
//

#import "HuoDongTableViewCell.h"

@implementation HuoDongTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.label = [[UILabel alloc] init];
    self.label.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.label];
    return self;
}

- (void)layoutSubviews {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.image];
    [self.contentView addSubview:imageView];
    imageView.frame = CGRectMake(10, -5, 374, 155);
    self.label.frame = CGRectMake(10, 150, 384, 20);
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
