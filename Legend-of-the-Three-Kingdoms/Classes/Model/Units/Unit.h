//
//  Unit.h
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-10.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import "cocos2d.h"
#import "GameConfig.h"

@class Landform;

@interface Unit : CCSprite
{
    touchState state;
    int owner;
    BOOL hasRangedWeapon;
    BOOL moving;
    int movementRange;
    int attackRange;
    Landform * landformBeforeMovement;
    int hp;
    CCLabelBMFont * hpLabel;
    
    
    NSMutableArray *spOpenSteps;
    NSMutableArray *spClosedSteps;
    NSMutableArray * movementPath;
    BOOL movedThisTurn;
    BOOL attackedThisTurn;
    BOOL selectingMovement;
    BOOL selectingAttack;
}

- (id)initWithLocation:(CGPoint)location;


@end
