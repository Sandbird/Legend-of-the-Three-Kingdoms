//
//  StageScene.h
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-10.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import "cocos2d.h"
#import "UnitActionDelegate.h"

@interface StageScene : CCScene <UnitActionDelegate>

+ (StageScene *)scene;

@end
