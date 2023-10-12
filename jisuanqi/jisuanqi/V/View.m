#import "View.h"

#import "Masonry.h"

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

@implementation View

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor blackColor];
    
    self.label = [[UILabel alloc] init];
    [self addSubview:self.label];
    self.label.textColor = [UIColor whiteColor];
    self.label.textAlignment = NSTextAlignmentRight;
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.mas_equalTo(270);
        make.height.mas_equalTo(@100);
        make.width.mas_equalTo(360);
    }];
    self.label.font = [UIFont systemFontOfSize:50];
    
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 4; j++) {
            self.Button = [UIButton buttonWithType:UIButtonTypeCustom];
            [self addSubview:self.Button];
            [self.Button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(102 * j + 15);
                make.top.mas_equalTo(102 * i + 375);
                make.width.and.height.mas_equalTo(@90);
            }];
            [self.Button addTarget:self action:@selector(pressPutin:) forControlEvents:UIControlEventTouchUpInside];
            self.Button.layer.cornerRadius = 45;
            self.Button.layer.masksToBounds = YES;
            self.Button.titleLabel.font = [UIFont systemFontOfSize:40];

            self.Button.tag = i * 4 + j;
            if (self.Button.tag == 0) {
                [self.Button setTitle:@"AC" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor grayColor]];
            }
            if (self.Button.tag == 1) {
                [self.Button setTitle:@"(" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor grayColor]];
            }
            if (self.Button.tag == 2) {
                [self.Button setTitle:@")" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor grayColor]];
            }
            if (self.Button.tag == 3) {
                [self.Button setTitle:@"/" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor orangeColor]];
            }
            if (self.Button.tag == 4) {
                [self.Button setTitle:@"7" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor darkGrayColor]];
            }
            if (self.Button.tag == 5) {
                [self.Button setTitle:@"8" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor darkGrayColor]];
            }
            if (self.Button.tag == 6) {
                [self.Button setTitle:@"9" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor darkGrayColor]];
            }
            if (self.Button.tag == 7) {
                [self.Button setTitle:@"*" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor orangeColor]];
            }
            if (self.Button.tag == 8) {
                [self.Button setTitle:@"4" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor darkGrayColor]];
            }
            if (self.Button.tag == 9) {
                [self.Button setTitle:@"5" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor darkGrayColor]];
            }
            if (self.Button.tag == 10) {
                [self.Button setTitle:@"6" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor darkGrayColor]];
            }
            if (self.Button.tag == 11) {
                [self.Button setTitle:@"-" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor orangeColor]];
            }
            if (self.Button.tag == 12) {
                [self.Button setTitle:@"1" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor darkGrayColor]];
            }
            if (self.Button.tag == 13) {
                [self.Button setTitle:@"2" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor darkGrayColor]];
            }
            if (self.Button.tag == 14) {
                [self.Button setTitle:@"3" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor darkGrayColor]];
            }
            if (self.Button.tag == 15) {
                [self.Button setTitle:@"+" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor orangeColor]];
            }
            if (self.Button.tag == 16) {
                [self.Button setTitle:@"0" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor darkGrayColor]];
                [self.Button mas_updateConstraints: ^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(102 * j + 15);
                    make.top.mas_equalTo(102 * i + 375);
                    make.width.mas_equalTo(@192);
                    make.height.mas_equalTo(@90);
                }];
            }
            if (self.Button.tag == 17) {
                [self.Button setTitle:@"." forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor darkGrayColor]];
                [self.Button mas_updateConstraints: ^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(102 * (j+1) + 15);
                    make.top.mas_equalTo(102 * i + 375);
                    make.width.and.height.mas_equalTo(@90);
                }];
            }
            if (self.Button.tag == 18) {
                [self.Button setTitle:@"=" forState:UIControlStateNormal];
                [self.Button setBackgroundColor:[UIColor orangeColor]];
                [self.Button mas_updateConstraints: ^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(102 * (j+1) + 15);
                    make.top.mas_equalTo(102 * i + 375);
                    make.width.and.height.mas_equalTo(@90);
                }];
            }
        }
        
    }
    return self;
}


- (void)pressPutin: (UIButton*)Button {
    NSLog(@"OK");
    NSDictionary *dict =[NSDictionary dictionaryWithObject:Button forKey:@"btn"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NumGo" object:nil userInfo:dict];
}
@end
