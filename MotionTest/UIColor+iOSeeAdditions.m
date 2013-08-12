//
//  UIColor+iOSeeAdditions.m
//  MotionTest
//
//  Created by Hans De Smedt on 12/08/13.
//  Copyright (c) 2013 Hans De Smedt. All rights reserved.
//

#import "UIColor+iOSeeAdditions.h"

@implementation UIColor (iOSeeAdditions)

+ (UIColor *)randomColor {
    return [self colorWithRed:((float)rand() / RAND_MAX)
                        green:((float)rand() / RAND_MAX)
                         blue:((float)rand() / RAND_MAX)
                        alpha:1.0f];
}

@end
