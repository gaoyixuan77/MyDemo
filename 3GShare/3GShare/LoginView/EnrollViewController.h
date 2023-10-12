//
//  EnrollViewController.h
//  3GShare
//
//  Created by Eleven on 2023/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol StringDelegate <NSObject>

- (void)stringMode: (NSMutableDictionary*)dictionary;

@end


@interface EnrollViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textFieldKey;
@property (nonatomic, strong) UITextField *textFieldrepeat;
@property (nonatomic, strong) UITextField *textFieldNum;
@property (nonatomic, assign) id<StringDelegate> delegate;
@property (nonatomic) NSMutableDictionary *dictionary;


@end

NS_ASSUME_NONNULL_END
