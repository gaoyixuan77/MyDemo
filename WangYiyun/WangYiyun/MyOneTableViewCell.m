//
//  MyOneTableViewCell.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/17.
//

#import "MyOneTableViewCell.h"

@interface MyOneTableViewCell()

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;

@end

@implementation MyOneTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xuangou.jpg"]];
    self.label = [[UILabel alloc] init];
    self.label.text = @"用户名";
    self.label.font = [UIFont systemFontOfSize:25];
    self.button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button1 setTitle:@"17 关注" forState:UIControlStateNormal];
    [self.button2 setTitle:@"9 粉丝" forState:UIControlStateNormal];
    [self.button3 setTitle:@"Lv.7" forState:UIControlStateNormal];
    self.button1.tintColor = [UIColor grayColor];
    self.button2.tintColor = [UIColor grayColor];
    self.button3.tintColor = [UIColor grayColor];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.imageV];
    [self.contentView addSubview:self.button1];
    [self.contentView addSubview:self.button2];
    [self.contentView addSubview:self.button3];
    return self;
}

- (void)layoutSubviews {
    self.imageV.frame = CGRectMake(150, -30, 90, 90);
    self.label.frame = CGRectMake(160, 60, 100, 40);
    self.button1.frame = CGRectMake(120, 100, 50, 20);
    self.button2.frame = CGRectMake(185, 100, 50, 20);
    self.button3.frame = CGRectMake(240, 100, 50, 20);
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
