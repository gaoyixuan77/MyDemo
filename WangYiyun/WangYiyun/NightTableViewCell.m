//
//  NightTableViewCell.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/17.
//

#import "NightTableViewCell.h"

@implementation NightTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.label = [[UILabel alloc] init];
    self.imageV = [[UIImageView alloc] initWithImage:self.image];
    self.switch1 = [[UISwitch alloc] init];
    self.switch1.onTintColor = [UIColor redColor];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.imageV];
    [self.contentView addSubview:self.switch1];
    return self;
}

- (void)layoutSubviews {
    self.label.frame = CGRectMake(44, 0, 200, 44);
    self.imageV.frame = CGRectMake(5, 5, 30, 30);
    self.switch1.frame = CGRectMake(304, 5, 100, 44);
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
