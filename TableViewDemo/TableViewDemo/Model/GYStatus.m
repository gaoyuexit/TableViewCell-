//
//  GYStatus.m
//  TableViewDemo
//
//  Created by 郜宇 on 15/10/31.
//  Copyright © 2015年 郜宇. All rights reserved.
//

#import "GYStatus.h"

@implementation GYStatus
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
