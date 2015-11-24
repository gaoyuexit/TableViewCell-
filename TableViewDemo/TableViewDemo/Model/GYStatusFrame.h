//
//  GYStatusFrame.h
//  TableViewDemo
//
//  Created by 郜宇 on 15/10/31.
//  Copyright © 2015年 郜宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define NameFont [UIFont systemFontOfSize:14]
#define TextFont [UIFont systemFontOfSize:15]
@class GYStatus;
@interface GYStatusFrame : NSObject
@property(nonatomic,assign,readonly) CGRect iconF;
@property(nonatomic,assign,readonly) CGRect nameF;
@property(nonatomic,assign,readonly) CGRect vipF;
@property(nonatomic,assign,readonly) CGRect textF;
@property(nonatomic,assign,readonly) CGRect pictureF;
@property(nonatomic,assign,readonly) CGFloat cellHeight;
@property(nonatomic,strong)GYStatus *status;
@end
