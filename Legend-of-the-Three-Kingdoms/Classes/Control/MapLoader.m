//
//  MapLoader.m
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-10.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import "MapLoader.h"
#import "CCTiledMap.h"

@implementation MapLoader
{
    CCTiledMap *tileMap;
    CCTiledMapLayer *backgroundLayer;
    CCTiledMapLayer *buildingLayer;
    CCTiledMapLayer *unitLayer;
}

+ (MapLoader *)sharedLoader
{
    static MapLoader *sharedMapLoaderInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedMapLoaderInstance = [[self alloc] init];
    });
    return sharedMapLoaderInstance;
}

- (CCTiledMap *)loadMap
{
    tileMap = [CCTiledMap tiledMapWithFile:@"StageMap.tmx"];
    return tileMap;
}

-(void)cleanMap
{
    tileMap = nil;
}

- (CGSize)mapSize
{
    return tileMap.mapSize;
}

@end
