//
//  JiBenZiLiaoViewController.h
//  3GShare
//
//  Created by Eleven on 2023/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SexDelegate <NSObject>

- (void)sexMode: (BOOL*) boy;

@end

@interface JiBenZiLiaoViewController : UIViewController

@property (nonatomic, strong) UIButton *Boy;
@property (nonatomic, strong) UIButton *Girl;
@property (nonatomic, assign) id<SexDelegate> delegate;
@property (nonatomic) BOOL sexSelectBoy;

@end

NS_ASSUME_NONNULL_END
