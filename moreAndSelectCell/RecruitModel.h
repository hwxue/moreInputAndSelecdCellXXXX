//
//  ViewController.m
//  MoreInputAndSelectCellDemo
//
//  Created by zuche on 2018/6/11.
//  Copyright © 2018年 gaucho. All rights reserved.
//

#import "BaseModel.h"

@interface RecruitModel : BaseModel

@property (nonatomic, copy) NSString * key;
@property (nonatomic, copy) NSString * desciptionStr;
@property (nonatomic, copy) NSString * value;
@property (nonatomic, copy) NSString * twoValue;
@property (nonatomic, copy) NSString * placeStr;
@property (nonatomic, copy) NSString * submitStr;
@property (nonatomic, assign) BOOL isWoman;
@property (nonatomic, strong) NSArray * imageArray;
@property (nonatomic, strong) NSArray * welfareArray;
@property (nonatomic,strong)NSMutableArray * btnSelectArray;
@property (nonatomic,copy)NSNumber *modelId;

@end
