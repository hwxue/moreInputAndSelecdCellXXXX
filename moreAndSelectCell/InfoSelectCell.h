//
//  ViewController.m
//  MoreInputAndSelectCellDemo
//
//  Created by zuche on 2018/6/11.
//  Copyright © 2018年 gaucho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecruitModel.h"

@interface InfoSelectCell : UITableViewCell

@property (nonatomic, strong) RecruitModel * model;
@property (nonatomic, copy) void (^selectBlock)();
@end
