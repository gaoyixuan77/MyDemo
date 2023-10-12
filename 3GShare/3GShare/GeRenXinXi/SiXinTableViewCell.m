//
//  SiXinTableViewCell.m
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import "SiXinTableViewCell.h"

@implementation SiXinTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.headView = [[UIImageView alloc] initWithImage:self.image];
    self.labelID = [[UILabel alloc] init];
    self.labelID.font = [UIFont systemFontOfSize:20];
    self.labelTime = [[UILabel alloc] init];
    self.labelTime.font = [UIFont systemFontOfSize:10];
    self.labelTime.textColor = [UIColor grayColor];
    self.labelXiaoXi = [[UILabel alloc] init];
    self.labelXiaoXi.font = [UIFont systemFontOfSize:14];
    self.labelXiaoXi.textColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1];
    
    [self.contentView addSubview:self.headView];
    [self.contentView addSubview:self.labelID];
    [self.contentView addSubview:self.labelTime];
    [self.contentView addSubview:self.labelXiaoXi];
    
    return self;
}

- (void)layoutSubviews {
    self.headView.frame = CGRectMake(5, 5, 50, 50);
    self.labelID.frame = CGRectMake(60, 5, 300, 30);
    self.labelXiaoXi.frame = CGRectMake(60, 35, 330, 25);
    self.labelTime.frame = CGRectMake(300, 2, 94, 10);
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
