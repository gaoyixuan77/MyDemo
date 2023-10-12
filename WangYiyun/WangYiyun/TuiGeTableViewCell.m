//
//  TuiGeTableViewCell.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/19.
//

#import "TuiGeTableViewCell.h"

@implementation TuiGeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.FirstMusicButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.SecondMusicButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ThirdMusicButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.LabelFirst = [[UILabel alloc] init];
    self.LabelSecond = [[UILabel alloc] init];
    self.LabelThird = [[UILabel alloc] init];
    
    self.LabelFirst.numberOfLines = 2;
    self.LabelSecond.numberOfLines = 2;
    self.LabelThird.numberOfLines = 2;
    
    self.LabelFirst.font = [UIFont systemFontOfSize:13];
    self.LabelSecond.font = [UIFont systemFontOfSize:13];
    self.LabelThird.font = [UIFont systemFontOfSize:13];

    [self.contentView addSubview:self.LabelFirst];
    [self.contentView addSubview:self.LabelSecond];
    [self.contentView addSubview:self.LabelThird];

    [self.contentView addSubview:self.FirstMusicButton];
    [self.contentView addSubview:self.SecondMusicButton];
    [self.contentView addSubview:self.ThirdMusicButton];
    return self;
}

- (void)layoutSubviews {
    self.FirstMusicButton.frame = CGRectMake(20, 20, 100, 100);
    self.SecondMusicButton.frame = CGRectMake(145, 20, 100, 100);
    self.ThirdMusicButton.frame = CGRectMake(270, 20, 100, 100);
    self.LabelFirst.frame = CGRectMake(15, 125, 110, 40);
    self.LabelSecond.frame = CGRectMake(140, 125, 110, 40);
    self.LabelThird.frame = CGRectMake(265, 125, 110, 40);
    
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
