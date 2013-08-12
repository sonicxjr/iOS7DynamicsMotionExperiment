//
//  VerticalSplitView.m
//  MotionTest
//
//  Created by Hans De Smedt on 11/08/13.
//  Copyright (c) 2013 Hans De Smedt. All rights reserved.
//

#import "VerticalSplitView.h"
#import "UIColor+iOSeeAdditions.h"

@implementation VerticalSplitView

-(instancetype)initWithFrame:(CGRect)frame level:(CGFloat)level
{
    if(self = [super init]){
        CGRect leftRect = CGRectMake(0, 0, frame.size.width / 2.0, frame.size.height);
        CGRect rightRect = CGRectMake(frame.size.width / 2.0, 0, frame.size.width / 2.0, frame.size.height);
        
        self.leftView = [[UIView alloc] initWithFrame:leftRect];
        self.leftView.alpha = 0.7;
        self.leftView.backgroundColor = [UIColor randomColor];
        
        self.rightView = [[UIView alloc] initWithFrame:rightRect];
        self.rightView.alpha = 0.7;
        self.rightView.backgroundColor = [UIColor randomColor];
        
        self.leftDragBehavior =
        [[HorizontalDragBehavior alloc]
         initWithItem:self.leftView
         withXForce:-12
         withYForce:0
         withEdges:UIEdgeInsetsMake(0, -150 + level * 10, 0, 160)];
        
        self.rightDragBehavior =
        [[HorizontalDragBehavior alloc]
         initWithItem:self.rightView
         withXForce:12
         withYForce:0
         withEdges:UIEdgeInsetsMake(0, 160, 0, -150 + level * 10)];
        
        UIInterpolatingMotionEffect *xAxis = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        xAxis.minimumRelativeValue = [NSNumber numberWithFloat:-10.0 - level * 2];
        xAxis.maximumRelativeValue = [NSNumber numberWithFloat:10.0 + level * 2];
        
        UIInterpolatingMotionEffect *yAxis = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        yAxis.minimumRelativeValue = [NSNumber numberWithFloat:-10.0 - level * 2];
        yAxis.maximumRelativeValue = [NSNumber numberWithFloat:10.0 + level * 2];
        
        UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc] init];
        group.motionEffects = @[xAxis, yAxis];
        [self.leftView addMotionEffect:group];
        [self.rightView addMotionEffect:group];
    }
    return self;
}

-(void) linkViewsTo:(NSArray*) behaviors
{
    self.leftView.tag = [behaviors indexOfObject:self.leftDragBehavior];
    self.rightView.tag = [behaviors indexOfObject:self.rightDragBehavior];
}

@end
