//
//  FlagItem.h
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/9/5.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlagItem : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;

+ (instancetype)itemWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
