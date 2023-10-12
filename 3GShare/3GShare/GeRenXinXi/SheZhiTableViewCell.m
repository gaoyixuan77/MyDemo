//
//  SheZhiTableViewCell.m
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import "SheZhiTableViewCell.h"

@implementation SheZhiTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.labelBiaoTi = [[UILabel alloc] init];
    self.imageViewFront = [[UIImageView alloc] initWithImage: self.imageFront];
    
    [self.contentView addSubview:self.labelBiaoTi];
    [self.contentView addSubview:self.imageViewFront];
    return self;
}

- (void)layoutSubviews {
    self.labelBiaoTi.frame = CGRectMake(50, 0, 300, 50);
    self.imageViewFront.frame = CGRectMake(10, 10, 30, 30);
    UIImageView *last = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qianwang-2.png"]];
    last.frame = CGRectMake(350, 15, 20, 20);
    [self.contentView addSubview:last];
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
