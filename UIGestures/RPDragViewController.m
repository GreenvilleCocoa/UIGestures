//
//  RPDragViewController.m
//  UIGestures
//
//  Created by Ryan Poolos on 6/13/12.
//  Copyright (c) 2012 Frozen Fire Studios. All rights reserved.
//

#import "RPDragViewController.h"

@interface RPDragViewController ()

@end

@implementation RPDragViewController
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
    [label addGestureRecognizer:drag];
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

- (void)handleDrag:(UIPanGestureRecognizer *)gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            [label setText:@"Dragging!"];
                        
            CGPoint locationInLabel = [gesture locationInView:label];
            
            [label.layer setAnchorPoint:CGPointMake(locationInLabel.x/label.frame.size.width, locationInLabel.y/label.frame.size.height)];
            [label setCenter:[gesture locationInView:self.view]];
            break;
            
        case UIGestureRecognizerStateChanged:
            [label setCenter:[gesture locationInView:self.view]];
            break;
            
        default:
            [label setText:@"Drag Me!"];
            break;
    }
}

@end
