//
//  OtherTableViewCell.m
//  天气预报
//
//  Created by Eleven on 2023/8/2.
//

#import "OtherTableViewCell.h"

@implementation OtherTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.biaoTi1Label = [[UILabel alloc] init];
    self.biaoTi1Label.font = [UIFont systemFontOfSize:15];
    self.biaoTi1Label.textColor = [UIColor whiteColor];

    self.biaoTi2Label = [[UILabel alloc] init];
    self.biaoTi2Label.font = [UIFont systemFontOfSize:15];
    self.biaoTi2Label.textColor = [UIColor whiteColor];

    self.neiRong1Label = [[UILabel alloc] init];
    self.neiRong1Label.font = [UIFont systemFontOfSize:32];
    self.neiRong1Label.textColor = [UIColor whiteColor];

    self.neiRong2Label = [[UILabel alloc] init];
    self.neiRong2Label.font = [UIFont systemFontOfSize:32];
    self.neiRong2Label.textColor = [UIColor whiteColor];

    [self.contentView addSubview:self.biaoTi1Label];
    [self.contentView addSubview:self.biaoTi2Label];
    [self.contentView addSubview:self.neiRong1Label];
    [self.contentView addSubview:self.neiRong2Label];
    return self;
}

- (void)layoutSubviews {
    self.biaoTi1Label.frame = CGRectMake(10, 5, 100, 20);
    self.biaoTi2Label.frame = CGRectMake(200, 5, 100, 20);

    self.neiRong1Label.frame = CGRectMake(10, 30, 200, 40);
    self.neiRong2Label.frame = CGRectMake(200, 30, 200, 40);

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
