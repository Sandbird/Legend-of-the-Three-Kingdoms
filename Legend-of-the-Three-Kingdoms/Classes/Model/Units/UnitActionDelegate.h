//
//  UnitActionDelegate.h
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-11.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Unit;

@protocol UnitActionDelegate <NSObject>

- (void)selectUnit:(Unit *)unit withTouch:(UITouch *)touch;

@end
