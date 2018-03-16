//
//  LMTopicPageInfo.h
//  Readhub
//
//  Created by limo on 2018/3/15.
//  Copyright © 2018年 Limo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMTopicPageInfo : NSObject

/**
 *  上一页数据最后一个话题的order，首次传空
 */
@property (nonatomic, copy) NSString * lastCursor;

/**
 *  一次请求拉取的话题数目
 */
@property (nonatomic, assign) NSInteger pageSize;

@end
