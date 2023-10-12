//
//  SmallBiaoTiTableViewCell.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/19.
//

#import "SmallBiaoTiTableViewCell.h"

@implementation SmallBiaoTiTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.FrontLabel = [[UILabel alloc] init];
    
    self.LastButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.LastButton setImage:[UIImage imageNamed:@"gengduo.png"] forState:UIControlStateNormal];
    self.LastButton.tintColor = [UIColor grayColor];
    
    [self.contentView addSubview:self.FrontLabel];
    [self.contentView addSubview:self.LastButton];
    return self;
}

- (void)layoutSubviews {
    self.FrontLabel.frame = CGRectMake(10, 0, 200, 30);
    self.LastButton.frame = CGRectMake(340, 0, 40, 30);
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
