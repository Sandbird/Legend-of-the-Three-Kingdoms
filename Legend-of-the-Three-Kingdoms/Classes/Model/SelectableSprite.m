//
//  SelectableSprite.m
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-11.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import "SelectableSprite.h"
#import "SelectableSpriteDelegate.h"


@implementation SelectableSprite
{
    id<SelectableSpriteDelegate> _delegate;
}

- (void)setDelegate:(id<SelectableSpriteDelegate>)delegate
{
    _delegate = delegate;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (_delegate != nil && [_delegate respondsToSelector:@selector(spriteTouched:withEvent:)]) {
        [_delegate spriteTouched:touch withEvent:event];
    }
}

- (void)dealloc
{
    _delegate = nil;
}

@end
