//
//  HorizontalCollisionBehavior.m
//  MotionTest
//
//  Created by Hans De Smedt on 4/08/13.
//  Copyright (c) 2013 Hans De Smedt. All rights reserved.
//

#import "HorizontalCollisionBehavior.h"

@implementation HorizontalCollisionBehavior

- (instancetype)initWithItem:(id <UIDynamicItem>)item withEdges:(UIEdgeInsets)edges
{
    if(self = [super init]){
        UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[item]];
        collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
        [collisionBehavior setTranslatesReferenceBoundsIntoBoundaryWithInsets:edges];

        [self addChildBehavior:collisionBehavior];
    }
    return self;
}

@end
