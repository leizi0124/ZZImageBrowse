//
//  ZZImageBrowsePage.h
//  ZZImageBrowse
//
//  Created by 赵振磊 on 2017/6/25.
//  Copyright © 2017年 赵振磊. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_OPTIONS(NSInteger, kPageStyle) {
    kPageDefautStyle = 0,   //默认圆形
    kPageSquareStyle,       //方形
};
typedef NS_OPTIONS(NSInteger, kPageShowLocation) {
    kPageShowLeft = 0,  //居左
    kPageShowCenter,    //居中 默认
    kPageShowRight,     //居右
};
@interface ZZImageBrowsePage : UIView
/** 页数 */
@property (nonatomic, assign) NSInteger count;
/** 当前页 默认0 */
@property (nonatomic, assign) NSInteger currentPage;
/** 间距 */
@property (nonatomic, assign) CGFloat spacing;
/** 样式 */
@property (nonatomic, assign) kPageStyle style;
/** 显示位置 */
@property (nonatomic, assign) kPageShowLocation location;
/** 显示颜色 */
@property (nonatomic, strong) UIColor *pageTintColor;
/** 选中颜色 */
@property (nonatomic, strong) UIColor *currentPageTintColor;
/** 是否显示页数 */
@property (nonatomic, assign) BOOL showNum;
/** 选中字颜色颜色 */
@property (nonatomic, strong) UIColor *currentNumTintColor;
/**
 数据发生变化重绘
 */
- (void)redraw;
@end
