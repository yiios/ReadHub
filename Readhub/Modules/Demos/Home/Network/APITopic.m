//
//  APITopic.m
//  Readhub
//
//  Created by limo on 2018/3/14.
//  Copyright © 2018年 Limo. All rights reserved.
//

#import "APITopic.h"
#import "LMTopicPageInfo.h"
#import "LMTopicModel.h"
#import "QDCustomToastAnimator.h"


@interface APITopic ()

/**
 *  翻页对象
 */
@property (nonatomic, strong) LMTopicPageInfo *pageInfo;

/**
 *  是否还有更多的条目（NO表示没有更多了，YES表示还有更多）
 */
@property (nonatomic, assign) BOOL hasMore;


@end

@implementation APITopic



- (void)loadAndResponseCache:(void(^)(NSArray<LMTopicModel *> *))cache Success:(void (^)(NSArray<LMTopicModel *> *dataArr))success failure:(void (^)(NSError *error))failure{
    
    
    // 请求数据
    [self loadDataWithSelfPageInfoAndResponseCache:cache Success:success failure:failure];
}



- (void)nextDataAndResponseCache:(void(^)(NSArray<LMTopicModel *> *))cache Success:(void (^)(NSArray<LMTopicModel *> *dataArr))success failure:(void (^)(NSError *error,BOOL hasMore))failure {
    
    // 判断是否可以继续翻页
    if (self.hasMore == NO) {
        // 没有更多直接退出
        failure(nil, self.hasMore);
        return;
    }
    
    
    // 请求数据
    [self loadDataWithSelfPageInfoAndResponseCache:cache Success:success failure:^(NSError *error) {
        failure(error, self.hasMore);
    }];
}


/**
 *  根据当前的请求Api数据发起网络请求
 */
- (void)loadDataWithSelfPageInfoAndResponseCache:(void(^)(NSArray<LMTopicModel *> *))cache Success:(void (^)(NSArray<LMTopicModel *> *))success failure:(void (^)(NSError *))failure{
    
    NSDictionary *dic = [self.pageInfo whc_Dictionary];
    WS(weakSelf);
    [self getCacheAPIString:@"topic" parameter:dic responseCache:^(id responseCache) {
        // 校验是否成功状态
        NSDictionary *responseDic;
        if ([responseCache isKindOfClass:[NSDictionary class]]) {
            responseDic = responseCache;
        } else {
            [QMUITips showError:@"加载缓存失败"];
            failure(nil);
            return;
        }
        
        NSMutableArray<LMTopicModel *> *dataArr = [NSMutableArray array];
        for (NSDictionary *dic in responseDic[@"data"]) {
            LMTopicModel *goodsPickupImgModel = [LMTopicModel whc_ModelWithJson:dic];
            [dataArr addObject:goodsPickupImgModel];
        }
        
        if (dataArr.count == 0) {
            QMUITips *tips = [QMUITips createTipsToView:DefaultTipsParentView];
            QDCustomToastAnimator *customAnimator = [[QDCustomToastAnimator alloc] initWithToastView:tips];
            tips.toastAnimator = customAnimator;
            [tips showInfo:@"暂无数据" detailText:@"您真有毅力" hideAfterDelay:2];
        } else if (dataArr.count != weakSelf.pageInfo.pageSize) {
            weakSelf.hasMore = NO;
        }
        
        success(dataArr);
        
    } success:^(NSDictionary *responseObject) {
        // 校验是否成功状态
        NSDictionary *responseDic;
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            responseDic = responseObject;
        } else {
            [QMUITips showError:@"加载失败，请检查网络情况"];
            failure(nil);
            return;
        }
        
        NSMutableArray<LMTopicModel *> *dataArr = [NSMutableArray array];
        for (NSDictionary *dic in responseDic[@"data"]) {
            LMTopicModel *goodsPickupImgModel = [LMTopicModel whc_ModelWithJson:dic];
            [dataArr addObject:goodsPickupImgModel];
        }
        
        if (dataArr.count == 0) {
            QMUITips *tips = [QMUITips createTipsToView:DefaultTipsParentView];
            QDCustomToastAnimator *customAnimator = [[QDCustomToastAnimator alloc] initWithToastView:tips];
            tips.toastAnimator = customAnimator;
            [tips showInfo:@"暂无数据" detailText:@"您真有毅力" hideAfterDelay:2];
        } else if (dataArr.count != weakSelf.pageInfo.pageSize) {
            weakSelf.hasMore = NO;
        }
        
        success(dataArr);

    } failure:^(NSError *error) {
        failure(error);
    }];
    
}


//- (NSMutableArray<LMTopicModel *> *)parsingDataWithResponse:(id)responseObject {
//
//
//}

- (LMTopicPageInfo *)pageInfo {
    if (_pageInfo == nil) {
        _pageInfo = [[LMTopicPageInfo alloc] init];
        _pageInfo.lastCursor = @"";
        _pageInfo.pageSize = 10;
    }
    return _pageInfo;
}

@end
