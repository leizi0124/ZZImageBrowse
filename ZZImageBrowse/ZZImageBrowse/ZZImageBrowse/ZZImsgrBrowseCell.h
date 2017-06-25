//
//  ZZImsgrBrowseCell.h
//  ZZImageBrowse
//
//  Created by 赵振磊 on 2017/6/25.
//  Copyright © 2017年 赵振磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface ZZImsgrBrowseCell : UICollectionViewCell
/**
 更新
 @param urlString url地址
 */
- (void)setImageWith:(NSString *)urlString;
@end
