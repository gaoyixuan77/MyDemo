//
//  WeathTableViewCell.h
//  天气预报
//
//  Created by Eleven on 2023/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeathTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *timeWeathImage;
@property (nonatomic, strong) UILabel *wenDuHeighLabel;
@property (nonatomic, strong) UILabel *wenDuLowLabel;

@end

NS_ASSUME_NONNULL_END
