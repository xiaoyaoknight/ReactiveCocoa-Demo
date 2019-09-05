//
//  TestView.m
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/9/5.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [_racSubject sendNext:self];
//    [_racSubject sendCompleted];
}

@end
