//
//  LQButtonView.h
//  ShareButton
//
//  Created by LuQuan Intrepid on 11/15/15.
//  Copyright © 2015 Lu Quan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LQButtonView;

@protocol LQButtonViewDelegate <NSObject>
- (void)buttonViewDidReceiveTap:(LQButtonView *)buttonView;
@end

@interface LQButtonView : UIView
@property (nonatomic, weak) id<LQButtonViewDelegate> delegate;
- (void)setImage:(UIImage *)image;
- (void)setButtonColor:(UIColor *)color;
@end
