//
//  AppDelegate.m
//  JJTimeShaft
//
//  Created by 罗文琦 on 2017/4/13.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import "JJCalender.h"

@implementation JJCalender

/**
 创建一个日历的单例
 
 @return 日历的单例
 */
+ (instancetype) sharedCalender {
    static JJCalender *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = (JJCalender *)[JJCalender currentCalendar];
    });
    
    return instance;
}


@end
