//
//  NormalImageTableViewCell.h
//  3GShare
//
//  Created by Eleven on 2023/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NormalImageTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UILabel *labelBiaoTi;
@property (nonatomic, strong) UILabel *labelZuoZhe;
@property (nonatomic, strong) UILabel *labelBiaoQian;
@property (nonatomic, strong) UILabel *labelTime;
@property (nonatomic, strong) UIButton *buttonDianZan;
@property (nonatomic,assign) int dianZanShu;
@property (nonatomic,assign) int liuLanShu;
@property (nonatomic,assign) int fenXiangShu;
@property (nonatomic,strong) UIImageView *imageBig;
@property (nonatomic, strong) UIImageView *Liulan;
@property (nonatomic, strong) UIImageView *FenXiang;
@property (nonatomic, strong) UILabel *labelDianZan;
@property (nonatomic, strong) UILabel *labelLiuLan;
@property (nonatomic, strong) UILabel *labelFenXiang;

@end

NS_ASSUME_NONNULL_END
