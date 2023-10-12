//
//  SheZhiViewController.h
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import <UIKit/UIKit.h>
#import "JiBenZiLiaoViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SexChoiceDelegate <NSObject>

- (void)sexChoiceMode: (BOOL) choiceBoy;

@end

@interface SheZhiViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, SexDelegate>

@property (nonatomic, assign) id<SexChoiceDelegate> delegate;

- (void)sexMode:(BOOL)boy;
@property (nonatomic) BOOL sexBoy;

@end

NS_ASSUME_NONNULL_END
