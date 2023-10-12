//
//  GeRenXinXiTableViewCell.m
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import "GeRenXinXiTableViewCell.h"

@implementation GeRenXinXiTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.labelID = [[UILabel alloc] init];
    self.labelbiaoQian = [[UILabel alloc] init];
    self.labelYuLu = [[UILabel alloc] init];
    
    self.labelID.font = [UIFont systemFontOfSize:25];
    self.labelbiaoQian.font = [UIFont systemFontOfSize:15];
    self.labelYuLu.font = [UIFont systemFontOfSize:15];
    
    [self.contentView addSubview:self.labelID];
    [self.contentView addSubview:self.labelbiaoQian];
    [self.contentView addSubview:self.labelYuLu];
    
    return self;
}


- (void)layoutSubviews {
    UIImageView *imageBig = [[UIImageView alloc] initWithImage:self.image];
    UIImageView *Liulan = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chakan.png"]];
    UIImageView *FenXiang = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tag.png"]];
    UIImageView *dianZan = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xihuan-2.png"]];
    UILabel *labelDianZan = [[UILabel alloc] initWithFrame:CGRectMake(190, 120, 40, 20)];
    UILabel *labelLiuLan = [[UILabel alloc] initWithFrame:CGRectMake(270, 120, 40, 20)];
    UILabel *labelFenXiang = [[UILabel alloc] initWithFrame:CGRectMake(350, 120, 40, 20)];

    labelDianZan.text = [NSString stringWithFormat:@"%d",self.dianZanShu];
    labelLiuLan.text = [NSString stringWithFormat:@"%d",self.liuLanShu];
    labelFenXiang.text = [NSString stringWithFormat:@"%d",self.fenXiangShu];
    
    imageBig.frame = CGRectMake(23, 15, 120, 120);
    dianZan.frame = CGRectMake(250, 120, 20, 20);
    Liulan.frame = CGRectMake(330, 120, 20, 20);
    FenXiang.frame = CGRectMake(170, 120, 20, 20);

    self.labelID.frame = CGRectMake(170, 10, 214, 25);
    self.labelbiaoQian.frame = CGRectMake(170, 45, 200, 15);
    self.labelYuLu.frame = CGRectMake(170, 90, 200, 15);

    
    
    [self.contentView addSubview:imageBig];
    [self.contentView addSubview:Liulan];
    [self.contentView addSubview:FenXiang];
    [self.contentView addSubview:labelDianZan];
    [self.contentView addSubview:labelLiuLan];
    [self.contentView addSubview:labelFenXiang];
    [self.contentView addSubview:dianZan];
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
