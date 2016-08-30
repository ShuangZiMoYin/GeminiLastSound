//
//  CircularMenuViewController.m
//  GeminiLastSound
//
//  Created by LiuXiaowen on 16/8/30.
//  Copyright © 2016年 LiuXiaowen. All rights reserved.
//

#import "CircularMenuViewController.h"

#import "ADCircularMenu.h"

@interface CircularMenuViewController ()<ADCircularMenuDelegate>
{
    ADCircularMenu    *_circularMenuVC;
}

@end

@implementation CircularMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor darkGrayColor];
    
    UIButton *btnMenu = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 40, 40)];
    [self.view addSubview:btnMenu];
    [btnMenu setImage:[UIImage imageNamed:@"btnMenuCorner"] forState:UIControlStateNormal];
    [btnMenu addTarget:self action:@selector(btnMenu:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)btnMenu:(UIButton *)sender
{
    _circularMenuVC = nil;
    
    //use 3 or 7 or 12 for symmetric look (current implementation supports max 12 buttons)
    NSArray *arrImageName = [[NSArray alloc] initWithObjects:
                             @"btnMenu",
                             @"btnMenu",
                             @"btnMenu",
                             @"btnMenu",
                             @"btnMenu",
                             @"btnMenu",
                             @"btnMenu",
                             @"btnMenu",
                             @"btnMenu",
                             @"btnMenu",
                             @"btnMenu",
                             @"btnMenu",
                             nil];
    
    _circularMenuVC = [[ADCircularMenu alloc] initWithMenuButtonImageNameArray:arrImageName andCornerButtonImageName:@"btnMenuCorner" andShouldAddStatusBarMargin:YES];
    _circularMenuVC.delegateCircularMenu = self;
    [_circularMenuVC showInViewController:self];
    
}

- (void)ADCircularMenuClickedButtonAtIndex:(int) buttonIndex
{
    NSLog(@"Circular Mneu : Clicked button at index : %d",buttonIndex);
}

@end
