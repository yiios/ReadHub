//
//  LMTopicModel.h
//  Readhub
//
//  Created by limo on 2018/3/14.
//  Copyright © 2018年 Limo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LMTopicNewsModel :NSObject
@property (nonatomic , copy) NSString              * siteName;
@property (nonatomic , copy) NSString              * duplicateId;
@property (nonatomic , copy) NSString              * pid;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * siteSlug;
@property (nonatomic , copy) NSString              * authorName;
@property (nonatomic , copy) NSString              * mobileUrl;
@property (nonatomic , copy) NSString              * groupId;
@property (nonatomic , copy) NSString              * publishDate;
@property (nonatomic , copy) NSString              * url;

@end

@interface LMTopicResultModel :NSObject
@property (nonatomic , copy) NSString              * weight;
@property (nonatomic , copy) NSString              * nerName;
@property (nonatomic , copy) NSString              * entityUniqueId;
@property (nonatomic , copy) NSString              * entityId;
@property (nonatomic , copy) NSString              * entityName;
@property (nonatomic , copy) NSString              * entityType;
@property (nonatomic , assign) BOOL              fromAlgorithm;

@end

@interface LMTopicNerResultModel :NSObject <NSCoding,NSCopying>
@property (nonatomic , strong) NSDictionary              * product;
@property (nonatomic , strong) NSDictionary              * company;
@property (nonatomic , strong) NSDictionary              * location;
@property (nonatomic , strong) NSDictionary              * person;

@end

@interface LMTopicNelDataModel :NSObject <NSCoding,NSCopying>
@property (nonatomic , assign) BOOL              state;
@property (nonatomic , strong) NSArray<LMTopicResultModel *>              * result;
@property (nonatomic , strong) LMTopicNerResultModel              * nerResult;

@end

@interface LMTopicModel :NSObject
/** id */
@property (nonatomic , copy) NSString              * pid;
/** 更新时间 */
@property (nonatomic , copy) NSString              * updatedAt;
/** <#Description#> */
@property (nonatomic , strong) NSDictionary              * extra;
/** <#Description#> */
@property (nonatomic , strong) NSArray<LMTopicNewsModel *>              * newsArray;
/** <#Description#> */
@property (nonatomic , copy) NSString              * eventData;
/** <#Description#> */
@property (nonatomic , copy) NSString              * timeline;
/** 标题 */
@property (nonatomic , copy) NSString              * title;
/** <#Description#> */
@property (nonatomic , copy) NSString              * order;
/** 概要 */
@property (nonatomic , copy) NSString              * summary;
/** <#Description#> */
@property (nonatomic , strong) LMTopicNelDataModel              * NelData;
/** <#Description#> */
@property (nonatomic , copy) NSString              * createdAt;
/** <#Description#> */
@property (nonatomic , copy) NSString              * publishDate;

/**  更新时间轴 */
@property (nonatomic , copy) NSString              * updatedRequiredString;

@end

