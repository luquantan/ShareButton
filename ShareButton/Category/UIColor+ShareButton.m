//
//  UIColor+ShareButton.m
//  ShareButton
//
//  Created by LuQuan Intrepid on 11/15/15.
//  Copyright © 2015 Lu Quan Tan. All rights reserved.
//

#import "UIColor+ShareButton.h"

@implementation UIColor (ShareButton)

+ (UIColor *)defaultButtonColor {
    return [UIColor colorWithRed:116.0f / 255.0f
                           green:86.0f / 255.0f
                            blue:104.0f / 255.0f
                           alpha:1.0f];
}

+ (UIColor *)selectedButtonColor {
    return [UIColor colorWithRed:197.0f / 255.0f
                           green:179.0f / 255.0f
                            blue:189.0f / 255.0f
                           alpha:0.5f];
}

@end
