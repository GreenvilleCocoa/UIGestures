//
//  RPMDragViewController.h
//  UIGestures
//
//  Created by Ryan Poolos on 6/13/12.
//  Copyright (c) 2012 Frozen Fire Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPMDragViewController : UIViewController
{
    NSMutableDictionary *dragging;
}

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *labels;

@end
