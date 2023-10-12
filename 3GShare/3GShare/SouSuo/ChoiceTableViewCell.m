//
//  ChoiceTableViewCell.m
//  3GShare
//
//  Created by Eleven on 2023/7/23.
//

#import "ChoiceTableViewCell.h"

@implementation ChoiceTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.contentView.backgroundColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1];
    
    self.choice1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.choice2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.choice3 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.choice4 = [UIButton buttonWithType:UIButtonTypeCustom];

    [self.choice1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.choice1 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.choice1 addTarget:self action:@selector(pressSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.choice1 setBackgroundColor:[UIColor whiteColor]];
    
    [self.choice2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.choice2 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.choice2 addTarget:self action:@selector(pressSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.choice2 setBackgroundColor:[UIColor whiteColor]];
    
    [self.choice3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.choice3 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.choice3 addTarget:self action:@selector(pressSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.choice3 setBackgroundColor:[UIColor whiteColor]];

    [self.choice4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.choice4 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.choice4 addTarget:self action:@selector(pressSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.choice4 setBackgroundColor:[UIColor whiteColor]];
    
    [self.contentView addSubview:self.choice1];
    [self.contentView addSubview:self.choice2];
    [self.contentView addSubview:self.choice3];
    [self.contentView addSubview:self.choice4];
    
    return self;
}

- (void)layoutSubviews {
    self.choice1.frame = CGRectMake(10, 5, 80, 40);
    self.choice2.frame = CGRectMake(105, 5, 80, 40);
    self.choice3.frame = CGRectMake(205, 5, 80, 40);
    self.choice4.frame = CGRectMake(305, 5, 80, 40);

}

- (void)pressSelected: (UIButton*)btn {
    if (btn == self.choice1) {
        if (self.choice1.selected == NO) {
            self.choice1.selected = YES;
            [self.choice1 setBackgroundColor:[UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1]];
        } else {
            self.choice1.selected = NO;
            [self.choice1 setBackgroundColor:[UIColor whiteColor]];

        }
    }
    if (btn == self.choice2) {
        if (self.choice2.selected == NO) {
            self.choice2.selected = YES;
            [self.choice2 setBackgroundColor:[UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1]];
        } else {
            self.choice2.selected = NO;
            [self.choice2 setBackgroundColor:[UIColor whiteColor]];
        }
    }
    if (btn == self.choice3) {
        if (self.choice3.selected == NO) {
            self.choice3.selected = YES;
            [self.choice3 setBackgroundColor:[UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1]];

        } else {
            self.choice3.selected = NO;
            [self.choice3 setBackgroundColor:[UIColor whiteColor]];

        }
    }
    if (btn == self.choice4) {
        if (self.choice4.selected == NO) {
            self.choice4.selected = YES;
            [self.choice4 setBackgroundColor:[UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1]];

        } else {
            self.choice4.selected = NO;
            [self.choice4 setBackgroundColor:[UIColor whiteColor]];

        }
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
