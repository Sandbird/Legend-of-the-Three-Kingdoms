//
//  SelectableSpriteDelegate.h
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-11.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SelectableSpriteDelegate <NSObject>

- (void)spriteTouched:(UITouch *)touch withEvent:(UIEvent *)event;

@end
