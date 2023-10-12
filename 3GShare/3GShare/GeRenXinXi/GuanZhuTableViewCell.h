//
//  GuanZhuTableViewCell.h
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GuanZhuTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headView;
@property (nonatomic, strong) UIImage *head;
@property (nonatomic, strong) UILabel *labelID;
@property (nonatomic, strong) UIButton *button;

@end

NS_ASSUME_NONNULL_END
