//
//  LQButtonView.m
//  ShareButton
//
//  Created by LuQuan Intrepid on 11/15/15.
//  Copyright © 2015 Lu Quan Tan. All rights reserved.
//

#import "LQButtonView.h"
#import "UIView+constraints.h"

@interface LQButtonView()
@property (nonatomic, strong) UIView *nibView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation LQButtonView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadNib];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self loadNib];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupImageCornerRadius];
}
#pragma mark - Image

- (void)setImage:(UIImage *)image {
    [self.button setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
}

- (void)setButtonColor:(UIColor *)color {
    [self.button setBackgroundColor:color];
}

- (void)setupImageCornerRadius {
    self.button.layer.cornerRadius = CGRectGetHeight(self.button.frame) / 2;
    self.button.layer.masksToBounds = YES;
}

#pragma mark - Action

- (IBAction)buttonPressed:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(buttonViewDidReceiveTap:)]) {
        [self.delegate buttonViewDidReceiveTap:self];
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
