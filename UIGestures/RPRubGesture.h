//
//  RPRubGesture.h
//  UIGestures
//
//  Created by Ryan Poolos on 6/13/12.
//  Copyright (c) 2012 Frozen Fire Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface RPRubGesture : UIGestureRecognizer
{
    CGPoint startLocation;
}

@property (assign) int rubs;

@end
