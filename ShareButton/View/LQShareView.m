//
//  LQShareView.m
//  ShareButton
//
//  Created by LuQuan Intrepid on 11/15/15.
//  Copyright © 2015 Lu Quan Tan. All rights reserved.
//

#import "LQShareView.h"
#import "UIView+constraints.h"

@interface LQShareView()
@property (nonatomic, strong) UIView *nibView;
@end

@implementation LQShareView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self loadNib];
}

#pragma mark - Load Nib

- (void)loadNib {
    if (self) {
        self.nibView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                      owner:self
                                                    options:nil] lastObject];
        [self addSubview:self.nibView];
        [self constrainViewToAllEdges:self.nibView];
    }
}

@end
