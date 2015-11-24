//
//  GYStatusCell.h
//  TableViewDemo
//
//  Created by 郜宇 on 15/10/31.
//  Copyright © 2015年 郜宇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GYStatusFrame;
@interface GYStatusCell : UITableViewCell
@property (nonatomic,strong)GYStatusFrame *statusFrame;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
