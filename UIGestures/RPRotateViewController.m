//
//  RPRotateViewController.m
//  UIGestures
//
//  Created by Ryan Poolos on 6/13/12.
//  Copyright (c) 2012 Frozen Fire Studios. All rights reserved.
//

#import "RPRotateViewController.h"

@interface RPRotateViewController ()

@end

@implementation RPRotateViewController
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
    
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotate:)];
    [label addGestureRecognizer:rotate];
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

- (void)handleRotate:(UIRotationGestureRecognizer *)gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            [label setText:@"Weeee!"];
            break;
            
        case UIGestureRecognizerStateChanged:
            [label setText:@"Getting Sick!"];
            [label setTransform:CGAffineTransformMakeRotation(gesture.rotation)];
            break;
            
        default:
            [UIView animateWithDuration:0.5 animations:^{
                [label setTransform:CGAffineTransformMakeRotation(0.0)];
            } completion:^(BOOL finished) {
                [label setText:@"Rotate Me!"];
            }];
            break;
    }
}

@end
