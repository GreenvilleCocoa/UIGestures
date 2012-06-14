//
//  RPCustomViewController.h
//  UIGestures
//
//  Created by Ryan Poolos on 6/13/12.
//  Copyright (c) 2012 Frozen Fire Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPRubGesture.h"

@interface RPCustomViewController : UIViewController <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *lamp;
@property (weak, nonatomic) IBOutlet UIImageView *genie;

@end
