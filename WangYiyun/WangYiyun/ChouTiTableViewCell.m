//
//  ChouTiTableViewCell.m
//  WangYiyun
//
//  Created by Eleven on 2023/7/23.
//

#import "ChouTiTableViewCell.h"
#import "MusicTableViewCell.h"

@interface ChouTiTableViewCell ()

@property (nonatomic, strong) UITableView *tableView1;
@property (nonatomic, strong) UITableView *tableView2;
@property (nonatomic, strong) UITableView *tableView3;
@property (nonatomic, strong) UIScrollView *scroll;

@end

static NSString *str = @"id";
@implementation ChouTiTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.scroll = [[UIScrollView alloc] init];
    self.scroll.contentSize = CGSizeMake(394 * 3, 300);
    self.scroll.delegate = self;
    self.scroll.pagingEnabled = YES;
    
    self.tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 394, 300) style:UITableViewStylePlain];
    self.tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(394, 0, 394, 300) style:UITableViewStylePlain];
    self.tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(394 * 2, 0, 394, 300) style:UITableViewStylePlain];
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    self.tableView3.delegate = self;
    self.tableView3.dataSource = self;
    [self.tableView1 registerClass:[MusicTableViewCell class] forCellReuseIdentifier:str];
    [self.tableView2 registerClass:[MusicTableViewCell class] forCellReuseIdentifier:str];
    [self.tableView3 registerClass:[MusicTableViewCell class] forCellReuseIdentifier:str];

    [self.scroll addSubview:self.tableView1];
    [self.scroll addSubview:self.tableView2];
    [self.scroll addSubview:self.tableView3];
    [self.contentView addSubview:self.scroll];
    
    return self;
}

- (void)layoutSubviews {
    self.scroll.frame = CGRectMake(0, 0, 394, 852);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MusicTableViewCell *cell1 = [self.tableView1 dequeueReusableCellWithIdentifier:str];
    MusicTableViewCell *cell2 = [self.tableView2 dequeueReusableCellWithIdentifier:str];
    MusicTableViewCell *cell3 = [self.tableView3 dequeueReusableCellWithIdentifier:str];
    
    if (tableView == self.tableView1) {
        cell1.MusicimageView.image = [UIImage imageNamed:@"chaotianjiang.jpg"];
        cell1.MusicLabel.text = @"INTERNET OVERDOSE";
        return cell1;
    }else if (tableView == self.tableView2) {
        cell2.MusicimageView.image = [UIImage imageNamed:@"chaotianjiang.jpg"];
        cell2.MusicLabel.text = @"INTERNET OVERDOSE";
        return cell2;
    }
    cell3.MusicimageView.image = [UIImage imageNamed:@"chaotianjiang.jpg"];
    cell3.MusicLabel.text = @"INTERNET OVERDOSE";
    return cell3;
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
