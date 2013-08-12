//
//  Stage2ViewController.m
//  MotionTest
//
//  Created by Hans De Smedt on 30/07/13.
//  Copyright (c) 2013 Hans De Smedt. All rights reserved.
//

#import "Stage2ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface Stage2ViewController ()

@end

@implementation Stage2ViewController

- (void) createMask
{
    self.blurFilterOrigin = self.pinchView.center;
    self.blurFilterDiameter = MIN(CGRectGetWidth(self.pinchView.bounds), CGRectGetHeight(self.pinchView.bounds));
    
    CAShapeLayer *blurFilterMask = [CAShapeLayer layer];
    // Disable implicit animations for the blur filter mask's path property.
    blurFilterMask.actions = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNull null], @"path", nil];
    blurFilterMask.fillColor = [UIColor blackColor].CGColor;
    blurFilterMask.fillRule = kCAFillRuleEvenOdd;
    blurFilterMask.frame = self.pinchView.bounds;
    blurFilterMask.opacity = 1.0f;
    self.blurFilterMask = blurFilterMask;
    [self refreshBlurMask];
    self.pinchView.layer.mask = blurFilterMask;
}

- (void)refreshBlurMask
{
    CGFloat blurFilterRadius = self.blurFilterDiameter * 0.25f;
    
    CGMutablePathRef blurRegionPath = CGPathCreateMutable();
    CGPathAddRect(blurRegionPath, NULL, self.pinchView.bounds);
    CGPathAddEllipseInRect(blurRegionPath, NULL, CGRectMake(self.blurFilterOrigin.x - blurFilterRadius, self.blurFilterOrigin.y - blurFilterRadius, self.blurFilterDiameter, self.blurFilterDiameter));
    
    self.blurFilterMask.path = blurRegionPath;
    
    CGPathRelease(blurRegionPath);
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self createMask];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
