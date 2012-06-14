//
//  RPRubGesture.m
//  UIGestures
//
//  Created by Ryan Poolos on 6/13/12.
//  Copyright (c) 2012 Frozen Fire Studios. All rights reserved.
//

#import "RPRubGesture.h"

#define DISTANCE_THRESHOLD 100.0

@implementation RPRubGesture

@synthesize rubs;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{    
    startLocation = [[touches anyObject] locationInView:self.view];
    rubs = 0;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Get the distance between the start and now.
    UITouch *aTouch = [touches anyObject];
    CGPoint location = [aTouch locationInView:self.view];
    
    CGFloat distance = sqrtf(powf((location.x - startLocation.x), 2) + powf((location.y - startLocation.y), 2));
    
    NSLog(@"Distance: %f",distance);
    
    // If distance is above the threshold we have a rub!
    if (distance > DISTANCE_THRESHOLD) {
        // Reset our starting point
        startLocation = [aTouch locationInView:self.view];
        
        // Update our rubs
        rubs++;
        
        // Change our state
        [self setState:UIGestureRecognizerStateChanged];
    } else {
        return;
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setState:UIGestureRecognizerStateEnded];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setState:UIGestureRecognizerStateCancelled];
}

@end
