//
//  HorizontalForceBehavior.h
//  MotionTest
//
//  Created by Hans De Smedt on 4/08/13.
//  Copyright (c) 2013 Hans De Smedt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalForceBehavior : UIDynamicBehavior{
    UIPushBehavior* pushBehavior;
}

- (instancetype)initWithItem:(id <UIDynamicItem>)item withXForce:(CGFloat)xComponent withYForce:(CGFloat)yComponent;
- (void)setActive:(bool)active;

@end
