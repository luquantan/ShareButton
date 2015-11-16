//
//  LQSlidingView.m
//  ShareButton
//
//  Created by LuQuan Intrepid on 11/15/15.
//  Copyright © 2015 Lu Quan Tan. All rights reserved.
//

#import "LQSlidingView.h"
#import "UIView+constraints.h"

@interface LQSlidingView()
@property (nonatomic, strong) UIView *nibView;
@property (weak, nonatomic) IBOutlet UIView *slidingView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *slidingViewTrailingConstraint;
@end

@implementation LQSlidingView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self loadNib];
    [self setupCorner];
    [self setupTapGesture];
}

#pragma mark - Setup

- (void)setupCorner {
    self.layer.cornerRadius = CGRectGetHeight(self.frame) / 2;
    self.layer.masksToBounds = YES;

    self.slidingView.layer.cornerRadius = CGRectGetHeight(self.frame) / 2;
    self.slidingView.layer.masksToBounds = YES;
}

- (void)setupTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapView)];
    [self addGestureRecognizer:tap];
}

#pragma mark - Gesture

- (void)didTapView {
    if (self.slidingViewTrailingConstraint.constant == 0.0f) {
        [UIView animateWithDuration:0.5 animations:^{
            self.slidingViewTrailingConstraint.constant = CGRectGetWidth(self.slidingView.bounds);
            [self layoutIfNeeded];
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            self.slidingViewTrailingConstraint.constant = 0.0f;
            [self layoutIfNeeded];
        }];
    }
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
