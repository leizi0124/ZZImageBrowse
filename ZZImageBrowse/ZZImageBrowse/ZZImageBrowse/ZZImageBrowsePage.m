//
//  ZZImageBrowsePage.m
//  ZZImageBrowse
//
//  Created by 赵振磊 on 2017/6/25.
//  Copyright © 2017年 赵振磊. All rights reserved.
//

#import "ZZImageBrowsePage.h"
@interface ZZImageBrowsePage ()
{
    NSInteger oldPage;          //记录当前页改变前的值
}
@end
@implementation ZZImageBrowsePage
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _currentPage = 0;
        oldPage = _currentPage;
        _spacing = 15;
        _style = kPageDefautStyle;
        _location = kPageShowCenter;
        _pageTintColor = [UIColor grayColor];
        _currentPageTintColor = [UIColor whiteColor];
    }
    return self;
}
#pragma mark - 初始化
- (void)willMoveToSuperview:(UIView *)newSuperview {
    [self viewsInit];
}
#pragma mark - 初始化
- (void)viewsInit {
    CGFloat pageX = 0;
    switch (_location) {
        case kPageShowCenter:{
            pageX = (self.frame.size.width - _count * self.frame.size.height - (_count - 1) * _spacing) / 2.0;
        }
            break;
        case kPageShowRight:{
            pageX = self.frame.size.width - _count * (self.frame.size.height + _spacing);
        }
            break;
        case kPageShowLeft:{
            pageX = _spacing;
        }
            break;
        default:
            break;
    }
    
    CGRect frame = CGRectMake(pageX, 0, self.frame.size.height, self.frame.size.height);
    
    if (_count > 0) {
        for (NSInteger index = 0; index < _count; index++) {
            UIImageView *tinImage = [[UIImageView alloc] initWithFrame:frame];
            tinImage.tag = index + 100;
            [self pageImage:tinImage style:_style];
            if (index == _currentPage) {
                tinImage.backgroundColor = _currentPageTintColor;
            }else {
                tinImage.backgroundColor = _pageTintColor;
            }
            [self addSubview:tinImage];
            frame = CGRectOffset(frame, frame.size.width + _spacing, 0);
        }
    }
}
#pragma mark - 设置样式
- (void)pageImage:(UIImageView *)imageView style:(kPageStyle)style {
    
    switch (style) {
        case kPageDefautStyle:{
            imageView.layer.masksToBounds = YES;
            imageView.layer.cornerRadius = imageView.frame.size.width / 2.0;
        }
            break;
            
        default:
            break;
    }
}
#pragma mark - 重绘
- (void)redraw {
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    [self viewsInit];
}
#pragma mark - 绘制当前页
- (void)selectCurrentPage {
    UIImageView *oldPageImage = [self viewWithTag:oldPage + 100];
    oldPageImage.backgroundColor = _pageTintColor;
    UIImageView *currentPageImage = [self viewWithTag:_currentPage + 100];
    currentPageImage.backgroundColor = _currentPageTintColor;
}
- (void)setCurrentPage:(NSInteger)currentPage {
    if (currentPage == _currentPage) {
        return;
    }
    NSLog(@"ZZImageBrowsePage currentPage == %zd",currentPage);
    if (currentPage >= 0 && currentPage < _count) {
        oldPage = _currentPage;
        _currentPage = currentPage;
        [self selectCurrentPage];
    }else {
        NSLog(@"ZZImageBrowsePage count error");
    }
}
@end
