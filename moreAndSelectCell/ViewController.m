//
//  ViewController.m
//  moreAndSelectCell
//
//  Created by gaucho on 2018/6/28.
//  Copyright © 2018年 gaucho. All rights reserved.
//

#define MyScreen [UIScreen mainScreen].bounds.size

#import "ViewController.h"
#import "InfoInputCell.h"
#import "Masonry.h"
#import "RecruitModel.h"
#import "TPKeyboardAvoidingTableView.h"
#import "InfoSelectCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) TPKeyboardAvoidingTableView * KeyboardTableView;
@property (nonatomic, copy) NSMutableArray * dataArray;
@property (nonatomic, strong) UIView * submitrView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    // Do any additional setup after loading the view, typically from a nib.
}

- (UIView *)submitrView
{
    if (!_submitrView) {
        _submitrView = [[UIView alloc] init];
        _submitrView.backgroundColor = [UIColor redColor];
        _submitrView.frame = CGRectMake(0, 0, MyScreen.width, 80);
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 10, 335, 30)];
        [btn setTitle:@"提交" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor blueColor];
        [btn addTarget:self action:@selector(releaseFortuneTellInformation) forControlEvents:UIControlEventTouchUpInside];
        [_submitrView addSubview:btn];
    }
    return _submitrView;
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _dataArray;
}

-(UITableView *)KeyboardTableView{
    if (!_KeyboardTableView) {
        _KeyboardTableView = [[TPKeyboardAvoidingTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _KeyboardTableView.delegate = self;
        _KeyboardTableView.dataSource = self;
        _KeyboardTableView.rowHeight = 44;
        
        _KeyboardTableView.estimatedSectionFooterHeight = 0;
        _KeyboardTableView.estimatedSectionHeaderHeight = 0;
        _KeyboardTableView.backgroundColor = [UIColor orangeColor];
        _KeyboardTableView.showsVerticalScrollIndicator = NO;
        _KeyboardTableView.showsHorizontalScrollIndicator = NO;
        _KeyboardTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _KeyboardTableView.tableFooterView = [[UIView alloc]init];
        _KeyboardTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
        [self.view addSubview:_KeyboardTableView];
    }
    return _KeyboardTableView;
}

- (void)setupUI
{
    NSArray * array = @[@[@"家庭电话",@"家庭地址",@"家庭住址邮政编码",@"婚姻状况",@"户籍类型"],@[@"房产情况",@"居住类型",@"联系人",@"其他联系电话"],@[@"直系亲属关系",@"姓名",@"工作单位",@"联系电话"]];
    
    for (NSArray * subArray in array) {
        NSMutableArray * tmp_Arr = [NSMutableArray array];
        for (NSString * str in subArray) {
            RecruitModel * model = [[RecruitModel alloc] init];
            model.desciptionStr = @"家庭信息";
            model.key = str;
            NSString * value = @"";
            model.value = value;
            [tmp_Arr addObject:model];
        }
        [self.dataArray addObject:tmp_Arr];
    }
    
    self.KeyboardTableView.frame = CGRectMake(0, 64, MyScreen.width, MyScreen.height - 64);
    self.KeyboardTableView.tableHeaderView = nil;
    self.KeyboardTableView.tableFooterView = self.submitrView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)self.dataArray[section]).count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            return [self OneSection:tableView indexPath:indexPath];
        }
            break;
        case 1:
        {
            return [self TwoSection:tableView indexPath:indexPath];
        }
            break;
        case 2:
        {
            return [self ThreeSection:tableView indexPath:indexPath];
        }
            break;
        default:
            break;
    }
    return [UITableViewCell new];
}
- (UITableViewCell*)OneSection:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 3 || indexPath.row == 4) {
        return [self selectCell:tableView indexPath:indexPath];
    }
    return [self inputCell:tableView indexPath:indexPath];
}

- (UITableViewCell*)TwoSection:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 || indexPath.row == 1) {
        return [self selectCell:tableView indexPath:indexPath];
    }
    return [self inputCell:tableView indexPath:indexPath];
}

- (UITableViewCell*)ThreeSection:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return [self selectCell:tableView indexPath:indexPath];
    }
    return [self inputCell:tableView indexPath:indexPath];
}

- (InfoSelectCell *)selectCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"InfoSelectCellName";
    InfoSelectCell * cell = (InfoSelectCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[InfoSelectCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    RecruitModel * model = self.dataArray[indexPath.section][indexPath.row];
    cell.model = model;
    
    __weak typeof (self) weakSelf = self;
    cell.selectBlock = ^{
        [weakSelf.view endEditing:YES];
        if ([model.key isEqualToString:@"婚姻状况"]) {
            NSLog(@"跳转到婚姻状况选择页面");
            model.value = @"已婚";
        } else if ([model.key isEqualToString:@"户籍类型"]) {
            NSLog(@"跳转到户籍选择页面");
            model.value = @"河北省保定市";
        } else if ([model.key isEqualToString:@"房产情况"]) {
            NSLog(@"跳转到房产情况选择页面");
            model.value = @"有房产";
        } else if ([model.key isEqualToString:@"居住类型"]) {
            NSLog(@"跳转到居住类型选择页面");
            model.value = @"自己住";
        } else {
            NSLog(@"跳转到直系亲属选择页面");
            model.value = @"母亲";
        }
    };
    return cell;
}

-(InfoInputCell*)inputCell:(UITableView*)tableView indexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"InfoInputCellNamesss";
    InfoInputCell * cell = (InfoInputCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[InfoInputCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    RecruitModel * model = self.dataArray[indexPath.section][indexPath.row];
    cell.model = model;
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0 || indexPath.row == 2) {
            cell.keyboardType = tel;
        } else {
            cell.keyboardType = defaualt;
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 3) {
            cell.keyboardType = tel;
        } else {
            cell.keyboardType = defaualt;
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 3) {
            cell.keyboardType = tel;
        } else {
            cell.keyboardType = defaualt;
        }
    }
    return cell;
}

- (void)releaseFortuneTellInformation
{
    [self.view endEditing:YES];
    NSMutableDictionary * tmp_dict = [NSMutableDictionary dictionary];
    
    for (NSArray * array in self.dataArray) {
        for (RecruitModel * model in array) {
            if (model.value.length > 0) {
                [tmp_dict setObject:model.value forKey:model.submitStr];
            }
        }
    }
    
    [self submitInfoWithDict:tmp_dict];
}

- (void)submitInfoWithDict:(NSMutableDictionary *)tempDict
{
    NSLog(@"这里提交检查数据对不啦");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
