//
//  B_ViewController.h
//  多界面传值
//
//  Created by Eleven on 2023/8/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^BToABlock)(NSString *bToAStr);

@interface B_ViewController : UIViewController

@property (nonatomic, copy) NSString *aToBStr;
@property (nonatomic, strong) BToABlock bToABlock;

@end

NS_ASSUME_NONNULL_END
