//
//  GeRenXinXiViewController.h
//  3GShare
//
//  Created by Eleven on 2023/7/21.
//

#import <UIKit/UIKit.h>
#import "SheZhiViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface GeRenXinXiViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, SexChoiceDelegate>

@property (nonatomic) BOOL sexChoice;

- (void)sexChoiceMode:(BOOL)choiceBoy;

@end

NS_ASSUME_NONNULL_END
