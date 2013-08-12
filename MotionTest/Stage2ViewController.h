//
//  Stage2ViewController.h
//  MotionTest
//
//  Created by Hans De Smedt on 30/07/13.
//  Copyright (c) 2013 Hans De Smedt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Stage2ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *pinchView;

@property (strong) CAShapeLayer *blurFilterMask;
@property (assign) CGPoint blurFilterOrigin;
@property (assign) CGFloat blurFilterDiameter;

@end
