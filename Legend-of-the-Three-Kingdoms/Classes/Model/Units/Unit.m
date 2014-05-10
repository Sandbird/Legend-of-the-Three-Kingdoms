//
//  Unit.m
//  Legend-of-the-Three-Kingdoms
//
//  Created by 钱宇杰 on 14-5-10.
//  Copyright (c) 2014年 qianyj. All rights reserved.
//

#import "Unit.h"
#import "Landform.h"

@implementation Unit

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)initWithLocation:(CGPoint)location {
    self = [super init];
    if (self) {
        _position = location;
    }
    return self;
}

@end
