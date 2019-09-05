//
//  TestViewController1.m
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/9/4.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "TestViewController1.h"

@interface TestViewController1 ()

@end

@implementation TestViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RACSignal";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 信号 => 订阅 （响应式编程思想，只要信号一变化，马上通知你）
    // RACSignal:信号，ReactiveCocoa最基本类
    // RACDisposable:处理数据,清空数据
    // block:什么时候执行，block能干嘛
    
    // RACSubscriber:订阅者,发送信号消息
    // 信号本身不具备发送消息能力
    // 先订阅 在发送消息
    // 在订阅就会执行RACSignal的block
    
    // 创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        // 发送s信号变化
        NSLog(@"信号发生变化");
        
        // 假设在网络请求，发送请求后的数据
        [subscriber sendNext:@{@"a":@"ccc"}];
        
        // 如果不在发送数据，最好发送信号完成，内部会自动调用[RACDisposable disposable]取消订阅信号。
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            // 当订阅者被消耗的时候就会执行
            // 订阅发送完成或者error,也会执行Block
            // 清空数据
            NSLog(@"RACDisposable的block");
        }];
    }];
    
    // 订阅信号传的值
    // 底层：创建订阅者
    // 注意点：不要分开订阅，要一起订阅.
    [signal subscribeNext:^(id  _Nullable x) {
         NSLog(@"信号传值的时候 %@",x);
    } error:^(NSError * _Nullable error) {
        // 订阅信号错误
        // 内部会创建新的订阅者
        NSLog(@"信号传值的错误 %@",error);
    } completed:^{
        // 订阅完成
        NSLog(@"信号传值完成");
    }];
    
    // 可能会订阅多次，执行多次
//    [signal subscribeNext:^(id  _Nullable x) {
//
//    }];
//
//    [signal subscribeError:^(NSError * _Nullable error) {
//
//    }];
//
//    [signal subscribeCompleted:^{
//
//    }];
}


@end
