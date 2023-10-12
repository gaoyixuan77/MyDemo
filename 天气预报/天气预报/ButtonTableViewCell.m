//
//  ButtonTableViewCell.m
//  天气预报
//
//  Created by Eleven on 2023/8/2.
//

#import "ButtonTableViewCell.h"
#import "SouSuoViewController.h"

@implementation ButtonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.contentView addSubview:self.button];
    return self;
}

- (void)layoutSubviews {
    self.button.frame = CGRectMake(330, 10, 30, 30);
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
