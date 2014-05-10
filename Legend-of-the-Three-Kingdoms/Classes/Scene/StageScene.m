//
//  StageScene.m
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-10.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import "StageScene.h"
#import "cocos2d-ui.h"
#import "MapLoader.h"
#import "IntroScene.h"

@implementation StageScene
{
    CCSprite *_cursor;
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
    
//    [[OALSimpleAudio sharedInstance] playBg:@"Five Armies.mp3"];
    CCTiledMap *map = [[MapLoader sharedLoader] loadMap];
    [self addChild: map];
    
    CCTiledMapObjectGroup *buildingLayer = [map objectGroupNamed:@"Building"];
    for (NSDictionary * properties in[buildingLayer objects]) {
        CCSprite *build = [CCSprite spriteWithImageNamed:[properties valueForKeyPath:@"name"]];
        build.anchorPoint = ccp(0.0f, 0.0f);
        build.position = ccp([[properties valueForKeyPath:@"x"] floatValue] * 0.5,
                             [[properties valueForKeyPath:@"y"] floatValue] * 0.5);
        [self addChild:build];
    }
    
    _cursor = [CCSprite spriteWithImageNamed:@"cursor.png"];
    _cursor.anchorPoint = ccp(0.0f, 0.0f);
    [self addChild:_cursor];
    
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
    
}


- (void)onExit
{
    // always call super onExit last
    [super onExit];
    [[MapLoader sharedLoader] cleanMap];
}


#pragma mark - Button Callbacks

- (void)onBackClicked:(id)sender
{
    // back to intro scene with transition
    [[CCDirector sharedDirector] replaceScene:[IntroScene scene]
                               withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:1.0f]];
}


@end
