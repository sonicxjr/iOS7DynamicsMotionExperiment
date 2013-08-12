//
//  HorizontalDragBehavior.h
//  MotionTest
//
//  Created by Hans De Smedt on 4/08/13.
//  Copyright (c) 2013 Hans De Smedt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HorizontalAttachmentBehavior.h"
#import "HorizontalCollisionBehavior.h"
#import "HorizontalForceBehavior.h"

@interface HorizontalDragBehavior : UIDynamicBehavior{
    HorizontalAttachmentBehavior* attachmentBehavior;
    HorizontalCollisionBehavior* collisionBehavior;
    HorizontalForceBehavior* forceBehavior;
}

- (instancetype)initWithItem:(id <UIDynamicItem>)item withXForce:(CGFloat)xComponent withYForce:(CGFloat)yComponent withEdges:(UIEdgeInsets)edges;

- (void)changedAttachmentLocation:(CGFloat)x;
- (void)beganAttachmentLocation:(CGPoint)startPoint;
- (void)endedAttachmentLocation;

@end
