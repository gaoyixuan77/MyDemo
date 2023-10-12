//
//  MModel.h
//  MVCDemo
//
//  Created by Eleven on 2023/9/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MModel : NSObject

@property (nonatomic, strong) NSMutableDictionary* zhangHuDictionary;

- (void)dengLu;
- (void)zhuCe: (NSString*)zhangHao :(NSString*)miMa;

@end

NS_ASSUME_NONNULL_END
