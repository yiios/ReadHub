//
//  APIBaseClass.m
//  Readhub
//
//  Created by limo on 2018/3/14.
//  Copyright © 2018年 Limo. All rights reserved.
//

#import "APIBaseClass.h"
#import "PPNetworkHelper.h"

@implementation APIBaseClass

- (void)getAPIString:(NSString *)apiString parameter:(NSDictionary *)parameters success:(void (^)(NSDictionary *responseObject))success    failure:(void (^)(NSError *error))failure{
    
    [PPNetworkHelper GET:[self generateAPIURLWithAPIString:apiString] parameters:parameters success:^(id responseObject) {
        //请求成功
        success(responseObject);
    } failure:^(NSError *error) {
        //请求失败
        failure(error);
    }];

}

- (void)getCacheAPIString:(NSString *)apiString parameter:(NSDictionary *)parameters responseCache:(void(^)(id responseCache))cache success:(void (^)(NSDictionary *responseObject))success    failure:(void (^)(NSError *error))failure{
    
    [PPNetworkHelper GET:[self generateAPIURLWithAPIString:apiString] parameters:parameters responseCache:^(id responseCache) {
        cache(responseCache);
    }  success:^(id responseObject) {
        //请求成功
        success(responseObject);
    } failure:^(NSError *error) {
        //请求失败
        failure(error);
    }];
    
}


#pragma makr - Private Methods
- (NSString *)generateAPIURLWithAPIString:(NSString *)apiString {
    
    return [NSString stringWithFormat:@"%@%@",@"https://api.readhub.me/",apiString];

}

@end
