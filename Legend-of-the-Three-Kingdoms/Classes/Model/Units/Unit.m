//
//  Unit.m
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-10.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import "Unit.h"
#import "CCTextureCache.h"
#import "Landform.h"
#import "SelectableSprite.h"
#import "StageScene.h"
#import "TileCoordUtil.h"

@implementation Unit

#pragma mark - Init

-(id)initWithStage:(CCLayout *)stage
         tileCoord:(CGPoint)coord
          delegate:(id<UnitActionDelegate>)delegate
{
    self = [super init];
    if (self) {
        _tileCoord = coord;
        _delegate = delegate;
        
        _unit = [SelectableSprite spriteWithImageNamed:@"Soldier_P1.png"];
        _unit.position = positionForTileCoord(coord);
        [_unit setUserInteractionEnabled:YES];
//        [_unit setTexture:[[CCTextureCache sharedTextureCache] addImage:@"Soldier_P2.png"]];
        [_unit setDelegate:self];
        [stage addChild:_unit];
    }
    return self;
}

#pragma mark - SelectableSprite Delegate

- (void)spriteTouched:(UITouch *)touch withEvent:(UIEvent *)event
{
    [_delegate selectUnit:self withTouch:touch];
}

#pragma mark - 

- (void)dealloc
{
    _delegate = nil;
}

@end
