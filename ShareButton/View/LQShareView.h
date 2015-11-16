//
//  LQShareView.h
//  ShareButton
//
//  Created by LuQuan Intrepid on 11/15/15.
//  Copyright © 2015 Lu Quan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LQShareView;

@protocol LQShareViewDelegate <NSObject>
- (void)shareViewDidFinish:(LQShareView *)shareView withCompletion:(void(^)(void))completion;
@end

@interface LQShareView : UIView
@property (nonatomic, weak) id<LQShareViewDelegate> delegate;
@end
