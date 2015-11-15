//
//  LQSlidingView.m
//  ShareButton
//
//  Created by LuQuan Intrepid on 11/15/15.
//  Copyright © 2015 Lu Quan Tan. All rights reserved.
//

#import "LQSlidingView.h"
#import "UIView+loadNib.h"

@implementation LQSlidingView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self loadNib];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = CGRectGetHeight(self.frame) / 2;
    self.layer.masksToBounds = YES;
}

@end
