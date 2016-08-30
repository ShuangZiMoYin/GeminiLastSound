//
//  RightViewController.m
//  GeminiLastSound
//
//  Created by LiuXiaowen on 16/8/17.
//  Copyright © 2016年 LiuXiaowen. All rights reserved.
//

#import "RightViewController.h"

#import "PlusButtonsView.h"

#import "TileMenuViewController.h"

#import "SphereTagCloudViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    PlusButtonsView *plusButtonsView = [PlusButtonsView plusButtonsView:^(NSInteger index) {
        if (index == 1) {
            TileMenuViewController *tileMenuVc = [[TileMenuViewController alloc]init];
            [self presentViewController:tileMenuVc animated:YES completion:nil];
        }else if (index == 2) {
            SphereTagCloudViewController *sphereTagCloudVc = [[SphereTagCloudViewController alloc]init];
            [self presentViewController:sphereTagCloudVc animated:YES completion:nil];
        }
    }];
    
    plusButtonsView.frame = CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height);
    
    [self.view addSubview:plusButtonsView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
