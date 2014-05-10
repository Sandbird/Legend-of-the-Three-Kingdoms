//
//  MapLoader.h
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-10.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCTiledMap;

@interface MapLoader : NSObject

+ (MapLoader *)sharedLoader;

- (CCTiledMap *)loadMap;
- (void)cleanMap;

@end
