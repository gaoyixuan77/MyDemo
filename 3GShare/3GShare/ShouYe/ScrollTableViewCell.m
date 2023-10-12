//
//  ScrollTableViewCell.m
//  3GShare
//
//  Created by Eleven on 2023/7/22.
//

#import "ScrollTableViewCell.h"

@interface ScrollTableViewCell ()


@end


@implementation ScrollTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.image1 = [[UIImageView alloc] init];
    self.image2 = [[UIImageView alloc] init];
    self.image3 = [[UIImageView alloc] init];
    self.image4 = [[UIImageView alloc] init];
    self.image5 = [[UIImageView alloc] init];
    
    self.labelZhengWen = [[UILabel alloc] init];
    
    [self.contentView addSubview:self.image1];
    [self.contentView addSubview:self.image2];
    [self.contentView addSubview:self.image3];
    [self.contentView addSubview:self.image4];
    [self.contentView addSubview:self.image5];
    [self.contentView addSubview:self.labelZhengWen];

    return self;
}

- (void)layoutSubviews {
    UILabel *fenGe = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 394, 5)];
    fenGe.text = @"    ————————————————————————————————————————————————————";
    fenGe.textColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:0.2];
    [self.contentView addSubview:fenGe];
    
    self.labelZhengWen.frame = CGRectMake(0, 30, 394, 20);
    self.image1.frame = CGRectMake(0, 50, 394, 300);
    self.image2.frame = CGRectMake(0, 350, 394, 300);
    self.image3.frame = CGRectMake(0, 650, 394, 300);
    self.image4.frame = CGRectMake(0, 950, 394, 300);
    self.image5.frame = CGRectMake(0, 1250, 394, 300);
    
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
