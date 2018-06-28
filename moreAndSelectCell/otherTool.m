//
//  ViewController.m
//  MoreInputAndSelectCellDemo
//
//  Created by zuche on 2018/6/11.
//  Copyright © 2018年 gaucho. All rights reserved.
//

#import "otherTool.h"

@implementation otherTool

+(void)textFieldWordNumberLimit:(UITextField *)textField Number:(NSInteger)Number{
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position || !selectedRange)
    {
        //        [textField setText:[self disable_emoji:[textField text]]];
        NSString *toBeString = textField.text;
        
        if (toBeString.length > Number)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:Number];
            if (rangeIndex.length == 1)
            {
                textField.text = [toBeString substringToIndex:Number];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, Number)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}

@end
