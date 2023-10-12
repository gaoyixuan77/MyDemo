//
//  TwoTableViewCell.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/17.
//

#import "TwoTableViewCell.h"
@interface TwoTableViewCell()

@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;
@property (nonatomic, strong) UIButton *button4;


@end


@implementation TwoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.label1 = [[UILabel alloc] init];
    self.label2 = [[UILabel alloc] init];
    self.label3 = [[UILabel alloc] init];
    self.label4 = [[UILabel alloc] init];
    
    self.label1.textColor = [UIColor darkGrayColor];
    self.label2.textColor = [UIColor darkGrayColor];
    self.label3.textColor = [UIColor darkGrayColor];
    self.label4.textColor = [UIColor darkGrayColor];
    
    [self.contentView addSubview:self.label1];
    [self.contentView addSubview:self.label2];
    [self.contentView addSubview:self.label3];
    [self.contentView addSubview:self.label4];

    [self.contentView addSubview:self.button1];
    [self.contentView addSubview:self.button2];
    [self.contentView addSubview:self.button3];
    [self.contentView addSubview:self.button4];

    return self;
}

- (void)layoutSubviews {
    [self.button1 setBackgroundImage:self.image1 forState:UIControlStateNormal];
    [self.button2 setBackgroundImage:self.image2 forState:UIControlStateNormal];
    [self.button3 setBackgroundImage:self.image3 forState:UIControlStateNormal];
    [self.button4 setBackgroundImage:self.image4 forState:UIControlStateNormal];
    self.button1.frame = CGRectMake(23, 7, 45, 45);
    self.button2.frame = CGRectMake(123, 7, 45, 45);
    self.button3.frame = CGRectMake(223, 7, 45, 45);
    self.button4.frame = CGRectMake(323, 7, 45, 45);
    self.label1.frame = CGRectMake(14, 55, 80, 20);
    self.label2.frame = CGRectMake(114, 55, 80, 20);
    self.label3.frame = CGRectMake(214, 55, 80, 20);
    self.label4.frame = CGRectMake(314, 55, 80, 20);
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
