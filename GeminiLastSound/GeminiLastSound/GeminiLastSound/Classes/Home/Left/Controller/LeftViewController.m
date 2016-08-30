//
//  LeftViewController.m
//  GeminiLastSound
//
//  Created by LiuXiaowen on 16/8/17.
//  Copyright © 2016年 LiuXiaowen. All rights reserved.
//

#import "LeftViewController.h"

#import "RNRippleTableView.h"

#import "RippleView.h"

#import "WingViewController.h"

#import "CircularMenuViewController.h"

#import "ParallaxIntensityViewController.h"

#import "SnowOverlayViewController.h"

#import "ColorPickerViewController.h"

@interface LeftViewController () <RNRippleTableViewDataSource, RNRippleTableViewDelegate>

@property (weak, nonatomic) RNRippleTableView *rippleView;

@property (strong, nonatomic) NSArray *iconNames;

@property (strong, nonatomic) NSArray *titles;

@end

@implementation LeftViewController


- (NSArray *)iconNames{
    if (!_iconNames) {
        _iconNames = @[@"IconHome",@"IconCalendar",@"IconProfile",@"IconSettings",@"IconEmpty"];
    }
    return _iconNames;
}

- (NSArray *)titles{
    if (!_titles) {
        _titles = @[@"首页",@"日历",@"个人",@"设置",@"退出"];
    }
    return _titles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RNRippleTableView *rippleView = [[RNRippleTableView alloc]initWithFrame:CGRectMake(30, 100, [UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height)];
    rippleView.ripplesOnShake = YES;
    
    [rippleView registerContentViewClass:[RippleView class]];
    rippleView.rippleDelegate = self;
    rippleView.dataSource = self;
    
    self.rippleView = rippleView;
    [self.view addSubview:rippleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Tableview datasource

- (NSInteger)numberOfItemsInTableView:(RNRippleTableView *)tableView{
    return 5;
}

- (UIView *)viewForTableView:(RNRippleTableView *)tableView atIndex:(NSInteger)index withReuseView:(RippleView *)reuseView{
    
    reuseView.title = self.titles[index];
    reuseView.iconName = self.iconNames[index];
    
    return reuseView;
    
}

#pragma mark - Tableview delegate
- (CGFloat)heightForViewInTableView:(RNRippleTableView *)tableView atIndex:(NSInteger)index{
    return 70.0;
}

- (void)tableView:(RNRippleTableView *)tableView didSelectView:(UIView *)view atIndex:(NSInteger)index{

    if (index == 0) {
        WingViewController *wingVc = [[WingViewController alloc]init];
        
        [self presentViewController:wingVc animated:YES completion:nil];
    }else if (index == 1) {
        
        CircularMenuViewController *circularMenuVc = [[CircularMenuViewController alloc]init];
        
        [self presentViewController:circularMenuVc animated:YES completion:nil];
    }else if (index == 2) {
        
        ParallaxIntensityViewController *parallaxIntensityVc = [[ParallaxIntensityViewController alloc]init];
        
        [self presentViewController:parallaxIntensityVc animated:YES completion:nil];
    }else if (index == 3) {
        
        SnowOverlayViewController *snowOverlayVc = [[SnowOverlayViewController alloc]init];
        
        [self presentViewController:snowOverlayVc animated:YES completion:nil];
    }else if (index == 4) {
        
        ColorPickerViewController *colorPickerVc = [[ColorPickerViewController alloc]init];
        
        [self presentViewController:colorPickerVc animated:YES completion:nil];
    }
    
}

@end