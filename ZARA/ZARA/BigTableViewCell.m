//
//  BigTableViewCell.m
//  ZARA
//
//  Created by Eleven on 2023/7/14.
//

#import "BigTableViewCell.h"

@implementation BigTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.label1 = [[UILabel alloc] init];
    self.label2 = [[UILabel alloc] init];
    self.label1.text = @"ZARA";
    self.label2.text = @"微信号：66666";
    self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xuangou.jpg"]];
    [self.contentView addSubview:_label1];
    [self.contentView addSubview:_label2];
    [self.contentView addSubview:_imageView1];
    return self;
}

- (void)layoutSubviews {
    _label1.frame = CGRectMake(165, 5, 394, 70);
    _label2.frame = CGRectMake(155, 80, 394, 70);
    _imageView1.frame = CGRectMake(0, 0, 150, 150);
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
