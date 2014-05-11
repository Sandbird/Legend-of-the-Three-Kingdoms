//
//  Unit.h
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-10.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import "cocos2d.h"
#import "GameConfig.h"
#import "SelectableSpriteDelegate.h"
#import "TileData.h"

@class Landform;
@class SelectableSprite;
@class StageScene;
@protocol UnitActionDelegate;

@interface Unit : TileData <SelectableSpriteDelegate>
{
    SelectableSprite *_unit;
    
    id<UnitActionDelegate> _delegate;
    
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

- (id)initWithStage:(CCLayout *)stage
          tileCoord:(CGPoint) coord
           delegate:(id<UnitActionDelegate>) delegate;

@end
