//
//  MyTableViewCell.m
//  ZARA
//
//  Created by Eleven on 2023/6/13.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.label = [[UILabel alloc] init];
    self.imageview = [[UIImageView alloc] initWithImage:self.image];
    [self.contentView addSubview:self.imageview];
    [self.contentView addSubview:_label];
    NSLog(@"%@", self.image);
    return self;
}

- (void)layoutSubviews {
    _label.frame = CGRectMake(60, 6, 150, 30);
    self.imageview.frame = CGRectMake(13, 5, 33, 33);
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
