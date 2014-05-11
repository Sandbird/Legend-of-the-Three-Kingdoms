//
//  SelectableSprite.h
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-11.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import "cocos2d.h"

@protocol SelectableSpriteDelegate;

@interface SelectableSprite : CCSprite

- (void)setDelegate:(id<SelectableSpriteDelegate>) delegate;

@end
