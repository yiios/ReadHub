//
//  AppDelegate.m
//  JJTimeShaft
//
//  Created by 罗文琦 on 2017/4/13.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import "NSDate+JJCategory.h"
#import "JJDateFormatter.h"
#import "JJCalender.h"

@implementation NSDate (Category)

+ (NSDate *)timeStringToDate: (NSString *)timeString {
    /** /// @"Mon Apr 13 11:56:38 +0800 2017",根据回调的时间字符串制定不一样的日期格式 */
    NSString * formatterString = @"EEE  MMM dd HH:mm:ss zzz yyyy";
    /** DateFormatter, Calendar初始化比较消耗内存, 定义成单例 */
    [JJDateFormatter sharedFormatter].dateFormat = formatterString;
    /** 指定区域，真机一定要指定 */
    [JJDateFormatter sharedFormatter].locale = [NSLocale localeWithLocaleIdentifier: @"en"];
    
    return [[JJDateFormatter sharedFormatter] dateFromString: timeString];
}

- (NSString *)dateToRequiredString {
    if ([[JJCalender sharedCalender] isDateInToday:self]) {
        //如果是今天
        int seconds = [[NSDate date] timeIntervalSinceDate:self];
        if (seconds < 60) {
            return @"刚刚";
        } else if (seconds < 60 * 60) {
            return [NSString stringWithFormat:@"%d分钟前", seconds / 60];
        } else {
            return [NSString stringWithFormat:@"%d小时前", seconds / 3600];
        }
    } else if ([[JJCalender sharedCalender] isDateInYesterday:self]) {
        //如果是昨天 10: 10
        [JJDateFormatter sharedFormatter].dateFormat = @"昨天 HH:mm";
        [JJDateFormatter sharedFormatter].locale =  [NSLocale localeWithLocaleIdentifier: @"en"];
        return [[JJDateFormatter sharedFormatter] stringFromDate:self];
    } else {
        //首先要取到今年是哪一年 2017
        //再取到当前的date是哪一年, 再做比较
        NSInteger thisYear = [[JJCalender sharedCalender] component:NSCalendarUnitYear fromDate: [NSDate date]];
        NSInteger dateYear = [[JJCalender sharedCalender] component:NSCalendarUnitYear fromDate: self];
        //是今年
        if (thisYear == dateYear) {
            [JJDateFormatter sharedFormatter].dateFormat = @"MM-dd HH:mm";
            [JJDateFormatter sharedFormatter].locale =  [NSLocale localeWithLocaleIdentifier: @"en"];
            return [[JJDateFormatter sharedFormatter] stringFromDate:self];
        }
        //往年
        else {
            [JJDateFormatter sharedFormatter].dateFormat = @"yyyy-MM-dd HH:mm";
            [JJDateFormatter sharedFormatter].locale =  [NSLocale localeWithLocaleIdentifier: @"en"];
            return [[JJDateFormatter sharedFormatter] stringFromDate:self];
        }
    }
}


@end
