//
//  ShouYeTableViewCell.m
//  天气预报
//
//  Created by Eleven on 2023/8/2.
//

#import "ShouYeTableViewCell.h"

@implementation ShouYeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.cityNameLabel = [[UILabel alloc] init];
    self.cityNameLabel.textColor = [UIColor whiteColor];
    self.cityNameLabel.font = [UIFont systemFontOfSize:42];
    [self.contentView addSubview:self.cityNameLabel];
    return self;
}

- (void)layoutSubviews {
    
    self.cityNameLabel.frame = CGRectMake(20, 30, 370, 40);
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
