//
//  BottomFolderViewController.m
//  GeminiLastSound
//
//  Created by LiuXiaowen on 16/8/18.
//  Copyright © 2016年 LiuXiaowen. All rights reserved.
//

#import "BottomFolderViewController.h"

#import "SnowView.h"

#import "TouchView.h"

@interface BottomFolderViewController ()

@end

@implementation BottomFolderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    
//    SnowView *snowView = [[SnowView alloc]initWithFrame:self.view.frame];
//    [self.view addSubview:snowView];
    
    // 位置问题
    TouchView *touchView = [[TouchView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:touchView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
