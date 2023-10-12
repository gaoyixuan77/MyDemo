//
//  WeathTableViewCell.m
//  天气预报
//
//  Created by Eleven on 2023/8/1.
//

#import "WeathTableViewCell.h"

@implementation WeathTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.timeLabel];
    self.timeLabel.textColor = [UIColor whiteColor];

    self.wenDuLowLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.wenDuLowLabel];
    self.wenDuLowLabel.textColor = [UIColor whiteColor];

    self.wenDuHeighLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.wenDuHeighLabel];
    self.wenDuHeighLabel.textColor = [UIColor whiteColor];

    self.timeWeathImage = [[UIImageView alloc] init];
    [self.contentView addSubview:self.timeWeathImage];
    
    return self;
}

- (void)layoutSubviews {
    self.timeLabel.frame = CGRectMake(10, 10, 100, 40);
    self.timeWeathImage.frame = CGRectMake(140, 12, 40, 40);
    self.wenDuHeighLabel.frame = CGRectMake(280, 10, 40, 40);
    self.wenDuLowLabel.frame = CGRectMake(340, 10, 40, 40);
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
