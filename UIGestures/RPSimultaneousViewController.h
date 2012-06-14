//
//  RPSimultaneousViewController.h
//  UIGestures
//
//  Created by Ryan Poolos on 6/13/12.
//  Copyright (c) 2012 Frozen Fire Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPSimultaneousViewController : UIViewController <UIGestureRecognizerDelegate>
{
    BOOL dragging;
    BOOL rotating;
    BOOL scaling;
    
    CGPoint originalCenter;
}

@property (weak, nonatomic) IBOutlet UILabel *label;

@end
