//
//  RPCustomViewController.m
//  UIGestures
//
//  Created by Ryan Poolos on 6/13/12.
//  Copyright (c) 2012 Frozen Fire Studios. All rights reserved.
//

#import "RPCustomViewController.h"

@interface RPCustomViewController ()

@end

@implementation RPCustomViewController
@synthesize genie, lamp;

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
    
    RPRubGesture *rub = [[RPRubGesture alloc] initWithTarget:self action:@selector(handleRub:)];
    [rub setDelegate:self];
    [lamp addGestureRecognizer:rub];
    
    [genie setAlpha:0.0];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)handleRub:(RPRubGesture *)gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStateChanged:
            [genie setAlpha:gesture.rubs/250.0];
            break;
            
        default:
            [UIView animateWithDuration:1.0 animations:^{
                [genie setAlpha:0.0];
            }];
            break;
    }
}

@end
