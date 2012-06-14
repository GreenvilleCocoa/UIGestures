//
//  RPMDragViewController.m
//  UIGestures
//
//  Created by Ryan Poolos on 6/13/12.
//  Copyright (c) 2012 Frozen Fire Studios. All rights reserved.
//

#import "RPMDragViewController.h"

@interface RPMDragViewController ()

@end

@implementation RPMDragViewController
@synthesize labels;

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
        
    for (UILabel *label in labels) {
        UIPanGestureRecognizer *drag = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleDrag:)];
        [label addGestureRecognizer:drag];
        
        [label setTag:[labels indexOfObject:label]];
    }
}

- (void)viewDidUnload
{
    [self setLabels:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)handleDrag:(UIPanGestureRecognizer *)gesture
{
    UILabel *label = (UILabel *)gesture.view;
    
    if (!dragging) {
        dragging = [NSMutableDictionary dictionary];
    }
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            [label setText:@"Dragging!"];
            
            [dragging setObject:label forKey:@"Key"];
            
            CGPoint locationInLabel = [gesture locationInView:label];
            
            [label.layer setAnchorPoint:CGPointMake(locationInLabel.x/label.frame.size.width, locationInLabel.y/label.frame.size.height)];
            [label setCenter:[gesture locationInView:self.view]];
            break;
            
        case UIGestureRecognizerStateChanged:
            [label setCenter:[gesture locationInView:self.view]];
            break;
            
        default:
            [label setText:@"Drag Us!"];
            break;
    }
}

@end
