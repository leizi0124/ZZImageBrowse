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
    [self.view addSubview:browse];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
