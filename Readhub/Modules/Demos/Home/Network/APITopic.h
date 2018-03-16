//
//  APITopic.h
//  Readhub
//
//  Created by limo on 2018/3/14.
//  Copyright © 2018年 Limo. All rights reserved.
//

#import "APIBaseClass.h"

@class LMTopicModel;

@interface APITopic : APIBaseClass
/**
 获取第一页数据

 @param cache 缓存命中回调
 @param success 成功回调
 @param failure 失败回调
 */
- (void)loadAndResponseCache:(void(^)(NSArray<LMTopicModel *> *))cache Success:(void (^)(NSArray<LMTopicModel *> *dataArr))success failure:(void (^)(NSError *error))failure;

/**
 获取翻下一页数据

 @param cache 缓存命中回调
 @param success 成功回调
 @param failure 失败回调
 */
- (void)nextDataAndResponseCache:(void(^)(NSArray<LMTopicModel *> *))cache Success:(void (^)(NSArray<LMTopicModel *> *dataArr))success failure:(void (^)(NSError *error,BOOL hasMore))failure;

@end
