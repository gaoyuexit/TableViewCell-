//
//  GYStatusFrame.m
//  TableViewDemo
//
//  Created by 郜宇 on 15/10/31.
//  Copyright © 2015年 郜宇. All rights reserved.
//

#import "GYStatusFrame.h"
#import "GYStatus.h"

#define GYMargin 10;//间距
#define IconWH 30   //头像宽高
#define VipWH 14  //vip宽高
#define PicWH 100
@implementation GYStatusFrame
- (void)setStatus:(GYStatus *)status
{
    _status = status;
    // cell的宽度
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    
    //头像
    CGFloat iconX = GYMargin;
    CGFloat iconY = GYMargin;
    CGFloat iconW = IconWH;
    CGFloat iconH = IconWH;
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    //昵称
    CGFloat nameX = CGRectGetMaxX(_iconF) + GYMargin;
    CGSize nameSize = [self sizeWithText:_status.name font:NameFont maxW:MAXFLOAT];
    CGFloat nameY = iconY + (iconH - nameSize.height)/2;
    _nameF = (CGRect){{nameX,nameY},nameSize};
    //vip图标
    CGFloat vipX = CGRectGetMaxX(_nameF) + GYMargin;
    CGFloat vipY = nameY;
    CGFloat vipW = VipWH;
    CGFloat vipH = VipWH;
    _vipF = CGRectMake(vipX, vipY, vipW, vipH);
    //内容
    CGFloat textX = iconX;
    CGFloat textY = MAX(CGRectGetMaxY(_iconF), CGRectGetMaxY(_nameF)) + GYMargin;
    CGSize textSize = [self sizeWithText:_status.text font:TextFont maxW:(cellW - 2 * textX)];
    _textF = (CGRect){{textX,textY},textSize};
    //图片
    if (_status.picture) { //如果存在图片
        CGFloat picX = textX;
        CGFloat picY = CGRectGetMaxY(_textF) + GYMargin;
        CGFloat picW = PicWH;
        CGFloat picH = PicWH;
        _pictureF = CGRectMake(picX, picY, picW, picH);
        _cellHeight = CGRectGetMaxY(_pictureF) + GYMargin;
    }else{
        _cellHeight = CGRectGetMaxY(_textF) + GYMargin;
    }
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont*)font maxW:(CGFloat)maxW
{
    CGSize size = [text boundingRectWithSize:CGSizeMake(maxW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return size;
}
                       
                       
                       
@end
