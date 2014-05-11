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
    CGPoint _location;
    LandformType _type;
}

- (Landform *)initWithLoaction:(CGPoint)location type:(int)type
{
    self = [super init];
    if (self) {
        _location = location;
        _type = type;
    }
    return self;
}

- (CGPoint)location
{
    return _location;
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
