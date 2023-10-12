//
//  SecondTableViewCell.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/17.
//

#import "SecondTableViewCell.h"

@interface SecondTableViewCell ()

@property (nonatomic, strong) UIButton *buttonYouJian;
@property (nonatomic, strong) UIButton *buttonHaoYou;
@property (nonatomic, strong) UIButton *buttonWoDe;
@property (nonatomic, strong) UIButton *buttonGeXing;
@property (nonatomic, strong) UILabel *YoujianLabel;
@property (nonatomic, strong) UILabel *HaoYouLabel;
@property (nonatomic, strong) UILabel *WoDeLabel;
@property (nonatomic, strong) UILabel *GeXingLabel;

@end

@implementation SecondTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.buttonYouJian = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonHaoYou = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonWoDe = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonGeXing = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [self.button1 setTitle:@"我的消息" forState:UIControlStateNormal];
//    [self.button2 setTitle:@"我的好友" forState:UIControlStateNormal];
//    [self.button3 setTitle:@"个人主页" forState:UIControlStateNormal];
//    [self.button4 setTitle:@"个性装扮" forState:UIControlStateNormal];
    [self.buttonYouJian setBackgroundImage:[UIImage imageNamed:@"icon-mail.png"] forState:UIControlStateNormal];
    [self.buttonHaoYou setBackgroundImage:[UIImage imageNamed:@"haoyou.png"] forState:UIControlStateNormal];
    [self.buttonWoDe setBackgroundImage:[UIImage imageNamed:@"icon-user.png"] forState:UIControlStateNormal];
    [self.buttonGeXing setBackgroundImage:[UIImage imageNamed:@"pen-2.png"] forState:UIControlStateNormal];
    
    self.YoujianLabel = [[UILabel alloc] init];
    self.HaoYouLabel = [[UILabel alloc] init];
    self.WoDeLabel = [[UILabel alloc] init];
    self.GeXingLabel = [[UILabel alloc] init];
    
    self.YoujianLabel.text = @"我的消息";
    self.HaoYouLabel.text = @"我的好友";
    self.WoDeLabel.text = @"个人主页";
    self.GeXingLabel.text = @"个性装扮";
    
    self.YoujianLabel.textColor = [UIColor darkGrayColor];
    self.HaoYouLabel.textColor = [UIColor darkGrayColor];
    self.WoDeLabel.textColor = [UIColor darkGrayColor];
    self.GeXingLabel.textColor = [UIColor darkGrayColor];
    
    [self.contentView addSubview:self.YoujianLabel];
    [self.contentView addSubview:self.HaoYouLabel];
    [self.contentView addSubview:self.WoDeLabel];
    [self.contentView addSubview:self.GeXingLabel];
    [self.contentView addSubview:self.buttonYouJian];
    [self.contentView addSubview:self.buttonHaoYou];
    [self.contentView addSubview:self.buttonWoDe];
    [self.contentView addSubview:self.buttonGeXing];
    return self;
}

- (void)layoutSubviews {
    self.buttonYouJian.frame = CGRectMake(25, 10, 50, 50);
    self.buttonHaoYou.frame = CGRectMake(120, 10, 50, 50);
    self.buttonWoDe.frame = CGRectMake(220, 10, 50, 50);
    self.buttonGeXing.frame = CGRectMake(315, 15, 40, 40);
    self.YoujianLabel.frame = CGRectMake(15, 62, 80, 20);
    self.HaoYouLabel.frame = CGRectMake(110, 62, 80, 20);
    self.WoDeLabel.frame = CGRectMake(210, 62, 80, 20);
    self.GeXingLabel.frame = CGRectMake(300, 62, 80, 20);
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
