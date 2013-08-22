//
//  VMainViewController.m
//  ViewOrientationAnimation
//
//  Created by Wahyu Sumartha  on 8/21/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#import "Global.h"

#import "VMainViewController.h"
#import <QuartzCore/QuartzCore.h>


static CGFloat const kButtonWidth = 150;
static CGFloat const kButtonHeight = 50;

static CGFloat const kLabelWidth = 200;
static CGFloat const kLabelHeight = 30;

@interface VMainViewController () {
    
    UIButton *customButton;
    UILabel *screenSizeInfoLabel;
}

@end

@implementation VMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // add custom button
    customButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButton setFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - kButtonWidth) / 2, ([UIScreen mainScreen].bounds.size.height - kButtonHeight) / 2, kButtonWidth, kButtonHeight)];
    
    [[customButton layer] setBorderWidth:2];
    [[customButton layer] setCornerRadius:8];
    [[customButton layer] setBackgroundColor:[[UIColor orangeColor] CGColor]];
    
    [customButton setTitle:@"Custom Button" forState:UIControlStateNormal];
    
    
    NSLog(@"DEVICE SIZE %f:%f", DEVICE_SIZE.width, DEVICE_SIZE.height);
    [self.view addSubview:customButton];
    
    // add label
    screenSizeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, kLabelWidth, kLabelHeight)];
    [screenSizeInfoLabel setText:[NSString stringWithFormat:@"Width: %.0f - Height : %.0f", [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height]];
    [screenSizeInfoLabel setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:screenSizeInfoLabel];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight);
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight);
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        
        NSLog(@"landscape");
        [self updateScreenInfo];
        [self updateButtonPosition];
        
    } else if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
        
        NSLog(@"portrait");
        [self updateScreenInfo];
        [self updateButtonPosition];
        
    }

}

- (BOOL)shouldAutorotate
{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        
        NSLog(@"landscape");
        [self updateScreenInfo];
        [self updateButtonPosition];
        
    } else if (UIInterfaceOrientationIsPortrait(orientation)) {
        
        NSLog(@"portrait");
        [self updateScreenInfo];
        [self updateButtonPosition];

    }
    
    return YES;

}


#pragma mark - Orientation Change Action 
- (void)updateScreenInfo
{
    
    [screenSizeInfoLabel setText:[NSString stringWithFormat:@"Width: %.0f - Height : %.0f", DEVICE_SIZE.width, DEVICE_SIZE.height]];
    NSLog(@"%@",[NSString stringWithFormat:@"Width: %.0f - Height : %.0f", DEVICE_SIZE.width, DEVICE_SIZE.height]);

}

- (void)updateButtonPosition
{
    [customButton setFrame:CGRectMake((DEVICE_SIZE.width - kButtonWidth) / 2, (DEVICE_SIZE.height - kButtonHeight) / 2, kButtonWidth, kButtonHeight)];

}

#pragma mark - Animate 
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        [customButton setFrame:CGRectMake((DEVICE_SIZE.width - kButtonWidth) / 2, (DEVICE_SIZE.height - kButtonHeight) / 2, kButtonWidth, kButtonHeight)];
        
    } completion:^(BOOL finished) {
        
    }];


}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
//    UITouch *aTouch = [touches anyObject];
//    CGPoint currentTouchPosition = [aTouch locationInView:self.view];
    
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        [customButton setFrame:CGRectMake((DEVICE_SIZE.width - kButtonWidth) / 2, [self getRandomNumber], kButtonWidth, kButtonHeight)];
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

}

- (int)getRandomNumber
{
    int maxNumber = (int)DEVICE_SIZE.height-20;
    return (int)0 + arc4random() % (maxNumber-0+1);
}

@end
