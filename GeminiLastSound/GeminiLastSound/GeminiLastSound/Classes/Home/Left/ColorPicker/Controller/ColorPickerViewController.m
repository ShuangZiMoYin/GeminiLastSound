//
//  ColorPickerViewController.m
//  GeminiLastSound
//
//  Created by LiuXiaowen on 16/8/30.
//  Copyright © 2016年 LiuXiaowen. All rights reserved.
//

#import "ColorPickerViewController.h"

#import "HRColorPickerView.h"
#import "HRColorMapView.h"
#import "HRBrightnessSlider.h"

@interface ColorPickerViewController ()

@end

@implementation ColorPickerViewController
{
    UIColor *_color;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HRColorPickerView *colorPickerView = [[HRColorPickerView alloc]initWithFrame:CGRectMake(10, 20, self.view.bounds.size.width - 10, self.view.bounds.size.height - 30)];
    
    colorPickerView.colorMapView.saturationUpperLimit = @1;
    colorPickerView.brightnessSlider.brightnessLowerLimit = @0;
    
    [self.view addSubview:colorPickerView];
    
    [colorPickerView addTarget:self
                             action:@selector(colorDidChange:)
                   forControlEvents:UIControlEventValueChanged];
}
- (void)colorDidChange:(HRColorPickerView *)colorPickerView {
    _color = colorPickerView.color;
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
