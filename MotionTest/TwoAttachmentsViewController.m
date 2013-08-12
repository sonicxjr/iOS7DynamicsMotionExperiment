//
//  TwoAttachmentsViewController.m
//  MotionTest
//
//  Created by Hans De Smedt on 2/08/13.
//  Copyright (c) 2013 Hans De Smedt. All rights reserved.
//

#import "TwoAttachmentsViewController.h"
#import "BaseSplitView.h"

@interface TwoAttachmentsViewController ()

@property (nonatomic) UIDynamicAnimator* animator;
@property (nonatomic) HorizontalDragBehavior* leftDragBehavior;
@property (nonatomic) HorizontalDragBehavior* rightDragBehavior;

@end

@implementation TwoAttachmentsViewController

- (void)setupSplitView:(VerticalSplitView *)view
{
    UIPanGestureRecognizer *leftRecognizer =
        [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureHandle:)];
    UIPanGestureRecognizer *rightRecognizer =
        [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureHandle:)];
    
    [view.leftView addGestureRecognizer:leftRecognizer];
    [view.rightView addGestureRecognizer:rightRecognizer];
    [super.view addSubview:view.leftView];
    [super.view addSubview:view.rightView];
    
    [self.animator addBehavior:view.leftDragBehavior];
    [self.animator addBehavior:view.rightDragBehavior];
    [view linkViewsTo:[self.animator behaviors]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIDynamicAnimator* animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.animator = animator;
    
    id<BaseSplitView> splitView;
    for (int level=5; level>=0; level--) {
        if(level % 2 == 0){
            splitView = [[VerticalSplitView alloc] initWithFrame:self.view.bounds level:level];
            [self setupSplitView:splitView];
        }
        else
        {
            splitView = [[HorizontalSplitView alloc] initWithFrame:self.view.bounds level:level];
            [self setupSplitView:splitView];
        }
    }
}

- (IBAction)panGestureHandle:(UIPanGestureRecognizer *)gesture
{
    HorizontalDragBehavior* behavior = [[self.animator behaviors] objectAtIndex:gesture.view.tag];
    
    switch (gesture.state)
    {
        case UIGestureRecognizerStateBegan:
        {
            CGPoint startPoint = [gesture locationInView:self.view];
            [behavior beganAttachmentLocation:startPoint];
        }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            CGPoint point = [gesture locationInView:self.view];
            [behavior changedAttachmentLocation:point.x];
        }
            break;
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
        {
            [behavior endedAttachmentLocation];
        }
            break;
            
        case UIGestureRecognizerStatePossible:
        {

        }
            break;
            
    }
}

@end
