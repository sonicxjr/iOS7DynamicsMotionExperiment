//
//  ViewAttachmentBehavior.h
//  MotionTest
//
//  Created by Hans De Smedt on 4/08/13.
//  Copyright (c) 2013 Hans De Smedt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalAttachmentBehavior : UIDynamicBehavior{
    CGFloat initHeight;
    CGFloat delta;
    
    UIAttachmentBehavior* attachmentBehavior;
}

- (instancetype)initWithItem:(id <UIDynamicItem>)item;
- (void)createAttachmentLocation:(CGPoint)startPoint;
- (void)updateAttachmentLocation:(CGFloat)x;

@end
