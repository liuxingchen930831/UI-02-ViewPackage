//
//  Shop.m
//  UI-02
//
//  Created by liuxingchen on 16/9/1.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "Shop.h"

@implementation Shop
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}
+(instancetype)shopWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
