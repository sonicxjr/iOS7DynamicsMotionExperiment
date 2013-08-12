//
//  BaseSplitView.h
//  MotionTest
//
//  Created by Hans De Smedt on 12/08/13.
//  Copyright (c) 2013 Hans De Smedt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HorizontalDragBehavior.h"

@protocol BaseSplitView <NSObject>

-(instancetype)initWithFrame:(CGRect)frame level:(CGFloat)level;
-(void)linkViewsTo:(NSArray*) behaviors;

@property (strong, nonatomic) UIView *leftView;
@property (strong, nonatomic) UIView *rightView;

@property (strong, nonatomic) HorizontalDragBehavior *leftDragBehavior;
@property (strong, nonatomic) HorizontalDragBehavior *rightDragBehavior;

@end
