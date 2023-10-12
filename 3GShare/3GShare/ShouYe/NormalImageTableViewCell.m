//
//  NormalImageTableViewCell.m
//  3GShare
//
//  Created by Eleven on 2023/7/21.
//

#import "NormalImageTableViewCell.h"

@implementation NormalImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    self.buttonDianZan.selected = NO;
    self.labelTime = [[UILabel alloc] init];
    self.labelBiaoTi = [[UILabel alloc] init];
    self.labelZuoZhe = [[UILabel alloc] init];
    self.labelBiaoQian = [[UILabel alloc] init];
    self.buttonDianZan = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonDianZan setImage:[UIImage imageNamed:@"xihuan.png"] forState:UIControlStateNormal];
    [self.buttonDianZan setImage:[UIImage imageNamed:@"xihuan-2.png"] forState:UIControlStateSelected];

    self.imageBig = [[UIImageView alloc] initWithImage:self.image];
    self.Liulan = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chakan.png"]];
    self.FenXiang = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhuanfa.png"]];
    self.labelDianZan = [[UILabel alloc] init];
    self.labelLiuLan = [[UILabel alloc] init];
    self.labelFenXiang = [[UILabel alloc] init];

    
    
    self.labelBiaoTi.font = [UIFont systemFontOfSize:25];
    self.labelZuoZhe.font = [UIFont systemFontOfSize:15];
    self.labelBiaoQian.font = [UIFont systemFontOfSize:15];
    self.labelTime.font = [UIFont systemFontOfSize:15];
    
    [self.contentView addSubview:self.labelTime];
    [self.contentView addSubview:self.labelBiaoTi];
    [self.contentView addSubview:self.labelZuoZhe];
    [self.contentView addSubview:self.labelBiaoQian];
    [self.contentView addSubview:self.buttonDianZan];
    [self.contentView addSubview:self.imageBig];
    [self.contentView addSubview:self.Liulan];
    [self.contentView addSubview:self.FenXiang];
    [self.contentView addSubview:self.labelDianZan];
    [self.contentView addSubview:self.labelLiuLan];
    [self.contentView addSubview:self.labelFenXiang];

    return self;
}

- (void)layoutSubviews {
    
    self.labelDianZan.text = [NSString stringWithFormat:@"%d",self.dianZanShu];
    self.labelDianZan.backgroundColor = [UIColor whiteColor];
    self.labelLiuLan.text = [NSString stringWithFormat:@"%d",self.liuLanShu];
    self.labelFenXiang.text = [NSString stringWithFormat:@"%d",self.fenXiangShu];
    
    self.labelDianZan.frame = CGRectMake(190, 120, 40, 20);
    self.labelLiuLan.frame = CGRectMake(270, 120, 40, 20);
    self.labelFenXiang.frame = CGRectMake(350, 120, 40, 20);
    
    self.imageBig.frame = CGRectMake(8, 0, 150, 150);
    self.Liulan.frame = CGRectMake(250, 120, 20, 20);
    self.FenXiang.frame = CGRectMake(330, 120, 20, 20);
        
    self.labelBiaoTi.frame = CGRectMake(170, 10, 214, 25);
    self.labelZuoZhe.frame = CGRectMake(170, 45, 200, 15);
    self.labelBiaoQian.frame = CGRectMake(170, 70, 200, 15);
    self.labelTime.frame = CGRectMake(170, 95, 140, 15);
    self.buttonDianZan.frame = CGRectMake(170, 120, 20, 20);
        

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
