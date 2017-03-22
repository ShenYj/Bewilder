//
//  JSTopicModel.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/20.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "JSTopicModel.h"
#import "NSDate+JSIsThisYear.h"
#import "JSDateFormatter.h"

@implementation JSTopicModel

- (instancetype)initWithTopicDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)topicWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithTopicDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (NSString *)create_at_formatter {
    return [self getWeiBoFormatterDateString:self.created_at];
}

- (NSString *)ding_string {
    return [self transformDisplayContentByNSNumber:self.ding withTitle:@"赞"];
}
- (NSString *)cai_string {
    return [self transformDisplayContentByNSNumber:self.cai withTitle:@"踩"];
}
- (NSString *)repost_string {
    return [self transformDisplayContentByNSNumber:self.repost withTitle:@"分享"];
}
- (NSString *)comment_string {
    return [self transformDisplayContentByNSNumber:self.comment withTitle:@"评论"];
}

- (NSString *)transformDisplayContentByNSNumber:(NSNumber *)aNumber withTitle:(NSString *)title {
    
    /*
     - 底部toolbar 显示的转发评论赞 格式----业务需求
     - 如果 count <= 0
     - 显示格式： 转发 评论 赞 文字
     - 如果 count > 0 && count < 10000
     - 显示格式: 是多少显示多少 例如 8888  显示 8888
     - 如果 count >= 10000
     - 显示格式: x.x 万  例如 12000  显示 1.2 万
     -  例如 10000  显示 1万  20000  显示 2万 x万
     
     */
    if (aNumber.integerValue <= 0) {
        return title;
    } else if (aNumber.integerValue > 0 && aNumber.integerValue < 1000) {
        
        return [NSString stringWithFormat:@"%@",aNumber];
    } else {
        
        CGFloat displayFloat = aNumber.floatValue / 10000;
        NSString *displayString = [NSString stringWithFormat:@"%.1f",displayFloat];
        
        if ([displayString containsString:@".0"]) {
            
            displayString = [displayString stringByReplacingOccurrencesOfString:@".0" withString:@""];
        }
        
        return [NSString stringWithFormat:@"%@万",displayString];
    }
    
}

- (NSString *)getWeiBoFormatterDateString:(NSString *)created_atSourceString {
    
    /*
     - 时间业务逻辑需求
     - 如果是今年
     - 如果是今天
     -  如果小于60秒 显示格式: 刚刚
     -  如果 s>=60 && s < 60 * 60  显示格式:xx分钟前
     -  如果 s>= 60*60  显示格式: xx小时前
     - 如果是昨天
     -  2016-06-29 12:12:12  显示格式: 昨天 12:12
     - 如果是其他
     -  2016-06-12 13:13:13  显示格式: 06月12日 13:13
     - 如果不是今年
     - 2015-05-05 10:10:10 显示格式: 2015年05月05日 10:10
     */
    //[JSDateFormatter sharedDateFormatterManager].dateFormat = @"EEE MMM dd HH:mm:ss z yyyy";
    [JSDateFormatter sharedDateFormatterManager].dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 将新浪微博返回时间字符串转回NSDate格式
    NSDate *weiboSourceDate = [[JSDateFormatter sharedDateFormatterManager] dateFromString:created_atSourceString];
    
    // 是否今年的标识
    BOOL isThisYear = [weiboSourceDate isThisYear];
    
    if (isThisYear) {// 是今年
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        if ([calendar isDateInToday:weiboSourceDate]) {// 是今天
            // 获取当前date
            NSDate *currentDate = [NSDate date];
            // 获取微博时间和当前时间的差值
            NSTimeInterval secondDIF = [currentDate timeIntervalSinceDate:weiboSourceDate];
            
            if (secondDIF < 60) { // 刚刚
                
                return @"刚刚";
                
            } else if (secondDIF >= 60 && secondDIF < 60 * 60) { //xx分钟前
                
                return [NSString stringWithFormat:@"%d分钟前",(int)(secondDIF/60)];
                
            } else { // XX小时前
                
                return [NSString stringWithFormat:@"%d小时前",(int)(secondDIF/(60*60))];
            }
            
        } else if ([calendar isDateInYesterday:weiboSourceDate]){// 昨天
            
            return [weiboSourceDate dateformatterString:@"昨天 HH:mm"];
            
        } else {
            
            return [weiboSourceDate dateformatterString:@"MM月dd日 HH:mm"];
        }
        
    } else {
        // 不是今年
        return [weiboSourceDate dateformatterString:@"yyyy年MM月dd日 HH:mm"];
    }
    
    
}

    
- (NSString *)description {
    NSArray *keys = @[@"name",@"profile_image",@"text",@"created_at",@"ding",@"cai",@"repost",@"comment"];
    return [self dictionaryWithValuesForKeys:keys].description;
    
}

@end
