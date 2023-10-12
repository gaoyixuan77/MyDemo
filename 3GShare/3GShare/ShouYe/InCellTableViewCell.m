//
//  InCellTableViewCell.m
//  3GShare
//
//  Created by Eleven on 2023/7/22.
//

#import "InCellTableViewCell.h"
#import "AppDelegate.h"

@implementation InCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.labelTime = [[UILabel alloc] init];
    self.labelBiaoTi = [[UILabel alloc] init];
    self.labelZuoZhe = [[UILabel alloc] init];
    self.buttonDianZan = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonDianZan setImage:[UIImage imageNamed:@"xihuan.png"] forState:UIControlStateNormal];
    [self.buttonDianZan setImage:[UIImage imageNamed:@"xihuan-2.png"] forState:UIControlStateSelected];
    [self.buttonDianZan addTarget:self action:@selector(pressDianzan) forControlEvents:UIControlEventTouchUpInside];
    
    self.labelBiaoTi.font = [UIFont systemFontOfSize:25];
    self.labelZuoZhe.font = [UIFont systemFontOfSize:15];
    self.labelTime.font = [UIFont systemFontOfSize:15];
    
    [self.contentView addSubview:self.labelTime];
    [self.contentView addSubview:self.labelBiaoTi];
    [self.contentView addSubview:self.labelZuoZhe];
    [self.contentView addSubview:self.buttonDianZan];

    return self;
}

- (void)layoutSubviews {
    UIImageView *imageBig = [[UIImageView alloc] initWithImage:self.image];
    UIImageView *Liulan = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chakan.png"]];
    UIImageView *FenXiang = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhuanfa.png"]];
    UILabel *labelDianZan = [[UILabel alloc] initWithFrame:CGRectMake(210, 50, 40, 20)];
    UILabel *labelLiuLan = [[UILabel alloc] initWithFrame:CGRectMake(280, 50, 40, 20)];
    UILabel *labelFenXiang = [[UILabel alloc] initWithFrame:CGRectMake(360, 50, 40, 20)];

    labelDianZan.text = [NSString stringWithFormat:@"%d",self.dianZanShu];
    labelLiuLan.text = [NSString stringWithFormat:@"%d",self.liuLanShu];
    labelFenXiang.text = [NSString stringWithFormat:@"%d",self.fenXiangShu];
    
    imageBig.frame = CGRectMake(8, 15, 50, 50);
    Liulan.frame = CGRectMake(260, 50, 20, 20);
    FenXiang.frame = CGRectMake(340, 50, 20, 20);
    
    self.labelBiaoTi.frame = CGRectMake(65, 10, 230, 40);
    self.labelZuoZhe.frame = CGRectMake(65, 50, 200, 20);
    self.labelTime.frame = CGRectMake(300, 15, 90, 15);
    self.buttonDianZan.frame = CGRectMake(190, 50, 20, 20);
    
    
    
    [self.contentView addSubview:imageBig];
    [self.contentView addSubview:Liulan];
    [self.contentView addSubview:FenXiang];
    [self.contentView addSubview:labelDianZan];
    [self.contentView addSubview:labelLiuLan];
    [self.contentView addSubview:labelFenXiang];

}

- (void)pressDianzan {
    AppDelegate* mydelegate = (AppDelegate*)[UIApplication sharedApplication].delegate ;
    if (self.buttonDianZan.selected == YES) {
        self.buttonDianZan.selected = NO;
        mydelegate.selsect1 = NO;
        UILabel *labelDianZan = [[UILabel alloc] initWithFrame:CGRectMake(210, 50, 40, 20)];
        labelDianZan.backgroundColor = [UIColor whiteColor];
        labelDianZan.text = @"55";
        [self.contentView addSubview:labelDianZan];
    } else {
        self.buttonDianZan.selected = YES;
        mydelegate.selsect1 = YES;
        UILabel *labelDianZan = [[UILabel alloc] initWithFrame:CGRectMake(210, 50, 40, 20)];
        labelDianZan.backgroundColor = [UIColor whiteColor];
        labelDianZan.text = @"56";
        [self.contentView addSubview:labelDianZan];
    }
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
