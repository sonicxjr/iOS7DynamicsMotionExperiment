//
//  VerticalSplitView.h
//  MotionTest
//
//  Created by Hans De Smedt on 11/08/13.
//  Copyright (c) 2013 Hans De Smedt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HorizontalDragBehavior.h"
#import "BaseSplitView.h"

@interface VerticalSplitView : NSObject <BaseSplitView>

-(instancetype)initWithFrame:(CGRect)frame level:(CGFloat)level;
-(void)linkViewsTo:(NSArray*) behaviors;

@property (strong, nonatomic) UIView *leftView;
@property (strong, nonatomic) UIView *rightView;

@property (strong, nonatomic) HorizontalDragBehavior *leftDragBehavior;
@property (strong, nonatomic) HorizontalDragBehavior *rightDragBehavior;

@end
