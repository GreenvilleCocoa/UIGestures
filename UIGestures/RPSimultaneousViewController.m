//
//  RPSimultaneousViewController.m
//  UIGestures
//
//  Created by Ryan Poolos on 6/13/12.
//  Copyright (c) 2012 Frozen Fire Studios. All rights reserved.
//

#import "RPSimultaneousViewController.h"

@interface RPSimultaneousViewController ()

@end

@implementation RPSimultaneousViewController
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
    
    UIPanGestureRecognizer *drag = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleDrag:)];
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotate:)];
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    
    [drag setDelegate:self];
    [rotate setDelegate:self];
    [pinch setDelegate:self];
    
    [label addGestureRecognizer:drag];
    [label addGestureRecognizer:rotate];
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

- (void)updateTitle
{
    [self setTitle:[NSString stringWithFormat:@"%@%@%@",(dragging ? @"Dragging" : @""),(scaling ? @" & Pinching" : @""),(rotating ? @" & Rotating" : @"")]];
}

- (void)handleDrag:(UIPanGestureRecognizer *)gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            dragging = YES;
            
            originalCenter = label.center;
            break;
            
        case UIGestureRecognizerStateChanged:
            [self updateTitle];
            [label setCenter:CGPointMake(originalCenter.x + [gesture translationInView:self.view].x, originalCenter.y + [gesture translationInView:self.view].y)];
            break;
            
        default:
            dragging = NO;
            break;
    }
}

- (void)handleRotate:(UIRotationGestureRecognizer *)gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            rotating = YES;
            break;
            
        case UIGestureRecognizerStateChanged:
            [self updateTitle];
            [label setTransform:CGAffineTransformRotate(label.transform, gesture.rotation)];
            gesture.rotation = 0.0;
            break;
            
        default:
            rotating = NO;
            break;
    }
}

- (void)handlePinch:(UIPinchGestureRecognizer *)gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            scaling = YES;
            break;
            
        case UIGestureRecognizerStateChanged:
            [self updateTitle];
            [label setTransform:CGAffineTransformScale(label.transform, gesture.scale, gesture.scale)];
            gesture.scale = 1.0;
            break;
            
        default:
            scaling = NO;
            break;
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

@end
