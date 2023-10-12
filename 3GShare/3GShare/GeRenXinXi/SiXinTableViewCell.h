//
//  SiXinTableViewCell.h
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SiXinTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headView;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UILabel *labelID;
@property (nonatomic, strong) UILabel *labelXiaoXi;
@property (nonatomic, strong) UILabel *labelTime;

@end

NS_ASSUME_NONNULL_END
