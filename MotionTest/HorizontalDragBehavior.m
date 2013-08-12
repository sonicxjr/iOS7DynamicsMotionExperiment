//
//  HorizontalDragBehavior.m
//  MotionTest
//
//  Created by Hans De Smedt on 4/08/13.
//  Copyright (c) 2013 Hans De Smedt. All rights reserved.
//

#import "HorizontalDragBehavior.h"

@implementation HorizontalDragBehavior

- (instancetype)initWithItem:(id <UIDynamicItem>)item
                  withXForce:(CGFloat)xComponent
                  withYForce:(CGFloat)yComponent
                   withEdges:(UIEdgeInsets)edges
{
    if(self = [super init]){
        attachmentBehavior = [[HorizontalAttachmentBehavior alloc] initWithItem:item];
        collisionBehavior = [[HorizontalCollisionBehavior alloc] initWithItem:item withEdges:edges];
        forceBehavior = [[HorizontalForceBehavior alloc] initWithItem:item withXForce:xComponent withYForce:yComponent];
        [forceBehavior setActive:false];
        
        [self addChildBehavior:collisionBehavior];
        [self addChildBehavior:forceBehavior];
    }
    return self;
}

- (void)beganAttachmentLocation:(CGPoint)startPoint
{
    [forceBehavior setActive:true];
    [self addChildBehavior:attachmentBehavior];
    [attachmentBehavior createAttachmentLocation:startPoint];
}

- (void)changedAttachmentLocation:(CGFloat)x
{
    [attachmentBehavior updateAttachmentLocation:x];
}

- (void)endedAttachmentLocation
{
    [self removeChildBehavior:attachmentBehavior];
}

@end
