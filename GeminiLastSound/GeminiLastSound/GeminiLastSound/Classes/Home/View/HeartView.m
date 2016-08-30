//
//  HeartView.m
//  GeminiLastSound
//
//  Created by LiuXiaowen on 16/8/18.
//  Copyright © 2016年 LiuXiaowen. All rights reserved.
//

#import "HeartView.h"

@interface HeartView ()
@property (strong, nonatomic) CAEmitterLayer	*heartsEmitter;
@end

@implementation HeartView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createHeart];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tap:(UITapGestureRecognizer *)tap{
    // Fires up some hearts to rain on the view
    CABasicAnimation *heartsBurst = [CABasicAnimation animationWithKeyPath:@"emitterCells.heart.birthRate"];
    heartsBurst.fromValue		= [NSNumber numberWithFloat:150.0];
    heartsBurst.toValue			= [NSNumber numberWithFloat:  0.0];
    heartsBurst.duration		= 5.0;
    heartsBurst.timingFunction	= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [self.heartsEmitter addAnimation:heartsBurst forKey:@"heartsBurst"];
}

- (void)createHeart{
    // Configure the particle emitter
    self.heartsEmitter = [CAEmitterLayer layer];
    self.heartsEmitter.emitterPosition = self.center;
    self.heartsEmitter.emitterSize = CGSizeMake(50, 20);
    
    // Spawn points for the hearts are within the area defined by the button frame
    self.heartsEmitter.emitterMode = kCAEmitterLayerVolume;
    self.heartsEmitter.emitterShape = kCAEmitterLayerRectangle;
    self.heartsEmitter.renderMode = kCAEmitterLayerAdditive;
    
    // Configure the emitter cell
    CAEmitterCell *heart = [CAEmitterCell emitterCell];
    heart.name = @"heart";
    
    heart.emissionLongitude = M_PI/2.0; // up
    heart.emissionRange = 0.55 * M_PI;  // in a wide spread
    heart.birthRate		= 0.0;			// emitter is deactivated for now
    heart.lifetime		= 10.0;			// hearts vanish after 10 seconds
    
    heart.velocity		= -120;			// particles get fired up fast
    heart.velocityRange = 60;			// with some variation
    heart.yAcceleration = 20;			// but fall eventually
    
    heart.contents		= (id) [[UIImage imageNamed:@"DazHeart"] CGImage];
    heart.color			= [[UIColor colorWithRed:0.5 green:0.0 blue:0.5 alpha:0.5] CGColor];
    heart.redRange		= 0.3;			// some variation in the color
    heart.blueRange		= 0.3;
    heart.alphaSpeed	= -0.5 / heart.lifetime;  // fade over the lifetime
    
    heart.scale			= 0.15;			// let them start small
    heart.scaleSpeed	= 0.5;			// but then 'explode' in size
    heart.spinRange		= 2.0 * M_PI;	// and send them spinning from -180 to +180 deg/s
    
    // Add everything to our backing layer
    self.heartsEmitter.emitterCells = [NSArray arrayWithObject:heart];
    [self.layer addSublayer:self.heartsEmitter];
}

- (void)dealloc{
    [self.heartsEmitter removeFromSuperlayer];
    self.heartsEmitter = nil;
}

@end
