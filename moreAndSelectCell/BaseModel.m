//
//  ViewController.m
//  MoreInputAndSelectCellDemo
//
//  Created by zuche on 2018/6/11.
//  Copyright © 2018年 gaucho. All rights reserved.
//


#import "BaseModel.h"
#import <objc/runtime.h>
#import "MJExtension.h"

@interface BaseModel ()

@end

@implementation BaseModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
-(id)valueForUndefinedKey:(NSString *)key
{
    return @"";
}

-(NSString *)codeAddress{
    return  [NSString stringWithFormat:@"%@/%@",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] ,NSStringFromClass([self class])] ;
}

-(void)copy:(id)model{
    
    unsigned int count = 0;
    
    objc_property_t * property = class_copyPropertyList([model class], &count);
    
    for (int i = 0; i < count; i++) {
        const char * modelName =(property_getName(property[i]));
        
        
        NSString * modelNameStr = [NSString stringWithUTF8String:modelName];
        
        id value = [model valueForKey:modelNameStr];
        
        [self setValue:value forKey:modelNameStr];
    }
}


+(id)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues ObjectClassInArray:(NSDictionary *)dict{
    [[self class] mj_setupObjectClassInArray:^NSDictionary *{
        return dict;
    }];
    return [[self class] mj_objectWithKeyValues:keyedValues];
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if (oldValue == nil) {
        return nil;
    } else if (property.type.typeClass == [NSDecimalNumber class]) {
        if ([oldValue isKindOfClass:[NSNumber class]]) {
            return [[NSDecimalNumber alloc] initWithString:[NSString stringWithFormat:@"%lf",[oldValue doubleValue]]];
        }
    }
    return oldValue;
}
@end
