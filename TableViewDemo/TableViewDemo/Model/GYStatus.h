//
//  GYStatus.h
//  TableViewDemo
//
//  Created by 郜宇 on 15/10/31.
//  Copyright © 2015年 郜宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GYStatus : NSObject

/** 内容 */
@property (nonatomic,copy)NSString *text;
/** 图标 */
@property (nonatomic,copy)NSString *icon;
/** 图片 */
@property (nonatomic,copy)NSString *picture;
/** 昵称 */
@property (nonatomic,copy)NSString *name;
/** 是否是会员 */
@property (nonatomic,assign)BOOL vip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)statusWithDict:(NSDictionary *)dict;


@end
