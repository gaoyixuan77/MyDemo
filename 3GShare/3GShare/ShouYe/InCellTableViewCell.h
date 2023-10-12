//
//  InCellTableViewCell.h
//  3GShare
//
//  Created by Eleven on 2023/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InCellTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UILabel *labelBiaoTi;
@property (nonatomic, strong) UILabel *labelZuoZhe;
@property (nonatomic, strong) UILabel *labelTime;
@property (nonatomic, strong) UIButton *buttonDianZan;
@property (nonatomic,assign) int dianZanShu;
@property (nonatomic,assign) int liuLanShu;
@property (nonatomic,assign) int fenXiangShu;


@end

NS_ASSUME_NONNULL_END
