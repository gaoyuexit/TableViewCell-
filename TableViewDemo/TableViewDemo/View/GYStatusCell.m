//
//  GYStatusCell.m
//  TableViewDemo
//
//  Created by 郜宇 on 15/10/31.
//  Copyright © 2015年 郜宇. All rights reserved.
//

#import "GYStatusCell.h"
#import "GYStatusFrame.h";
#import "GYStatus.h"
@interface GYStatusCell ()
/** 头像 */
@property (nonatomic,weak)UIImageView *iconView;
/** 会员图标 */
@property (nonatomic,weak)UIImageView *vipView;
/** 图片 */
@property (nonatomic,weak)UIImageView *pictureView;
/** 昵称 */
@property (nonatomic,weak)UILabel *nameLabel;
/** 内容 */
@property (nonatomic,weak)UILabel *contentLabel;
@end

@implementation GYStatusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCustomView];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    NSString *ID = @"StatusCell";
    GYStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[GYStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}


- (void)setupCustomView
{
    /** 头像 */
    UIImageView *iconView = [[UIImageView alloc] init];
    [self addSubview:iconView];
    self.iconView = iconView;
    /** 会员图标 */
    UIImageView *vipView = [[UIImageView alloc] init];
    vipView.image = [UIImage imageNamed:@"vip.png"];
    [self addSubview:vipView];
    self.vipView = vipView;
    /** 图片 */
    UIImageView *pictureView = [[UIImageView alloc] init];
    [self addSubview:pictureView];
    self.pictureView = pictureView;;
    /** 昵称 */
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.numberOfLines = 0;
    nameLabel.font = NameFont;
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    /** 内容 */
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.numberOfLines = 0;
    contentLabel.font = TextFont;
    [self addSubview:contentLabel];
    self.contentLabel = contentLabel;
}
- (void)setStatusFrame:(GYStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    //设置数据
    [self settingData];
    //设置尺寸
    [self settingFrame];
}
- (void)settingData
{
    GYStatus *status = self.statusFrame.status;
    self.iconView.image = [UIImage imageNamed:status.icon];
    self.nameLabel.text = status.name;
    self.contentLabel.text = status.text;
    if (status.vip == 1) { //是会员
        self.vipView.hidden = NO;
    }else{ //不是会员
        self.vipView.hidden = YES;
    }
    if (status.picture) { //存在图片
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:status.picture];
    }else{
        self.pictureView.hidden = YES;
    }
}
- (void)settingFrame
{
    self.iconView.frame = self.statusFrame.iconF;
    self.nameLabel.frame = self.statusFrame.nameF;
    self.contentLabel.frame = self.statusFrame.textF;
    if (self.statusFrame.status.vip) { //是会员
        self.vipView.frame = self.statusFrame.vipF;
    }
    if (self.statusFrame.status.picture) { //有图片
        self.pictureView.frame = self.statusFrame.pictureF;
    }
    
    
}






@end
