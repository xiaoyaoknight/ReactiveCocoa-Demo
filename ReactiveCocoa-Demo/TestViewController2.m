//
//  TestViewController2.m
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/9/4.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "TestViewController2.h"

@interface TestViewController2 ()

@end

/*
 RACSignal:信号
 
 订阅RACSignal，自动创建RACSubscriber，RACSubscriber发送信号消息
 
 RACSignal:只能订阅，不能发送
 RACSignal;只有一个订阅者
 
 
 先发送信号，在订阅
 
 RACSubject：有多个订阅者
 RACSubject和RACReplaySubject：
 
 RACSubject即可以订阅，也可以发送消息
 
 共同点：既可以充当信号也可以充当订阅者
 
 开发中：一个数据，需要多个类同时处理,使用RACSubject
 
 
 RACReplaySubject：保存值
 
 // RACSubject开发的时候，使用的比较多
 
 
 // RACSubject 代替代理
 
 */
@implementation TestViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RACSubject RACReplaySubject";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 先发送，在订阅
    // 创建信号
    RACReplaySubject *replaySubject = [RACReplaySubject subject];
    
    // 发送信息
    // 先保存123
    // 再执行nextBlock
    [replaySubject sendNext:@"123"];
    [replaySubject sendNext:@"321"];
    
    // 订阅信号
    // 遍历值，让一个订阅者去发送多个值
    // 只要订阅一次，之前所有发送的值都能获取到.
    [replaySubject subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);// 执行2次，第一次收到123 第二次收到321
    }];
    
    // 多个值一个类可以拿到
    // 一个类想拿多个值，采用RACReplaySubject
    // RACReplaySubject价值 ：先发送，在订阅
    // 热门 精选
    
}

- (void)test
{
    // 先订阅 在发送信号
    // 创建信号
    RACSubject *subject = [RACSubject subject];
    
    // 订阅
    // 内部创建RACSubscriber，并且保存起来
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"第一个订阅者%@",x);
        
    }];
    
    [subject subscribeNext:^(id  _Nullable x) {
        
        NSLog(@"第二个订阅者%@",x);
        
    }];
    
    // 发送信号
    // 遍历所有的订阅者，执行nextBlock
    [subject sendNext:@1];
}

@end
