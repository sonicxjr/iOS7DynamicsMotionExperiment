//
//  HorizontalCollisionBehavior.h
//  MotionTest
//
//  Created by Hans De Smedt on 4/08/13.
//  Copyright (c) 2013 Hans De Smedt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalCollisionBehavior : UIDynamicBehavior

- (instancetype)initWithItem:(id <UIDynamicItem>)item withEdges:(UIEdgeInsets)edges;

@end
