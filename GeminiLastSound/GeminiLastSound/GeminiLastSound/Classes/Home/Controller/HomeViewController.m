//
//  HomeViewController.m
//  GeminiLastSound
//
//  Created by LiuXiaowen on 16/8/17.
//  Copyright © 2016年 LiuXiaowen. All rights reserved.
//

#import "HomeViewController.h"

#import "SMRotaryWheel.h"
#import "SMRotaryProtocol.h"

#import "JWFolders.h"

#import "TopFolderViewController.h"
#import "BottomFolderViewController.h"

@interface HomeViewController () <SMRotaryProtocol>

@property (nonatomic, weak) UIButton *openButton;

@property (nonatomic, strong) TopFolderViewController *topFolderVc;
@property (nonatomic, strong) BottomFolderViewController *bottomFolderVc;

@property (nonatomic, weak) SMRotaryWheel *wheel;

@property (nonatomic, strong) JWFolders *folder;

@end

@implementation HomeViewController

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    bgImageView.image = [UIImage imageNamed:@"Stars"];
    [self.view addSubview:bgImageView];
    
    UIButton *openButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 350, 120, 30)];
    
    [openButton addTarget:self action:@selector(openButton:) forControlEvents:UIControlEventTouchUpInside];

    self.openButton = openButton;
    [self.view addSubview:openButton];
    
    // 固定的宽高
    SMRotaryWheel *wheel = [[SMRotaryWheel alloc] initWithFrame:CGRectMake(0, 0, 200, 200) andDelegate:self withSections:8];
    
    wheel.center = CGPointMake(160, 240);
    
    self.wheel = wheel;
    
    [self.view addSubview:wheel];
    
    self.topFolderVc = [[TopFolderViewController alloc] init];
    self.bottomFolderVc = [[BottomFolderViewController alloc] init];
    // 隐藏open的view超出部分
    self.view.clipsToBounds = YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 代理方法修改？？
- (void) wheelDidChangeValue:(NSString *)newValue {
    
    
    [self.openButton setTitle:newValue forState:UIControlStateNormal];
    
}

- (void)openButton:(UIButton *)sender{
    
    NSLog(@"openButton");
    
    CGPoint openPoint = self.wheel.center;
    
    JWFolders *folder = [JWFolders folder];
    self.folder = folder;
    
//    folder.contentView = self.topFolderVc.view;
//    folder.containerView = self.view;
//    folder.position = openPoint;
//    folder.direction = JWFoldersOpenDirectionUp;
//    folder.shadowsEnabled = YES;
//    folder.darkensBackground = NO;
//    // 下两个配合使用
//    folder.contentBackgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"noise"]];
//    folder.showsNotch = YES;
//    [folder open];

    folder.contentView = self.bottomFolderVc.view;
    folder.containerView = self.view;
    folder.position = openPoint;
    folder.direction = JWFoldersOpenDirectionDown;
    folder.transparentPane = YES;
    [folder open];
}

@end
