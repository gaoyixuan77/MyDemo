//
//  WeathViewController.h
//  天气预报
//
//  Created by Eleven on 2023/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ADDCityNameBlock)(NSString *cityName);
typedef void (^ADDWeathBlock)(id cityNum);
typedef void (^ADDIconBlock)(id icon);


@interface WeathViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, NSURLSessionDelegate>

@property (nonatomic, strong) ADDCityNameBlock addCityNameBlock;
@property (nonatomic, strong) ADDWeathBlock addWeathBlock;
@property (nonatomic, strong) ADDIconBlock addIconBlock;

@property (nonatomic) NSString *cityID;

@property (nonatomic) id num;


@end

NS_ASSUME_NONNULL_END
