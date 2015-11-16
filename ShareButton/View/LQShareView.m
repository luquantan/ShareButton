//
//  LQShareView.m
//  ShareButton
//
//  Created by LuQuan Intrepid on 11/15/15.
//  Copyright © 2015 Lu Quan Tan. All rights reserved.
//

#import "LQShareView.h"
#import "UIView+constraints.h"
#import "LQButtonView.h"
#import "UIImage+ShareButton.h"
#import "LQSlidingView.h"
#import "UIColor+ShareButton.h"

@interface LQShareView() <LQButtonViewDelegate>
@property (nonatomic, strong) UIView *nibView;
@property (weak, nonatomic) IBOutlet UIView *centeringView;
@property (nonatomic, strong) NSArray *buttons;
@property (nonatomic, strong) LQButtonView *button1;
@property (nonatomic, strong) LQButtonView *button2;
@property (nonatomic, strong) LQButtonView *button3;

@property (nonatomic, strong) NSArray *backingViews;
@property (nonatomic, strong) UIView *backingView1;
@property (nonatomic, strong) UIView *backingView2;
@property (nonatomic, strong) UIView *backingView3;
@end

@implementation LQShareView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self loadNib];
    [self addBackingViews];
    [self addButtons];
}

#pragma mark - Button

- (void)addButtons {
    UIView *preceedingView;
    if (self.buttons.count != 0) {
        for (LQButtonView *button in self.buttons) {
            [self.centeringView addSubview:button];
            [self.centeringView constrainView:button toInsets:UIEdgeInsetsMake(0.0f, NSNotFound, 0.0f, NSNotFound)];
            if (!preceedingView) {
                [self.centeringView constrainViewToLeft:button];
            } else {
                [self.centeringView constrainView:button rightOfView:preceedingView];
                [self.centeringView constrainView:button attribute:NSLayoutAttributeWidth toView:preceedingView attribute:NSLayoutAttributeWidth];
            }
            preceedingView = button;
        }
        [self.centeringView constrainViewToRight:preceedingView];
    }
}

- (void)addBackingViews {
    UIView *preceedingView;
    if (self.backingViews.count != 0) {
        for (UIView *view in self.backingViews) {
            [self.centeringView addSubview:view];
            [self.centeringView constrainView:view toInsets:UIEdgeInsetsMake(0.0f, NSNotFound, 0.0f, NSNotFound)];
            if (!preceedingView) {
                [self.centeringView constrainViewToLeft:view];
            } else {
                [self.centeringView constrainView:view rightOfView:preceedingView];
                [self.centeringView constrainView:view attribute:NSLayoutAttributeWidth toView:preceedingView attribute:NSLayoutAttributeWidth];
            }
            preceedingView = view;
        }
        [self.centeringView constrainViewToRight:preceedingView];
    }
}

#pragma mark - LQButtonViewDelegate

- (void)buttonViewDidReceiveTap:(LQButtonView *)buttonView {
    if (buttonView ==self.button1) {
        [self.button1 setButtonColor:[UIColor selectedButtonColor]];
        [UIView animateWithDuration:0.5 animations:^{
            self.backingView1.transform = CGAffineTransformMakeScale(10.0f, 10.0f);
        } completion:^(BOOL finished) {
            if (finished) {
                [self finishExpandingBackingViews];
            }
        }];
    } else if (buttonView == self.button2) {
        [UIView animateWithDuration:0.5 animations:^{
            self.backingView2.transform = CGAffineTransformMakeScale(10.0f, 10.0f);
            [self.button2 setButtonColor:[UIColor selectedButtonColor]];
        } completion:^(BOOL finished) {
            if (finished) {
                [self finishExpandingBackingViews];
            }
        }];
    } else if (buttonView == self.button3) {
        [UIView animateWithDuration:0.5 animations:^{
            self.backingView3.transform = CGAffineTransformMakeScale(10.0f, 10.0f);
            [self.button3 setButtonColor:[UIColor selectedButtonColor]];
        } completion:^(BOOL finished) {
            if (finished) {
                [self finishExpandingBackingViews];
            }
        }];
    }
}

- (void)finishExpandingBackingViews {
    if ([self.delegate respondsToSelector:@selector(shareViewDidFinish:withCompletion:)]) {
        [self.delegate shareViewDidFinish:self withCompletion:^{
            for (UIView *view in self.backingViews) {
                view.transform = CGAffineTransformMakeScale(0.2f, 0.2f);
            }
            for (LQButtonView *view in self.buttons) {
                [view setButtonColor:[UIColor defaultButtonColor]];
            }
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

#pragma mark - Lazy

- (NSArray *)buttons {
    if (!_buttons) {
        _buttons = @[self.button1, self.button2, self.button3];
    }
    return _buttons;
}

- (LQButtonView *)button1 {
    if (!_button1) {
        _button1 = [[LQButtonView alloc] init];
        [_button1 setImage:[UIImage googleIcon]];
        _button1.delegate = self;
    }
    return _button1;
}

- (LQButtonView *)button2 {
    if (!_button2) {
        _button2 = [[LQButtonView alloc] init];
        [_button2 setImage:[UIImage twitterIcon]];
        _button2.delegate = self;
    }
    return _button2;
}

- (LQButtonView *)button3 {
    if (!_button3) {
        _button3 = [[LQButtonView alloc] init];
        [_button3 setImage:[UIImage facebookIcon]];
        _button3.delegate = self;
    }
    return _button3;
}

- (NSArray *)backingViews {
    if (!_backingViews) {
        _backingViews = @[self.backingView1, self.backingView2, self.backingView3];
    }
    return _backingViews;
}

- (UIView *)backingView1 {
    if (!_backingView1) {
        _backingView1 = [[UIView alloc] init];
        _backingView1.backgroundColor = [UIColor selectedButtonColor];
        _backingView1.transform = CGAffineTransformMakeScale(0.2, 0.2);
    }
    return _backingView1;
}

- (UIView *)backingView2 {
    if (!_backingView2) {
        _backingView2 = [[UIView alloc] init];
        _backingView2.backgroundColor = [UIColor selectedButtonColor];
        _backingView2.transform = CGAffineTransformScale(_backingView2.transform, 0.2, 0.2);
    }
    return _backingView2;
}

- (UIView *)backingView3 {
    if (!_backingView3) {
        _backingView3 = [[UIView  alloc] init];
        _backingView3.backgroundColor = [UIColor selectedButtonColor];
        _backingView3.transform = CGAffineTransformScale(_backingView3.transform, 0.2, 0.2);
    }
    return _backingView3;
}

@end
