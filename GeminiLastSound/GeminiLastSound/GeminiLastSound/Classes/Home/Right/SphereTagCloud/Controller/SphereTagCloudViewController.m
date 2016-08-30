//
//  SphereTagCloudViewController.m
//  GeminiLastSound
//
//  Created by LiuXiaowen on 16/8/18.
//  Copyright © 2016年 LiuXiaowen. All rights reserved.
//

#import "SphereTagCloudViewController.h"

#import "DBSphereView.h"

@interface SphereTagCloudViewController ()

@property (nonatomic, weak) DBSphereView *sphereView;

@end

@implementation SphereTagCloudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DBSphereView *sphereView = [[DBSphereView alloc] initWithFrame:CGRectMake(0, 100, 320, 320)];
    self.sphereView = sphereView;
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger i = 0; i < 50; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        btn.tag = i;
        
        [btn setTitle:[NSString stringWithFormat:@"P%ld", i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:24.];
        btn.frame = CGRectMake(0, 0, 60, 20);
        [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:btn];
        [self.sphereView addSubview:btn];
    }
    [self.sphereView setCloudTags:array];
    self.sphereView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.sphereView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)buttonPressed:(UIButton *)btn
{
    [self.sphereView timerStop];
    
    NSLog(@"%ld",btn.tag);
    
    [UIView animateWithDuration:0.3 animations:^{
        btn.transform = CGAffineTransformMakeScale(2., 2.);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            btn.transform = CGAffineTransformMakeScale(1., 1.);
        } completion:^(BOOL finished) {
            [self.sphereView timerStart];
        }];
    }];
}@end
