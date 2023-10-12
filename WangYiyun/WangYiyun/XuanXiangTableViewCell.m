//
//  XuanXiangTableViewCell.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/19.
//

#import "XuanXiangTableViewCell.h"

@interface XuanXiangTableViewCell ()

@property (nonatomic, strong) UIButton *TuiJianButton;
@property (nonatomic, strong) UIButton *ManYouButton;
@property (nonatomic, strong) UIButton *GeDanButton;
@property (nonatomic, strong) UIButton *PaiHangButton;
@property (nonatomic, strong) UIButton *YouShengShuButton;
@property (nonatomic, strong) UIButton *buttonZhuanji;
@property (nonatomic, strong) UIButton *buttonZhiBo;
@property (nonatomic, strong) UIButton *buttonXinGe;
@property (nonatomic, strong) UIButton *buttonGame;


@property (nonatomic, strong) UILabel *TuiJianLabel;
@property (nonatomic, strong) UILabel *ManYouLabel;
@property (nonatomic, strong) UILabel *GeDanLabel;
@property (nonatomic, strong) UILabel *PaiHangLabel;
@property (nonatomic, strong) UILabel *YouShengShuLabel;
@property (nonatomic, strong) UILabel *labelZhuanJi;
@property (nonatomic, strong) UILabel *labelZhiBo;
@property (nonatomic, strong) UILabel *labelXinGe;
@property (nonatomic, strong) UILabel *labelGame;

@property (nonatomic, strong) UIScrollView *scroll;

@end

@implementation XuanXiangTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.TuiJianButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ManYouButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.GeDanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.PaiHangButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.YouShengShuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonZhuanji = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonZhiBo = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonXinGe = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonGame = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.TuiJianButton setImage:[UIImage imageNamed:@"rili.png"] forState:UIControlStateNormal];
    [self.ManYouButton setImage:[UIImage imageNamed:@"diantai.png"] forState:UIControlStateNormal];
    [self.GeDanButton setImage:[UIImage imageNamed:@"paixingbang.png"] forState:UIControlStateNormal];
    [self.PaiHangButton setImage:[UIImage imageNamed:@"gedan.png"] forState:UIControlStateNormal];
    [self.YouShengShuButton setImage:[UIImage imageNamed:@"book.png"] forState:UIControlStateNormal];
    [self.buttonZhuanji setImage:[UIImage imageNamed:@"zhuanjiguangpan.png"] forState:UIControlStateNormal];
    [self.buttonZhiBo setImage:[UIImage imageNamed:@"zhibo.png"] forState:UIControlStateNormal];
    [self.buttonXinGe setImage:[UIImage imageNamed:@"yinle.png"] forState:UIControlStateNormal];
    [self.buttonGame setImage:[UIImage imageNamed:@"youxi.png"] forState:UIControlStateNormal];

    
    self.TuiJianLabel = [[UILabel alloc] init];
    self.ManYouLabel = [[UILabel alloc] init];
    self.GeDanLabel = [[UILabel alloc] init];
    self.PaiHangLabel = [[UILabel alloc] init];
    self.YouShengShuLabel = [[UILabel alloc] init];
    self.labelZhuanJi = [[UILabel alloc] init];
    self.labelZhiBo = [[UILabel alloc] init];
    self.labelXinGe = [[UILabel alloc] init];
    self.labelGame = [[UILabel alloc] init];

    
    self.TuiJianLabel.text = @"每日推荐";
    self.ManYouLabel.text = @"私人漫游";
    self.GeDanLabel.text = @"    歌单";
    self.PaiHangLabel.text = @"  排行榜";
    self.YouShengShuLabel.text = @"  有声书";
    self.labelZhuanJi.text = @"数字专辑";
    self.labelZhiBo.text = @"   直播";
    self.labelXinGe.text = @"关注新歌";
    self.labelGame.text = @"游戏专区";
    
    self.TuiJianLabel.textColor = [UIColor darkGrayColor];
    self.ManYouLabel.textColor = [UIColor darkGrayColor];
    self.GeDanLabel.textColor = [UIColor darkGrayColor];
    self.PaiHangLabel.textColor = [UIColor darkGrayColor];
    self.YouShengShuLabel.textColor = [UIColor darkGrayColor];
    self.labelZhuanJi.textColor = [UIColor darkGrayColor];
    self.labelZhiBo.textColor = [UIColor darkGrayColor];
    self.labelXinGe.textColor = [UIColor darkGrayColor];
    self.labelGame.textColor = [UIColor darkGrayColor];



    self.scroll = [[UIScrollView alloc] init];
    self.scroll.contentSize = CGSizeMake(709, 80);
    self.TuiJianButton.frame = CGRectMake(20, 0, 40, 40);
    self.ManYouButton.frame = CGRectMake(98, 0, 40, 40);
    self.GeDanButton.frame = CGRectMake(176, 0, 40, 40);
    self.PaiHangButton.frame = CGRectMake(254, 0, 40, 40);
    self.YouShengShuButton.frame = CGRectMake(332, 0, 40, 40);
    self.buttonZhuanji.frame = CGRectMake(410, 0, 40, 40);
    self.buttonZhiBo.frame = CGRectMake(488, 0, 40, 40);
    self.buttonXinGe.frame = CGRectMake(566, 0, 40, 40);
    self.buttonGame.frame = CGRectMake(644, 0, 40, 40);
    

    self.TuiJianLabel.frame = CGRectMake(7, 45, 80, 30);
    self.ManYouLabel.frame = CGRectMake(85, 45, 80, 30);
    self.PaiHangLabel.frame = CGRectMake(163, 45, 80, 30);
    self.GeDanLabel.frame = CGRectMake(241, 45, 80, 30);
    self.YouShengShuLabel.frame = CGRectMake(319, 45, 80, 30);
    self.labelZhuanJi.frame = CGRectMake(397, 45, 80, 30);
    self.labelZhiBo.frame = CGRectMake(475, 45, 80, 30);
    self.labelXinGe.frame = CGRectMake(553, 45, 80, 30);
    self.labelGame.frame = CGRectMake(631, 45, 80, 30);

    
    [self.scroll addSubview:self.TuiJianLabel];
    [self.scroll addSubview:self.ManYouLabel];
    [self.scroll addSubview:self.PaiHangLabel];
    [self.scroll addSubview:self.GeDanLabel];
    [self.scroll addSubview:self.YouShengShuLabel];
    [self.scroll addSubview:self.labelZhiBo];
    [self.scroll addSubview:self.labelZhuanJi];
    [self.scroll addSubview:self.labelXinGe];
    [self.scroll addSubview:self.labelGame];

    [self.scroll addSubview:self.TuiJianButton];
    [self.scroll addSubview:self.ManYouButton];
    [self.scroll addSubview:self.GeDanButton];
    [self.scroll addSubview:self.PaiHangButton];
    [self.scroll addSubview:self.YouShengShuButton];
    [self.scroll addSubview:self.buttonZhuanji];
    [self.scroll addSubview:self.buttonZhiBo];
    [self.scroll addSubview:self.buttonXinGe];
    [self.scroll addSubview:self.buttonGame];
    
    [self.contentView addSubview:self.scroll];

    return self;
}

- (void)layoutSubviews {
    self.scroll.frame = CGRectMake(0, 0, 394, 80);

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
