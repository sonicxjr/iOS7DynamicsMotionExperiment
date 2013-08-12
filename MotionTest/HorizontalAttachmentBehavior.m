//
//  ViewAttachmentBehavior.m
//  MotionTest
//
//  Created by Hans De Smedt on 4/08/13.
//  Copyright (c) 2013 Hans De Smedt. All rights reserved.
//

#import "HorizontalAttachmentBehavior.h"

@implementation HorizontalAttachmentBehavior

- (instancetype)initWithItem:(id <UIDynamicItem>)item
{
    if(self = [super init]){
        initHeight = item.bounds.size.height / 2.0;
        CGPoint anchorPoint = CGPointMake(item.bounds.size.width / 2.0, initHeight);

        attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:anchorPoint];
        [attachmentBehavior setDamping:0.4];
        [attachmentBehavior setFrequency:2];
        
        [self addChildBehavior:attachmentBehavior];
    }
    return self;
}

- (void)createAttachmentLocation:(CGPoint)startPoint
{
    delta = attachmentBehavior.anchorPoint.x - startPoint.x;
}

- (void)updateAttachmentLocation:(CGFloat)x
{
    CGPoint anchorPoint = CGPointMake(x + delta, initHeight);
    [attachmentBehavior setAnchorPoint:anchorPoint];
}

@end
