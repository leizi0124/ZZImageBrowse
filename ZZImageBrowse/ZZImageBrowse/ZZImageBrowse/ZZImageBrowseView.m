//
//  ZZImageBrowseView.m
//  ZZImageBrowse
//
//  Created by 赵振磊 on 2017/6/18.
//  Copyright © 2017年 赵振磊. All rights reserved.
//

#import "ZZImageBrowseView.h"
#define CELLID @"BROWSECELL"
@interface ZZImageBrowseView ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *browseView;
    UICollectionViewFlowLayout *browseLayout;
}
@end
@implementation ZZImageBrowseView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self browseViewInit];
    }
    return self;
}
- (void)browseViewInit {
    browseLayout = [[UICollectionViewFlowLayout alloc] init];
    [self selectStyle:0];
    browseView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:browseLayout];
    browseView.delegate = self;
    browseView.dataSource = self;
    browseView.pagingEnabled = YES;
    browseView.showsVerticalScrollIndicator = NO;
    browseView.showsHorizontalScrollIndicator = NO;
    [browseView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CELLID];
    [self addSubview:browseView];
}
- (void)selectStyle:(NSInteger)style {
    browseLayout.itemSize = self.bounds.size;
    browseLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    browseLayout.minimumLineSpacing = 0;
    browseLayout.minimumInteritemSpacing = 0;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [browseView dequeueReusableCellWithReuseIdentifier:CELLID forIndexPath:indexPath];
    UIImageView *showImage = [cell.contentView viewWithTag:100];
    
    if (showImage == nil) {
        showImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, browseLayout.itemSize.width, browseLayout.itemSize.height)];
        [cell.contentView addSubview:showImage];
    }
    
    if (indexPath.row % 2 == 0) {
        showImage.backgroundColor = [UIColor orangeColor];
    }else {
        showImage.backgroundColor = [UIColor redColor];
    }
    
    return cell;
}
@end
