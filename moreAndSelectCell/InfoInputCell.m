//
//  ViewController.m
//  MoreInputAndSelectCellDemo
//
//  Created by zuche on 2018/6/11.
//  Copyright © 2018年 gaucho. All rights reserved.
//


#define MainScreen_W [[UIScreen mainScreen] bounds].size.width
#define MainScreen_H [[UIScreen mainScreen] bounds].size.height
#import "InfoInputCell.h"
#import "Masonry.h"
#import "otherTool.h"

@interface InfoInputCell ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel * nameLabel;
@property (nonatomic, strong) UITextField * textField;
@property (nonatomic, strong) UIView * lineView;

@end

@implementation InfoInputCell

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textAlignment = 0;
    }
    return _nameLabel;
}
- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.textAlignment = 2;
    }
    return _textField;
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
        
        self.textField.delegate = self;
        [self.textField addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
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
    
    [self.contentView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(-15*375/MainScreen_W);
    }];
    
    [self.contentView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(0);
        make.bottom.equalTo(self.contentView).offset(0);
        make.height.mas_offset(1);
    }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)textChange:(UITextField *)textField
{
    //对应行的字数限制
    if ([_model.key isEqualToString:@"家庭住址"]) {
        return [otherTool textFieldWordNumberLimit:textField Number:15];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //表情不要
    if ([[[textField textInputMode] primaryLanguage] isEqualToString:@"emoji"] || ![[textField textInputMode] primaryLanguage]) {
        return NO;
    }
//    if (!_keyboardType) {
//        return YES;
//    }
    return YES;
}

- (void)setKeyboardType:(keyboardType)keyboardType
{
    _keyboardType = keyboardType;
    if (_keyboardType != defaualt) {
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
    }
    else{
        self.textField.keyboardType = UIReturnKeyDefault;
    }
}

- (void)setModel:(RecruitModel *)model
{
    _model = model;
    
    self.nameLabel.text = model.key;
    self.textField.placeholder = model.placeStr;
    self.textField.text = model.value;
    self.textField.enabled = YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.contentView endEditing:YES];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    _model.value = textField.text;
    self.textField.enabled = YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end


















