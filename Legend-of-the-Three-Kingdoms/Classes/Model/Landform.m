//
//  Landform.m
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-10.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import "Landform.h"

@implementation Landform
{
    LandformType _type;
}

- (Landform *)initWithCoord:(CGPoint)coord type:(int)type
{
    self = [super init];
    if (self) {
        _tileCoord = coord;
        _type = type;
    }
    return self;
}

- (LandformType)type
{
    return _type;
}

-(int)fSocre
{
    return _gScore + _hScore;
}

@end
