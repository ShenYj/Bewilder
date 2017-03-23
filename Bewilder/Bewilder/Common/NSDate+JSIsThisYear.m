//
//  NSDate+JSIsThisYear.m
//  Weibo_Object-C
//
//  Created by ShenYj on 2016/10/24.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "NSDate+JSIsThisYear.h"
#import "JSDateFormatter.h"

@implementation NSDate (JSIsThisYear)

// 判断传入的时间是否是今年
- (BOOL)isThisYear {
    
    [JSDateFormatter sharedDateFormatterManager].dateFormat = @"yyyy";
    // 取出日期的年并转成字符串
    NSString *dateYearString = [[JSDateFormatter sharedDateFormatterManager] stringFromDate:self];
    // 获取当前时间,同样取出年转为字符串
    NSDate *currentDate = [NSDate date];
    NSString *currentYearString = [[JSDateFormatter sharedDateFormatterManager] stringFromDate:currentDate];
    
    // 对比取出的年是否相同,判断是否属于今年
    if ([dateYearString isEqualToString:currentYearString]) {
        
        return YES;
        
    } else {
        
        return NO;
    }
    
}

- (BOOL)isYesterday {
    /** 忽略掉时分秒的干扰,只取年月日,将date转换成只包含年月日的字符串,再转成回NSDate,进行比较 */
    [JSDateFormatter sharedDateFormatterManager].dateFormat = @"yyyyMMdd";
    NSString *selfString = [[JSDateFormatter sharedDateFormatterManager] stringFromDate:self];
    NSString *nowString = [[JSDateFormatter sharedDateFormatterManager] stringFromDate:[NSDate date]];
    
    NSDate *selfDate = [[JSDateFormatter sharedDateFormatterManager] dateFromString:selfString];
    NSDate *nowDate = [[JSDateFormatter sharedDateFormatterManager] dateFromString:nowString];
    
    NSCalendar *calendar = nil;
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        calendar = [NSCalendar currentCalendar];
    }
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

// 将当前date转换为特定格式的字符串date
- (NSString *)dateformatterString:(NSString *)dateformatter {
    
    [JSDateFormatter sharedDateFormatterManager].dateFormat = dateformatter;
    
    return [[JSDateFormatter sharedDateFormatterManager] stringFromDate:self];
}


@end
