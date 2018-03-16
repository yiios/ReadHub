//
//  APIBaseClass.h
//  Readhub
//
//  Created by limo on 2018/3/14.
//  Copyright © 2018年 Limo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIBaseClass : NSObject

/**
 GET请求,无缓存

 @param apiString 请求接口名
 @param parameters 请求参数
 @param success 请求成功的回调
 @param failure 请求失败的回调
 */
- (void)getAPIString:(NSString *)apiString parameter:(NSDictionary *)parameters success:(void (^)(NSDictionary *responseObject))success    failure:(void (^)(NSError *error))failure;


/**
 GET请求,自动缓存

 @param apiString 请求地址
 @param parameters    请求参数
 @param cache 缓存数据的回调
 @param success       请求成功的回调
 @param failure       请求失败的回调
 */
- (void)getCacheAPIString:(NSString *)apiString parameter:(NSDictionary *)parameters responseCache:(void(^)(id responseCache))cache success:(void (^)(NSDictionary *responseObject))success    failure:(void (^)(NSError *error))failure;

@end
