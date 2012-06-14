//
//  RPPinchViewController.m
//  UIGestures
//
//  Created by Ryan Poolos on 6/13/12.
//  Copyright (c) 2012 Frozen Fire Studios. All rights reserved.
//

#import "RPPinchViewController.h"

@interface RPPinchViewController ()

@end

@implementation RPPinchViewController
@synthesize label;

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
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [label addGestureRecognizer:pinch];
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

- (void)handlePinch:(UIPinchGestureRecognizer *)gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            [label setText:@"Ouch!"];
            break;
            
        case UIGestureRecognizerStateChanged:
            [label setText:[NSString stringWithFormat:@"Ouch@%.fx!",gesture.scale]];
            [label setTransform:CGAffineTransformMakeScale(gesture.scale, gesture.scale)];
            break;
            
        default:
            [UIView animateWithDuration:0.5 animations:^{
                [label setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
            } completion:^(BOOL finished) {
                [label setText:@"Pinch Me!"];
            }];
            break;
    }
}

@end
