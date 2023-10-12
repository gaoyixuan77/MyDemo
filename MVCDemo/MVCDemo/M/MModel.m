//
//  MModel.m
//  MVCDemo
//
//  Created by Eleven on 2023/9/7.
//

#import "MModel.h"

@implementation MModel

- (MModel*) init {
    if (self = [super init]) {
        self.zhangHuDictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)dengLu {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"dengLu" object:self userInfo:self.zhangHuDictionary];
    NSLog(@"登录时：%@", self.zhangHuDictionary);
}

- (void)zhuCe: (NSString*)zhangHao :(NSString*)miMa {
    [self.zhangHuDictionary setObject:miMa forKey:zhangHao];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"zhuCe" object:self userInfo:self.zhangHuDictionary];
    NSLog(@"注册后：%@", self.zhangHuDictionary);
}

@end
