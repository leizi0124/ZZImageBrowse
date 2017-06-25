//
//  ZZImageBrowseView.h
//  ZZImageBrowse
//
//  Created by 赵振磊 on 2017/6/18.
//  Copyright © 2017年 赵振磊. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_OPTIONS(NSInteger, kBrowseStyle) {
    kBrowseDefaultStyle = 0,
};
@interface ZZImageBrowseView : UIView
/** 初始化 并赋值 */
- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray;
/** 只初始化 */
- (instancetype)initWithFrame:(CGRect)frame;
/** 更新数据并刷新 */
- (void)browseViewSetUrlArray:(NSArray *)urlArray;

@property (nonatomic ,assign) kBrowseStyle style;
@end
