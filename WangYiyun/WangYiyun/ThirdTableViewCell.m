//
//  ThirdTableViewCell.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/17.
//

#import "ThirdTableViewCell.h"

@implementation ThirdTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.label = [[UILabel alloc] init];
    self.label2 = [[UILabel alloc] init];
    self.label2.text = @">";
    self.label2.textColor = [UIColor grayColor];
    self.imageV = [[UIImageView alloc] initWithImage:self.image];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.label2];
    [self.contentView addSubview:self.imageV];
    return self;
}

- (void)layoutSubviews {
    self.label.frame = CGRectMake(44, 0, 200, 44);
    self.imageV.frame = CGRectMake(5, 5, 30, 30);
    self.label2.frame = CGRectMake(370, 15, 10, 10);
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
