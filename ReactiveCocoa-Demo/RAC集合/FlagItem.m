//
//  FlagItem.m
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/9/5.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "FlagItem.h"

@implementation FlagItem

+ (instancetype)itemWithDict:(NSDictionary *)dict {
    
    FlagItem *item = [[self alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    
    return item;
}
@end
