//
//  PlusButtonsView.h
//  GeminiLastSound
//
//  Created by LiuXiaowen on 16/8/17.
//  Copyright © 2016年 LiuXiaowen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedIndex)(NSInteger index);

@interface PlusButtonsView : UIView

+ (instancetype)plusButtonsView:(SelectedIndex)selectedIndex;

@end
