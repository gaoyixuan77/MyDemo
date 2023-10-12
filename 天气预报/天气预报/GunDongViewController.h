//
//  gunDongViewController.h
//  天气预报
//
//  Created by Eleven on 2023/8/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface gunDongViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>


@property (nonatomic) NSMutableArray *arrDictArray;
@property (nonatomic) NSMutableArray *cityArray;
@property (nonatomic) NSInteger location;

@end

NS_ASSUME_NONNULL_END

