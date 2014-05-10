//
//  Landform.h
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-10.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * LandformType | 地形种类
 */
typedef NS_ENUM(int, LandformType) {
    /**
     * Plain | 平原
     */
    Plain,
    /**
     * Forest | 森林
     */
    Forest,
    /**
     * Mountain | 山
     */
    Mountain,
    /**
     * River | 河
     */
    River,
    /**
     * Sea | 海
     */
    Sea
};

@interface Landform : NSObject

@property (nonatomic, assign) Landform *adjacentOne;
@property (nonatomic, assign) int hScore;
@property (nonatomic, assign, getter = getGScore) int gScore;

- (Landform *)initWithLoaction:(CGPoint) location type:(int)type;

- (CGPoint)location;
- (LandformType)type;
- (int)fSocre;

@end
