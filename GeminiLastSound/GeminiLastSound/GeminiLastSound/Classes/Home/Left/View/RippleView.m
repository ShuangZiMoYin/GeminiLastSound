//
//  RippleView.m
//  GeminiLastSound
//
//  Created by LiuXiaowen on 16/8/17.
//  Copyright © 2016年 LiuXiaowen. All rights reserved.
//

#import "RippleView.h"

@interface RippleView ()

@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) CALayer *dividerLayer;

@end

@implementation RippleView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self _init];
    }
    return self;
}

- (void)_init {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:22.0];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel = titleLabel;
    
    [self addSubview:titleLabel];
    
    UIImageView *iconImageView = [[UIImageView alloc]init];
    self.iconImageView = iconImageView;
    [self addSubview:_iconImageView];
    
    CALayer *dividerLayer = [CALayer layer];
    dividerLayer.backgroundColor = [UIColor whiteColor].CGColor;
    self.dividerLayer = dividerLayer;
    [self.layer addSublayer:dividerLayer];
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
}

- (void)setIconName:(NSString *)iconName{
    _iconName = iconName;
    self.iconImageView.image = [UIImage imageNamed:iconName];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat iconH = self.bounds.size.height / 4 * 3;
    self.iconImageView.frame = CGRectMake(0, 0, iconH, iconH);
    CGPoint center = self.iconImageView.center;
    center.y += self.bounds.size.height / 8;
    self.iconImageView.center = center;
    
    self.titleLabel.frame = CGRectMake(iconH, 0, self.bounds.size.width/3 * 2, self.bounds.size.height);
    
    CGFloat dividerWidth = self.bounds.size.width / 2;
    self.dividerLayer.frame = CGRectMake(iconH, self.bounds.size.height, dividerWidth, 1);
}

@end
