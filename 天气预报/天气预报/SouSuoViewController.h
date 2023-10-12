//
//  SouSuoViewController.h
//  天气预报
//
//  Created by Eleven on 2023/7/31.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef void (^ADDNumBackBlock)(id num);
typedef void (^ADDCityIDBackBlock)(NSString *cityName);
typedef void (^ADDCityIconBackBlock)(id icon);

@interface SouSuoViewController : UIViewController<UITextFieldDelegate,NSURLSessionDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) ADDNumBackBlock addNumBackBlock;
@property (nonatomic, strong) ADDCityIDBackBlock addCityBackBlock;
@property (nonatomic, strong) ADDCityIconBackBlock addIconBackBlock;


@end

NS_ASSUME_NONNULL_END
