//
//  StageScene.m
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-10.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import "StageScene.h"
#import "cocos2d-ui.h"
#import "IntroScene.h"
#import "TileCoordUtil.h"
#import "Unit.h"

@implementation StageScene
{
    CCLayout *_stage;
    CCSprite *_cursor;
    CGPoint _preLocation;
    CGSize _viewSize;
}

#pragma mark - 

static inline CGPoint resetCursorPosition(UITouch * touch, CCLayout *stage, CCSprite *cursor)
{
    CGPoint location = [touch locationInNode:stage];
    cursor.position = positionForTileCoord(tileCoordForPosition(location));
    return location;
}

#pragma mark - Create & Destroy

+ (StageScene *)scene
{
    return [[self alloc] init];
}

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return(nil);
    
    _viewSize = [[CCDirector sharedDirector] viewSize];
    
//    [[OALSimpleAudio sharedInstance] playBg:@"Five Armies.mp3"];
    CCTiledMap *map = [[MapLoader sharedLoader] loadMap];
    _stage = [CCLayout node];
    _stage.contentSize = map.contentSize;
    [_stage addChild:map];
    [self addChild: _stage];
    
    CCTiledMapObjectGroup *buildingLayer = [map objectGroupNamed:@"Building"];
    for (NSDictionary * properties in[buildingLayer objects]) {
        CCSprite *build = [CCSprite spriteWithImageNamed:[properties valueForKeyPath:@"name"]];
        build.anchorPoint = ccp(0.0f, 0.0f);
        build.position = ccp([[properties valueForKeyPath:@"x"] floatValue] * TILE_SIZE_SCALE,
                             [[properties valueForKeyPath:@"y"] floatValue] * TILE_SIZE_SCALE);
        [_stage addChild:build];
    }
    
    CCTiledMapObjectGroup *unitLayer = [map objectGroupNamed:@"Unit"];
    for (NSDictionary * properties in[unitLayer objects]) {
        CCSprite *unit = [CCSprite spriteWithImageNamed:[properties valueForKeyPath:@"name"]];
        unit.anchorPoint = ccp(0.0f, 0.0f);
        unit.position = ccp([[properties valueForKeyPath:@"x"] floatValue] * TILE_SIZE_SCALE,
                             [[properties valueForKeyPath:@"y"] floatValue] * TILE_SIZE_SCALE);
        [_stage addChild:unit];
    }
    
    _cursor = [CCSprite spriteWithImageNamed:@"cursor.png"];
    _cursor.position = positionForTileCoord(ccp(0.0f, [[MapLoader sharedLoader] mapSize].height - 1));
    [_stage addChild:_cursor];
    
    CCButton *backButton = [CCButton buttonWithTitle:@"[ Menu ]" fontName:@"Verdana-Bold" fontSize:18.0f];
    backButton.positionType = CCPositionTypeNormalized;
    backButton.position = ccp(0.85f, 0.95f); // Top Right of screen
    [backButton setTarget:self selector:@selector(onBackClicked:)];
    [self addChild:backButton];
    
    // done
	return self;
}

- (void)dealloc
{
    // clean up code goes here
    _stage = nil;
    _cursor = nil;
}

#pragma mark - Enter & Exit

- (void)onEnter
{
    // always call super onEnter first
    [super onEnter];
    
    // In pre-v3, touch enable and scheduleUpdate was called here
    // In v3, touch is enabled by setting userInterActionEnabled for the individual nodes
    // Per frame update is automatically enabled, if update is overridden
    [self setUserInteractionEnabled:YES];
}


- (void)onExit
{
    [[MapLoader sharedLoader] cleanMap];
    // always call super onExit last
    [super onExit];
}


#pragma mark - Button Callbacks

- (void)onBackClicked:(id)sender
{
    // back to intro scene with transition
    [[CCDirector sharedDirector] replaceScene:[IntroScene scene]
                               withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:1.0f]];
}

#pragma mark - Touch Event

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    _preLocation = resetCursorPosition(touch, _stage, _cursor);
}

- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [touch locationInNode:_stage];
    
    float x;
    float xDiff = location.x - _preLocation.x;
    if (xDiff < 0) {
        x = max(_viewSize.width - _stage.contentSize.width, _stage.position.x + xDiff);
    } else {
        x = min(0.0f, _stage.position.x + xDiff);
    }
    
    float y;
    float yDiff = location.y - _preLocation.y;
    if (yDiff < 0) {
        y = max(_viewSize.height - _stage.contentSize.height, _stage.position.y + yDiff);
    } else {
        y = min(0.0f, _stage.position.y + yDiff);
    }
    
    _stage.position = ccp(x, y);
    _preLocation = location;
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    resetCursorPosition(touch, _stage, _cursor);
}

- (void)touchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    resetCursorPosition(touch, _stage, _cursor);
}

#pragma mark - UnitActionDelegate

- (void)selectUnit:(Unit *)unit withTouch:(UITouch *)touch
{
    resetCursorPosition(touch, _stage, _cursor);
    
    _cursor.opacity = 0.0f;
    _cursor.scale = 1.2f;
    
    id shrink = [CCActionScaleTo actionWithDuration:.3f scale:1.0f];
    id fade = [CCActionFadeTo actionWithDuration:.3f opacity:1.0f];
    
    id action = [CCActionSpawn actions:shrink, fade, nil];
    
    [_cursor runAction:action];
}

@end
