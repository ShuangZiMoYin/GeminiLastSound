//
//  TileMenuViewController.m
//  GeminiLastSound
//
//  Created by LiuXiaowen on 16/8/18.
//  Copyright © 2016年 LiuXiaowen. All rights reserved.
//

#import "TileMenuViewController.h"

#import "MGTileMenuController.h"


#import "CatZanButton.h"


#import "WZFlashButton.h"


@interface TileMenuViewController ()  <MGTileMenuDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) MGTileMenuController *tileController;
@end

@implementation TileMenuViewController

#pragma mark - TileMenu delegate


- (NSInteger)numberOfTilesInMenu:(MGTileMenuController *)tileMenu
{
    return 9;
}


- (UIImage *)imageForTile:(NSInteger)tileNumber inMenu:(MGTileMenuController *)tileMenu
{
    NSArray *images = [NSArray arrayWithObjects:
                       @"twitter",
                       @"key",
                       @"speech",
                       @"magnifier",
                       @"scissors",
                       @"actions",
                       @"Text",
                       @"heart",
                       @"gear",
                       nil];
    if (tileNumber >= 0 && tileNumber < images.count) {
        return [UIImage imageNamed:[images objectAtIndex:tileNumber]];
    }
    
    return [UIImage imageNamed:@"Text"];
}


- (NSString *)labelForTile:(NSInteger)tileNumber inMenu:(MGTileMenuController *)tileMenu
{
    NSArray *labels = [NSArray arrayWithObjects:
                       @"Twitter",
                       @"Key",
                       @"Speech balloon",
                       @"Magnifying glass",
                       @"Scissors",
                       @"Actions",
                       @"Text",
                       @"Heart",
                       @"Settings",
                       nil];
    if (tileNumber >= 0 && tileNumber < labels.count) {
        return [labels objectAtIndex:tileNumber];
    }
    
    return @"Tile";
}


- (NSString *)descriptionForTile:(NSInteger)tileNumber inMenu:(MGTileMenuController *)tileMenu
{
    NSArray *hints = [NSArray arrayWithObjects:
                      @"Sends a tweet",
                      @"Unlock something",
                      @"Sends a message",
                      @"Zooms in",
                      @"Cuts something",
                      @"Shows export options",
                      @"Adds some text",
                      @"Marks something as a favourite",
                      @"Shows some settings",
                      nil];
    if (tileNumber >= 0 && tileNumber < hints.count) {
        return [hints objectAtIndex:tileNumber];
    }
    
    return @"It's a tile button!";
}


- (UIImage *)backgroundImageForTile:(NSInteger)tileNumber inMenu:(MGTileMenuController *)tileMenu
{
    if (tileNumber == 1) {
        return [UIImage imageNamed:@"purple_gradient"];
    } else if (tileNumber == 4) {
        return [UIImage imageNamed:@"orange_gradient"];
    } else if (tileNumber == 7) {
        return [UIImage imageNamed:@"red_gradient"];
    } else if (tileNumber == 5) {
        return [UIImage imageNamed:@"yellow_gradient"];
    } else if (tileNumber == 8) {
        return [UIImage imageNamed:@"green_gradient"];
    } else if (tileNumber == -1) {
        return [UIImage imageNamed:@"grey_gradient"];
    }
    
    return [UIImage imageNamed:@"blue_gradient"];
}


- (BOOL)isTileEnabled:(NSInteger)tileNumber inMenu:(MGTileMenuController *)tileMenu
{
    if (tileNumber == 2 || tileNumber == 6) {
        return NO;
    }
    
    return YES;
}


- (void)tileMenu:(MGTileMenuController *)tileMenu didActivateTile:(NSInteger)tileNumber
{
    NSLog(@"Tile %ld activated (%@)", (long)tileNumber, [self labelForTile:tileNumber inMenu:self.tileController]);
}


- (void)tileMenuDidDismiss:(MGTileMenuController *)tileMenu
{
    self.tileController = nil;
}


#pragma mark - Gesture handling


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // Ensure that only touches on our own view are sent to the gesture recognisers.
    if (touch.view == self.view) {
        return YES;
    }
    
    return NO;
}


- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
    // Find out where the gesture took place.
    CGPoint loc = [gestureRecognizer locationInView:self.view];
    if ([gestureRecognizer isMemberOfClass:[UITapGestureRecognizer class]] && ((UITapGestureRecognizer *)gestureRecognizer).numberOfTapsRequired == 2) {
        // This was a double-tap.
        // If there isn't already a visible TileMenu, we should create one if necessary, and show it.
        if (!self.tileController || self.tileController.isVisible == NO) {
            if (!self.tileController) {
                // Create a self.tileController.
                self.tileController = [[MGTileMenuController alloc] initWithDelegate:self];
                self.tileController.dismissAfterTileActivated = NO; // to make it easier to play with in the demo app.
            }
            // Display the TileMenu.
            [self.tileController displayMenuCenteredOnPoint:loc inView:self.view];
        }
        
    } else {
        // This wasn't a double-tap, so we should hide the TileMenu if it exists and is visible.
        if (self.tileController && self.tileController.isVisible == YES) {
            // Only dismiss if the tap wasn't inside the tile menu itself.
            if (!CGRectContainsPoint(self.tileController.view.frame, loc)) {
                [self.tileController dismissMenu];
            }
        }
    }
}


#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // Set up recognizers.
    UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    doubleTapRecognizer.numberOfTapsRequired = 2;
    doubleTapRecognizer.delegate = self;
    [self.view addGestureRecognizer:doubleTapRecognizer];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    tapRecognizer.delegate = self;
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    //
    CatZanButton *zanBtn=[[CatZanButton alloc] init];
    [zanBtn setCenter:self.view.center];
    [self.view addSubview:zanBtn];
    
    [zanBtn setType:CatZanButtonTypeFirework];
    
    [zanBtn setClickHandler:^(CatZanButton *zanButton) {
        if (zanButton.isZan) {
            NSLog(@"Zan!");
        }else{
            NSLog(@"Cancel zan!");
        }
    }];
    
    
    //
    // Inner Flash Button with no text
    WZFlashButton *innerFlashButton = [[WZFlashButton alloc] initWithFrame:CGRectMake(100, 200, 200, 60)];
    innerFlashButton.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:62.0f/255.0f blue:80.0f alpha:1.0f];
    innerFlashButton.clickBlock = ^(void) {
        NSLog(@"Click Done");
    };
    [self.view addSubview:innerFlashButton];
    
    // Inner Flash Button with text
    WZFlashButton *innerFlashTextButton = [[WZFlashButton alloc] initWithFrame:CGRectMake(100, 300, 200, 60)];
    innerFlashButton.backgroundColor = [UIColor colorWithRed:153.0f/255.0f green:204.0f/255.0f blue:0 alpha:1.0f];
    innerFlashButton.flashColor = [UIColor orangeColor];
    [innerFlashButton setText:@"Hello World!" withTextColor:nil];
    [self.view addSubview:innerFlashTextButton];
    
    // Outer Round Button
    WZFlashButton *outerRoundFlashButton = [[WZFlashButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    outerRoundFlashButton.buttonType = WZFlashButtonTypeOuter;
    outerRoundFlashButton.layer.cornerRadius = 25;
    outerRoundFlashButton.flashColor = [UIColor colorWithRed:240/255.f green:159/255.f blue:10/255.f alpha:1];
    outerRoundFlashButton.backgroundColor = [UIColor colorWithRed:0 green:152.0f/255.0f blue:203.0f/255.0f alpha:1.0f];
    [self.view addSubview:outerRoundFlashButton];
    
    // Outer Rectangle Button
    WZFlashButton *outerRectangleFlashButton = [[WZFlashButton alloc] initWithFrame:CGRectMake(200, 50, 100, 60)];
    outerRectangleFlashButton.buttonType = WZFlashButtonTypeOuter;
    [outerRectangleFlashButton setText:@"Hello World!" withTextColor:[UIColor whiteColor]];
    outerRectangleFlashButton.flashColor = [UIColor colorWithRed:248.0f/255.f green:175.0f/255.f blue:160.0f/255.f alpha:1];
    outerRectangleFlashButton.backgroundColor = [UIColor colorWithRed:0 green:152.0f/255.0f blue:203.0f/255.0f alpha:1.0f];
    [self.view addSubview:outerRectangleFlashButton];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
