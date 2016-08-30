//
//  SnowOverlayViewController.m
//  GeminiLastSound
//
//  Created by LiuXiaowen on 16/8/30.
//  Copyright © 2016年 LiuXiaowen. All rights reserved.
//

#import "SnowOverlayViewController.h"
#import "VENSnowOverlayView.h"
@interface SnowOverlayViewController ()

@end

@implementation SnowOverlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    VENSnowOverlayView *snowOverlay = [[VENSnowOverlayView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:snowOverlay];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 延迟处理   present  控制器需要时间  与动画开启时间 冲突？？
        [snowOverlay beginSnowAnimation];
    });
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
