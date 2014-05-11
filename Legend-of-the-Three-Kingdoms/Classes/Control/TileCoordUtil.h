//
//  MapManageUtil.h
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-10.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameConfig.h"
#import "MapLoader.h"

#ifdef __cplusplus
extern "C" {
#endif

// Return tile coordinates (in rows and columns) for a given position
static inline CGPoint
tileCoordForPosition(CGPoint position)
{
    int x = position.x / TILE_SIZE;
    int y = (([[MapLoader sharedLoader] mapSize].height * TILE_SIZE) - position.y) / TILE_SIZE;
    return ccp(x, y);
}

// Return the position for a tile based on its row and column
static inline CGPoint
positionForTileCoord(CGPoint tileCoord)
{
    int x = tileCoord.x * TILE_SIZE + TILE_SIZE / 2;
    int y = ([[MapLoader sharedLoader] mapSize].height - tileCoord.y) * TILE_SIZE - TILE_SIZE / 2;
    return ccp(x, y);
}
    
#ifdef __cplusplus
}
#endif
