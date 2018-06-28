//
//  ViewController.m
//  MoreInputAndSelectCellDemo
//
//  Created by zuche on 2018/6/11.
//  Copyright © 2018年 gaucho. All rights reserved.
//

#import "RecruitModel.h"

@implementation RecruitModel

-(NSString *)placeStr
{
    if (self.key) {
        return [[self class] getPlaceDictFor:self.desciptionStr twoKey:self.key];
    }
    return nil;
}

- (NSString *)submitStr
{
    if (self.key) {
        NSString * value = [[self class] getSubmitDictFor:self.desciptionStr twoKey:self.key];
        return value?value:@"";
    }
    return @"";
}

-(NSString *)value
{
//    if ([_key isEqualToString:@"福利补助（选填）"]) {
//        NSString * str = @"";
//        for (NSString * tempStr in _btnSelectArray) {
//            str = [NSString stringWithFormat:@"%@%@,",str,tempStr];
//        }
//        return str;
//    }
    if (_value) {
        return _value;
    }
    return @"";
}

- (NSMutableArray *)btnSelectArray
{
    if (!_btnSelectArray) {
        _btnSelectArray = [NSMutableArray array];
    }
    return _btnSelectArray;
}
+ (NSString *)getPlaceDictFor:(NSString *)oneKey twoKey:(NSString *)twoKey
{
    NSDictionary * dict = @{@"家庭信息":@{@"家庭电话":@"请输入",@"家庭地址":@"请输入",@"家庭住址邮政编码":@"请输入",@"婚姻状况":@"请选择",@"户籍类型":@"本省本市",@"房产情况":@"有房产无房贷",@"居住类型":@"自有住房",@"联系人":@"请输入",@"其他联系电话":@"请输入",@"直系亲属关系":@"父母",@"姓名":@"请输入",@"工作单位":@"请输入",@"联系电话":@"请输入"}};
    if ( ((NSDictionary*)dict[oneKey])[twoKey]) {
        return  ((NSDictionary*)dict[oneKey])[twoKey];
    }
    else{
        return dict[twoKey];
    }
}

+(NSString*)getSubmitDictFor:(NSString*)oneKey twoKey:(NSString*)twoKey
{
    NSDictionary * dict = @{@"家庭信息":@{@"家庭电话":@"homeTelNum",@"家庭地址":@"homeAddress",@"家庭住址邮政编码":@"homePostNum",@"婚姻状况":@"isMarry",@"户籍类型":@"peopleAddress",@"房产情况":@"isHaveHouse",@"居住类型":@"isPersonHouse",@"联系人":@"personName",@"其他联系电话":@"otherTelNum",@"直系亲属关系":@"isMother",@"姓名":@"motherName",@"工作单位":@"jobPlace",@"联系电话":@"motherNum"}};
    
    if ( ((NSDictionary*)dict[oneKey])[twoKey]) {
        return  ((NSDictionary*)dict[oneKey])[twoKey];
    }
    else{
        return dict[twoKey];
    }
}
@end















