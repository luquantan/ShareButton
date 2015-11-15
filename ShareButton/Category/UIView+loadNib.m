//
//  UIView+loadNib.m
//  ShareButton
//
//  Created by LuQuan Intrepid on 11/15/15.
//  Copyright © 2015 Lu Quan Tan. All rights reserved.
//

#import "UIView+loadNib.h"
#import <UIView+Constraints.h>

@implementation UIView (loadNib)

- (void)loadNib {
    if (self.subviews.count) {
        return;
    }

    NSArray *viewsInNib = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                        owner:self
                                                      options:nil];
    id loadedView;
    for (id view in viewsInNib) {
        if ([view isKindOfClass:[self class]]) {
            loadedView = view;
            break;
        }
    }

    [self addSubview:loadedView];
    [self constrainViewToAllEdges:loadedView];
}

@end
