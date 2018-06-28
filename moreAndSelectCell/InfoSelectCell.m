//
//  ViewController.m
//  MoreInputAndSelectCellDemo
//
//  Created by zuche on 2018/6/11.
//  Copyright © 2018年 gaucho. All rights reserved.
//


#define MainScreen_W [[UIScreen mainScreen] bounds].size.width
#define MainScreen_H [[UIScreen mainScreen] bounds].size.height

#import "InfoSelectCell.h"
#import "Masonry.h"

@interface InfoSelectCell ()

@property (nonatomic, strong) UILabel * nameLabel;
@property (nonatomic, strong) UIButton * valueBtn;
@property (nonatomic, strong) UILabel * rightValueLabel;
@property (nonatomic, strong) UIView * lineView;

@end
@implementation InfoSelectCell

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textAlignment = 0;
    }
    return _nameLabel;
}

- (UILabel *)rightValueLabel
{
    if (!_rightValueLabel) {
        _rightValueLabel = [[UILabel alloc] init];
        _rightValueLabel.font = [UIFont systemFontOfSize:15];
        _rightValueLabel.textAlignment = 2;
    }
    return _rightValueLabel;
}

- (UIButton *)valueBtn
{
    if (!_valueBtn) {
        _valueBtn = [[UIButton alloc] init];
        [_valueBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _valueBtn;
}
- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor grayColor];
    }
    return _lineView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryNone;
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView).offset(0);
        make.left.equalTo(self.contentView).offset(15*375/MainScreen_W);
    }];
    
    [self.contentView addSubview:self.rightValueLabel];
    [self.rightValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(-15*375/MainScreen_W);
    }];
    
    [self.contentView addSubview:self.valueBtn];
    [self.valueBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(2);
        make.right.equalTo(self.contentView).offset(-2);
        make.top.equalTo(self.contentView).offset(2);
        make.bottom.equalTo(self.contentView).offset(-2);
    }];
    
    [self.contentView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(0);
        make.bottom.equalTo(self.contentView).offset(0);
        make.height.mas_offset(1);
    }];
}

- (void)setModel:(RecruitModel *)model
{
    _model = model;
    self.nameLabel.text = model.key;
    self.rightValueLabel.text = model.value.length>0?model.value:model.placeStr;
    self.rightValueLabel.textColor = model.value.length > 0?[UIColor grayColor]:[UIColor blackColor];
}
- (void)btnClick
{
    if (self.selectBlock) {
        self.selectBlock();
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
