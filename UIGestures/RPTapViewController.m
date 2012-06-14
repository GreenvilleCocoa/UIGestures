//
//  RPTapViewController.m
//  UIGestures
//
//  Created by Ryan Poolos on 6/13/12.
//  Copyright (c) 2012 Frozen Fire Studios. All rights reserved.
//

#import "RPTapViewController.h"

@interface RPTapViewController ()

@end

@implementation RPTapViewController
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
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    
    [label addGestureRecognizer:tap];
}

- (void)viewDidUnload
{
    [self setLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)handleTap:(UITapGestureRecognizer *)gesture
{
    [label setText:@"Tapped!"];
    
    [label performSelector:@selector(setText:) withObject:@"Tap Me" afterDelay:2.0];
}

@end
