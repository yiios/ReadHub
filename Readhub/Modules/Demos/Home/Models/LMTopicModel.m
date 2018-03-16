//
//  LMTopicModel.m
//  Readhub
//
//  Created by limo on 2018/3/14.
//  Copyright © 2018年 Limo. All rights reserved.
//

#import "LMTopicModel.h"
#import "NSDate+JJCategory.h"

@implementation LMTopicModel
/// 模型类可自定义属性名称
+ (NSDictionary <NSString *, NSString *> *)whc_ModelReplacePropertyMapper {
    return @{@"id": @"pid"};
}

- (void)setUpdatedAt:(NSString *)updatedAt {
    _updatedAt = updatedAt;
    if (_updatedAt != nil) {
        //把时间字符串转化成标准的时间格式
        NSDate *timeDate = [NSDate timeStringToDate:updatedAt];
        //转换成时间轴
        self.updatedRequiredString = [timeDate dateToRequiredString];
    }
}

@end

@implementation LMTopicNewsModel
/// 模型类可自定义属性名称
+ (NSDictionary <NSString *, NSString *> *)whc_ModelReplacePropertyMapper {
    return @{@"id": @"pid"};
}

@end

@implementation LMTopicResultModel

@end


@implementation LMTopicNerResultModel
- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        [self whc_Decode:decoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [self whc_Encode:encoder];
}

- (id)copyWithZone:(NSZone *)zone {
    return [self whc_Copy];
}

@end

@implementation LMTopicNelDataModel
- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        [self whc_Decode:decoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [self whc_Encode:encoder];
}

- (id)copyWithZone:(NSZone *)zone {
    return [self whc_Copy];
}

@end


