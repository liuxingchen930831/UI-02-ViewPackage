//
//  Shop.h
//  UI-02
//
//  Created by liuxingchen on 16/9/1.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Shop : NSObject

/** 商品名 */
@property(nonatomic,copy)NSString * name ;
/** 商品图 */
@property(nonatomic,copy)NSString * icon ;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)shopWithDict:(NSDictionary *)dict;
@end
