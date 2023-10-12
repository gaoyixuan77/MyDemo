//
//  MusicTableViewCell.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/17.
//

#import "MusicTableViewCell.h"

@interface MusicTableViewCell ()

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UILabel *gengDuoLabel;

@end

@implementation MusicTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.backgroundColor = [UIColor whiteColor];
    self.MusicimageView = [[UIImageView alloc] initWithImage:self.image];
    self.MusicLabel = [[UILabel alloc] init];
    self.gengDuoLabel = [[UILabel alloc] init];
    self.gengDuoLabel.text = @"┇";
    self.gengDuoLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.MusicLabel];
    [self.contentView addSubview:self.MusicimageView];
    [self.contentView addSubview:self.gengDuoLabel];
    return self;
}

- (void)layoutSubviews {
    self.MusicLabel.frame = CGRectMake(110, 17, 220, 80);
    self.MusicimageView.frame = CGRectMake(10, 15, 80, 80);
    self.gengDuoLabel.frame = CGRectMake(370, 50, 20, 20);
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
