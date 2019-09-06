//
//  TestViewController5.m
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/9/5.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "TestViewController5.h"

@interface TestViewController5 ()

@end

@implementation TestViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RACMulticastConnection使用";
    self.view.backgroundColor = [UIColor whiteColor];
//    [self test]; // 多次订阅有问题
    [self test1]; // 解决后~
    
}


/**
 Multicast:广播 一对多
 RACMulticastConnection:解决RACSignal副作用
 RACMulticastConnection怎么去使用.解决问题？
 */
- (void)test {
    
    // 网络请求:请求一次
    @weakify(self)
    /*
     创建RACDynamicSignal,保存didSubscribe
     */
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        @strongify(self);
        
        // 网络请求
        NSLog(@"发送请求");
        
        [self loadData:^(id data) {
            // subscriber  subject
            [subscriber sendNext:data];
            
        }];
        
        return nil;
    }];
    
    //     订阅信号 ：订阅多次的副作用 执行多次
    [signal subscribeNext:^(id  _Nullable x) {
        
    }];
    
    [signal subscribeNext:^(id  _Nullable x) {
        
    }];
}

- (void)test1 {
   
    @weakify(self)
    /*
     创建RACDynamicSignal,保存didSubscribe
     */
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        @strongify(self);
        
        // 网络请求
        NSLog(@"发送请求");
        
        [self loadData:^(id data) {
            // subscriber  subject
            [subscriber sendNext:data];
            
        }];
        
        return nil;
    }];
    
    // RACSignal 转化 RACMulticastConnection
    // 内部的source 是 RACDynamicSignal
    RACMulticastConnection *connection = [signal publish];
    
    // 订阅信号:sendNext
    // RACSubject:RACSubscribe(会吧订阅者保存起来)
    [connection.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    [connection.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    // 进行连接
    /*
     本质是：RACSubject订阅signal
     */
    [connection connect];
}


- (void)loadData:(void(^)(id))success {
    if (success) {
        success(@"123");
    }
}
@end
