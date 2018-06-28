//
//  ViewController.m
//  MoreInputAndSelectCellDemo
//
//  Created by zuche on 2018/6/11.
//  Copyright © 2018年 gaucho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property (nonatomic, copy) NSString * codeAddress;
//拷贝属性的方法
- (void)copy:(id)model;
/**
 *  字典转模型的方法
 *
 *  @param keyedValues 需要转化的字典
 *  @param dict        需要特殊处理的字段
 */
+(id)setValuesForKeysWithDictionary:(NSDictionary*)keyedValues ObjectClassInArray:(NSDictionary*)dict;

@end
