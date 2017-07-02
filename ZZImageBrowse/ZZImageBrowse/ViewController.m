//
//  ViewController.m
//  ZZImageBrowse
//
//  Created by 赵振磊 on 2017/6/18.
//  Copyright © 2017年 赵振磊. All rights reserved.
//

#import "ViewController.h"
#import "ZZImageBrowseView.h"
@interface ViewController ()

@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = CGRectMake(0, 100, self.view.frame.size.width, 300);
    ZZImageBrowseView *browse = [[ZZImageBrowseView alloc] initWithFrame:frame];
    browse.pageStyle = kPageSquareStyle;
    browse.showPageControl = YES;
    [self.view addSubview:browse];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSInteger index = 0; index < 8; index++) {
        if (index % 2 == 0) {
            [array addObject:@"http://tvax4.sinaimg.cn/crop.0.0.996.996.1024/005ZwE4Aly8fg00n1bpdoj30ro0roac4.jpg"];
        }else {
            [array addObject:@"http://www.nvsay.com/uploads/allimg/160822/168-160R211511R95.jpg"];
        }
    }
    
    [browse browseViewSetUrlArray:array];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
