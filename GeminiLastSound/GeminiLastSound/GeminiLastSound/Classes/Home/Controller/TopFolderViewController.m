//
//  TopFolderViewController.m
//  GeminiLastSound
//
//  Created by LiuXiaowen on 16/8/18.
//  Copyright © 2016年 LiuXiaowen. All rights reserved.
//

// 位置问题

#import "TopFolderViewController.h"

#import "FireView.h"

#import "StarView.h"

#import "HeartView.h"

@interface TopFolderViewController ()


@end

@implementation TopFolderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 高度固定？？？
//    FireView *fireView = [[FireView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
//    [self.view addSubview:fireView];

//    StarView *starView = [[StarView alloc]initWithFrame:self.view.frame];
//    [self.view addSubview:starView];
    
    
    HeartView *heartView = [[HeartView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:heartView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
