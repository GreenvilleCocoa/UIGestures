//
//  RPSwipeViewController.m
//  UIGestures
//
//  Created by Ryan Poolos on 6/13/12.
//  Copyright (c) 2012 Frozen Fire Studios. All rights reserved.
//

#import "RPSwipeViewController.h"

@interface RPSwipeViewController ()

@end

@implementation RPSwipeViewController
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
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRight:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeUp:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeDown:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    
    [label addGestureRecognizer:swipeLeft];
    [label addGestureRecognizer:swipeRight];
    [label addGestureRecognizer:swipeUp];
    [label addGestureRecognizer:swipeDown];
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

- (void)handleSwipeLeft:(UISwipeGestureRecognizer *)gesture
{
    originalCenter = label.center;
    
    [UIView animateWithDuration:0.5 animations:^{
        [label setCenter:CGPointMake(label.center.x - 768, label.center.y)];
    } completion:^(BOOL finished) {
        [label setCenter:CGPointMake(label.center.x + 1536, label.center.y)];
        
        [UIView animateWithDuration:0.5 animations:^{
            [label setCenter:originalCenter];
        }];
    }];
}

- (void)handleSwipeRight:(UISwipeGestureRecognizer *)gesture
{
    originalCenter = label.center;
    
    [UIView animateWithDuration:0.5 animations:^{
        [label setCenter:CGPointMake(label.center.x + 768, label.center.y)];
    } completion:^(BOOL finished) {
        [label setCenter:CGPointMake(label.center.x - 1536, label.center.y)];
        
        [UIView animateWithDuration:0.5 animations:^{
            [label setCenter:originalCenter];
        }];
    }];
}

- (void)handleSwipeUp:(UISwipeGestureRecognizer *)gesture
{
    originalCenter = label.center;
    
    [UIView animateWithDuration:0.5 animations:^{
        [label setCenter:CGPointMake(label.center.x, label.center.y - 768)];
    } completion:^(BOOL finished) {
        [label setCenter:CGPointMake(label.center.x, label.center.y + 1536)];
        
        [UIView animateWithDuration:0.5 animations:^{
            [label setCenter:originalCenter];
        }];
    }];
}

- (void)handleSwipeDown:(UISwipeGestureRecognizer *)gesture
{
    originalCenter = label.center;
    
    [UIView animateWithDuration:0.5 animations:^{
        [label setCenter:CGPointMake(label.center.x, label.center.y + 768)];
    } completion:^(BOOL finished) {
        [label setCenter:CGPointMake(label.center.x, label.center.y - 1536)];
        
        [UIView animateWithDuration:0.5 animations:^{
            [label setCenter:originalCenter];
        }];
    }];
}

@end
