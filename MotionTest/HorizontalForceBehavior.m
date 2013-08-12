//
//  HorizontalForceBehavior.m
//  MotionTest
//
//  Created by Hans De Smedt on 4/08/13.
//  Copyright (c) 2013 Hans De Smedt. All rights reserved.
//

#import "HorizontalForceBehavior.h"

@implementation HorizontalForceBehavior

- (instancetype)initWithItem:(id <UIDynamicItem>)item withXForce:(CGFloat)xComponent withYForce:(CGFloat)yComponent
{
    if(self = [super init]){
        pushBehavior = [[UIPushBehavior alloc] initWithItems:@[item] mode:UIPushBehaviorModeContinuous];
        pushBehavior.xComponent = xComponent;
        pushBehavior.yComponent = yComponent;

        [self addChildBehavior:pushBehavior];
    }
    return self;
}

- (void)setActive:(bool)active
{
    pushBehavior.active = active;
}

@end
