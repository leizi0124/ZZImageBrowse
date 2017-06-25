//
//  ZZImageBrowseView.m
//  ZZImageBrowse
//
//  Created by 赵振磊 on 2017/6/18.
//  Copyright © 2017年 赵振磊. All rights reserved.
//

#import "ZZImageBrowseView.h"
#import "ZZImsgrBrowseCell.h"
#define CELLID @"BROWSECELL"
#define DATACOUNTTIMES 100      //图片数目的倍数
@interface ZZImageBrowseView ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *browseView;
    UICollectionViewFlowLayout *browseLayout;
    NSArray *dataArray;
}
@end
@implementation ZZImageBrowseView
- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray {
    if (self = [super initWithFrame:frame]) {
        [self browseViewInit];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self browseViewInit];
    }
    return self;
}
- (void)browseViewInit {
    browseLayout = [[UICollectionViewFlowLayout alloc] init];
    [self selectStyle:_style];
    browseView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:browseLayout];
    browseView.delegate = self;
    browseView.dataSource = self;
    browseView.pagingEnabled = YES;
    browseView.showsVerticalScrollIndicator = NO;
    browseView.showsHorizontalScrollIndicator = NO;
    [browseView registerClass:[ZZImsgrBrowseCell class] forCellWithReuseIdentifier:CELLID];
    [self addSubview:browseView];
    
    if (dataArray.count) {
        browseView.contentOffset = CGPointMake(dataArray.count * DATACOUNTTIMES / 2 * self.bounds.size.width, 0);
    }
}
- (void)selectStyle:(NSInteger)style {
    switch (style) {
        case kBrowseDefaultStyle:{
            browseLayout.itemSize = self.bounds.size;
            browseLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            browseLayout.minimumLineSpacing = 0;
            browseLayout.minimumInteritemSpacing = 0;
        }
            break;
//        case kBrowseDefaultStyle:{
//            
//        }
//            break;
//        case kBrowseDefaultStyle:{
//            
//        }
//            break;
//        case kBrowseDefaultStyle:{
//            
//        }
//            break;
        default:
            break;
    }
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return dataArray.count * DATACOUNTTIMES;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZZImsgrBrowseCell *cell = [browseView dequeueReusableCellWithReuseIdentifier:CELLID forIndexPath:indexPath];
    NSInteger index = indexPath.row % dataArray.count;
    NSString *urlString = [dataArray objectAtIndex:index];
    [cell setImageWith:urlString];
    return cell;
}
#pragma mark - 赋值并刷新
- (void)browseViewSetUrlArray:(NSArray *)urlArray {
    dataArray = urlArray;
    [browseView reloadData];
    browseView.contentOffset = CGPointMake(dataArray.count * 50 * self.bounds.size.width, 0);
}
- (void)setStyle:(kBrowseStyle)style {
    _style = style;
}
@end
