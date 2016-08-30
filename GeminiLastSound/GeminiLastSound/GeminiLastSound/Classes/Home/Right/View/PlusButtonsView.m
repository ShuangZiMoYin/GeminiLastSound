//
//  PlusButtonsView.m
//  GeminiLastSound
//
//  Created by LiuXiaowen on 16/8/17.
//  Copyright © 2016年 LiuXiaowen. All rights reserved.
//

#import "PlusButtonsView.h"

#import "LGPlusButtonsView.h"

@implementation PlusButtonsView

+ (instancetype)plusButtonsView:(SelectedIndex)selectedIndex{
    
    LGPlusButtonsView *plusButtonsView = [LGPlusButtonsView plusButtonsViewWithNumberOfButtons:4                     firstButtonIsPlusButton:YES showAfterInit:YES actionHandler:^(LGPlusButtonsView *plusButtonView, NSString *title, NSString *description, NSUInteger index)
                                          {
//                                            NSLog(@"actionHandler | title: %@, description: %@, index: %lu", title, description, (long unsigned)index);
                                              selectedIndex(index);
                                          }];;
    
    plusButtonsView.position = LGPlusButtonsViewPositionRightTop;
    plusButtonsView.plusButtonAnimationType = LGPlusButtonAnimationTypeRotate;
    
    [plusButtonsView setButtonsTitles:@[@"+", @"", @"", @""] forState:UIControlStateNormal];
    [plusButtonsView setDescriptionsTexts:@[@"", @"Take a photo", @"Choose from gallery", @"Send a message"]];
    
    [plusButtonsView setButtonsImages:@[[NSNull new], [UIImage imageNamed:@"Camera"], [UIImage imageNamed:@"Picture"], [UIImage imageNamed:@"Message"]]
                             forState:UIControlStateNormal
                       forOrientation:LGPlusButtonsViewOrientationAll];
    
    [plusButtonsView setButtonsAdjustsImageWhenHighlighted:NO];
    
    [plusButtonsView setButtonsBackgroundColor:[UIColor colorWithRed:0.f green:0.5 blue:1.f alpha:1.f] forState:UIControlStateNormal];
    [plusButtonsView setButtonsBackgroundColor:[UIColor colorWithRed:0.2 green:0.6 blue:1.f alpha:1.f] forState:UIControlStateHighlighted];
    [plusButtonsView setButtonsBackgroundColor:[UIColor colorWithRed:0.2 green:0.6 blue:1.f alpha:1.f] forState:UIControlStateHighlighted|UIControlStateSelected];
    
    [plusButtonsView setButtonsSize:CGSizeMake(44.f, 44.f) forOrientation:LGPlusButtonsViewOrientationAll];
    [plusButtonsView setButtonsLayerCornerRadius:44.f/2.f forOrientation:LGPlusButtonsViewOrientationAll];
    [plusButtonsView setButtonsTitleFont:[UIFont boldSystemFontOfSize:24.f] forOrientation:LGPlusButtonsViewOrientationAll];
    
    [plusButtonsView setButtonsLayerShadowColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1.f]];
    [plusButtonsView setButtonsLayerShadowOpacity:0.5];
    [plusButtonsView setButtonsLayerShadowRadius:3.f];
    [plusButtonsView setButtonsLayerShadowOffset:CGSizeMake(0.f, 2.f)];
    
    [plusButtonsView setButtonAtIndex:0 size:CGSizeMake(56.f, 56.f)
                       forOrientation:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? LGPlusButtonsViewOrientationPortrait : LGPlusButtonsViewOrientationAll)];
    [plusButtonsView setButtonAtIndex:0 layerCornerRadius:56.f/2.f
                       forOrientation:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? LGPlusButtonsViewOrientationPortrait : LGPlusButtonsViewOrientationAll)];
    [plusButtonsView setButtonAtIndex:0 titleFont:[UIFont systemFontOfSize:40.f]
                       forOrientation:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? LGPlusButtonsViewOrientationPortrait : LGPlusButtonsViewOrientationAll)];
    [plusButtonsView setButtonAtIndex:0 titleOffset:CGPointMake(0.f, -3.f) forOrientation:LGPlusButtonsViewOrientationAll];
    
    [plusButtonsView setButtonAtIndex:1 backgroundColor:[UIColor colorWithRed:1.f green:0.f blue:0.5 alpha:1.f] forState:UIControlStateNormal];
    [plusButtonsView setButtonAtIndex:1 backgroundColor:[UIColor colorWithRed:1.f green:0.2 blue:0.6 alpha:1.f] forState:UIControlStateHighlighted];
    [plusButtonsView setButtonAtIndex:2 backgroundColor:[UIColor colorWithRed:1.f green:0.5 blue:0.f alpha:1.f] forState:UIControlStateNormal];
    [plusButtonsView setButtonAtIndex:2 backgroundColor:[UIColor colorWithRed:1.f green:0.6 blue:0.2 alpha:1.f] forState:UIControlStateHighlighted];
    [plusButtonsView setButtonAtIndex:3 backgroundColor:[UIColor colorWithRed:0.f green:0.7 blue:0.f alpha:1.f] forState:UIControlStateNormal];
    [plusButtonsView setButtonAtIndex:3 backgroundColor:[UIColor colorWithRed:0.f green:0.8 blue:0.f alpha:1.f] forState:UIControlStateHighlighted];
    
    [plusButtonsView setDescriptionsBackgroundColor:[UIColor whiteColor]];
    [plusButtonsView setDescriptionsTextColor:[UIColor blackColor]];
    [plusButtonsView setDescriptionsLayerShadowColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1.f]];
    [plusButtonsView setDescriptionsLayerShadowOpacity:0.25];
    [plusButtonsView setDescriptionsLayerShadowRadius:1.f];
    [plusButtonsView setDescriptionsLayerShadowOffset:CGSizeMake(0.f, 1.f)];
    [plusButtonsView setDescriptionsLayerCornerRadius:6.f forOrientation:LGPlusButtonsViewOrientationAll];
    [plusButtonsView setDescriptionsContentEdgeInsets:UIEdgeInsetsMake(4.f, 8.f, 4.f, 8.f) forOrientation:LGPlusButtonsViewOrientationAll];
    
    for (NSUInteger i=1; i<=3; i++)
        [plusButtonsView setButtonAtIndex:i offset:CGPointMake(-6.f, 0.f)
                           forOrientation:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? LGPlusButtonsViewOrientationPortrait : LGPlusButtonsViewOrientationAll)];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        [plusButtonsView setButtonAtIndex:0 titleOffset:CGPointMake(0.f, -2.f) forOrientation:LGPlusButtonsViewOrientationLandscape];
        [plusButtonsView setButtonAtIndex:0 titleFont:[UIFont systemFontOfSize:32.f] forOrientation:LGPlusButtonsViewOrientationLandscape];
    }
    
    PlusButtonsView *view = [[PlusButtonsView alloc]init];
    [view addSubview:plusButtonsView];
    
    return view;
}

@end
