//
//  XiaoXISheZhiTableViewCell.m
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import "XiaoXISheZhiTableViewCell.h"

@implementation XiaoXISheZhiTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.label = [[UILabel alloc] init];
    self.switchSheZhi = [[UISwitch alloc] init];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.switchSheZhi];
    return self;
}

- (void)layoutSubviews {
    self.label.frame = CGRectMake(20, 7, 300, 30);
    self.switchSheZhi.frame = CGRectMake(320, 7, 42, 30);
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
