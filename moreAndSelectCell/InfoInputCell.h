//
//  ViewController.m
//  MoreInputAndSelectCellDemo
//
//  Created by zuche on 2018/6/11.
//  Copyright © 2018年 gaucho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecruitModel.h"

typedef enum :NSUInteger{
    defaualt,
    tel,
} keyboardType;

@interface InfoInputCell : UITableViewCell

//NO为不限制 YES为数字
@property (nonatomic, assign) keyboardType keyboardType;
@property (nonatomic, strong) RecruitModel * model;

@end
