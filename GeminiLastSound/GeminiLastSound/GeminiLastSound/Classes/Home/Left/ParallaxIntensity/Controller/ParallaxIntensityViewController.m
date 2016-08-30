//
//  ParallaxIntensityViewController.m
//  GeminiLastSound
//
//  Created by LiuXiaowen on 16/8/30.
//  Copyright © 2016年 LiuXiaowen. All rights reserved.
//

#import "ParallaxIntensityViewController.h"

#import "UIView+MWParallax.h"

@interface ParallaxIntensityViewController ()

@property (weak, nonatomic) UILabel *label;

@end

@implementation ParallaxIntensityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 30, 30)];
    label.text = @"00";
    label.textColor = [UIColor whiteColor];
    label.iOS6ParallaxIntensity = 50;
    self.label = label;
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"Stars"];
    bg.iOS6ParallaxIntensity = -20;
    [self.view addSubview:bg];
    [self.view addSubview:label];
}

- (void)dealloc{
    self.label.iOS6ParallaxIntensity = 0;
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
