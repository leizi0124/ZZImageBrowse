//
//  ZZImageBrowseView.h
//  ZZImageBrowse
//
//  Created by 赵振磊 on 2017/6/18.
//  Copyright © 2017年 赵振磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZImageBrowsePage.h"

typedef NS_OPTIONS(NSInteger, kBrowseStyle) {
    kBrowseDefaultStyle = 0,
};
@interface ZZImageBrowseView : UIView
/** 显示样式 */
@property (nonatomic ,assign) kBrowseStyle browseStyle;
/** 初始化 并赋值 */
- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)imageArray;
/** 只初始化 */
- (instancetype)initWithFrame:(CGRect)frame;
/** 更新数据并刷新 */
- (void)browseViewSetUrlArray:(NSArray *)urlArray;
/**
 更新当前页
 @param index 当前页对应下标
 */
- (void)selectPageIndex:(NSInteger)index;

#pragma mark - pagecontrol相关
/**
 是否显示pagecontrl
 */
@property (nonatomic, assign) BOOL showPageControl;
/**
 分页显示样式
 */
@property (nonatomic, assign) kPageStyle pageStyle;
@end
