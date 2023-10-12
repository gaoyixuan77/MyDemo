//
//  GeRenXinXiTableViewCell.h
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GeRenXinXiTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UILabel *labelID;
@property (nonatomic, strong) UILabel *labelbiaoQian;
@property (nonatomic, strong) UILabel *labelYuLu;
@property (nonatomic,assign) int dianZanShu;
@property (nonatomic,assign) int liuLanShu;
@property (nonatomic,assign) int fenXiangShu;

@end

NS_ASSUME_NONNULL_END
