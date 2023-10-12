//
//  FirstTableViewCell.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/17.
//

#import "FirstTableViewCell.h"

@interface FirstTableViewCell ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIImageView *imageV;


@end


@implementation FirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.label = [[UILabel alloc] init];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.label.text = @"用户名";
    self.imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xuangou.jpg"]];
    [self.button setTitle:@"赚云贝" forState:UIControlStateNormal];
    self.button.tintColor = [UIColor redColor];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.button];
    [self.contentView addSubview:self.imageV];
    return self;
}

- (void)layoutSubviews {
    self.label.frame = CGRectMake(55, 5, 100, 30);
    self.button.frame = CGRectMake(304, 5, 100, 30);
    self.imageV.frame = CGRectMake(15, 5, 30, 30);
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
