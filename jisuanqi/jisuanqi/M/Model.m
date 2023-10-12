//
//  Model.m
//  jisuanqi
//
//  Created by Eleven on 2023/9/26.
//

#import "Model.h"

@implementation Model

- (Model*)init {
    self.a = 0;
    if (self = [super init]) {
        self.StrNum = [[NSMutableString alloc] init];
    }
    return self;
}


@end
