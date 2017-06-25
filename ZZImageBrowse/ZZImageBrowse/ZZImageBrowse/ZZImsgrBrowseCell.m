//
//  ZZImsgrBrowseCell.m
//  ZZImageBrowse
//
//  Created by 赵振磊 on 2017/6/25.
//  Copyright © 2017年 赵振磊. All rights reserved.
//

#import "ZZImsgrBrowseCell.h"
@interface ZZImsgrBrowseCell ()
{
    UIImageView *defautImage;       //默认图
    UIImageView *showImage;         //展示图
}
@end
@implementation ZZImsgrBrowseCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self viewsInit];
    }
    return self;
}
- (void)viewsInit {
    
    UIImage *defImage = [UIImage imageNamed:@"defaut_img"];
    CGFloat defautX = (self.contentView.bounds.size.width - defImage.size.width / 2.0) / 2.0;
    CGFloat defautY = (self.contentView.bounds.size.height - defImage.size.height / 2.0) / 2.0;
    CGRect frame = CGRectMake(defautX, defautY, defImage.size.width / 2.0, defImage.size.height / 2.0);
    defautImage = [[UIImageView alloc] initWithFrame:frame];
    defautImage.image = defImage;
    [self.contentView addSubview:defautImage];
    
    showImage = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    [self.contentView addSubview:showImage];
}
- (void)setImageWith:(NSString *)urlString {
    defautImage.alpha = 1;
    showImage.alpha = 0;
    NSURL *url = [NSURL URLWithString:urlString];
    [showImage sd_setImageWithURL:url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        [UIView animateWithDuration:1.0 animations:^{
            showImage.alpha = 1;
            defautImage.alpha = 0;
        }];
    }];
}
@end
