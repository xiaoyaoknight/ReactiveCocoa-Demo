//
//  TestViewController7.m
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/9/5.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "TestViewController7.h"

@interface TestViewController7 ()

@end

@implementation TestViewController7

// RACCommand:处理事件

/*
 注意:
 1.RACCommand内部必须要返回signal
 2.executionSignals 信号中信号,一开始获取不到内部信号
 2.1 switchToLatest:获取内部信号
 2.2 execute:获取内部信号
 3.executing: 判断是否正在执行
 3.1 第一次不准确,需要skip,跳过
 3.2 一定要记得sendCompleted,否则永远不会执行完成
 4.execute执行,执行command的block
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RACCommand使用";
    self.view.backgroundColor = [UIColor whiteColor];

    // 创建Command
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        // Command的block
        NSLog(@"执行BlocK,%@",input);
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            // 信号的block
            NSLog(@"执行信号的block");
            // 发送数据 => RACReplaySubject
            [subscriber sendNext:@"你好"];
            
            // 发送完成
            [subscriber sendCompleted];
            
            return nil;
        }];
    }];
    
    // 订阅command信号
    // executionSignals: 信号中信号,信号发送信号
    // switchToLatest:获取最近发送的信号
    [command.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    // 监听命令的执行情况 有没有完成
    [[command.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        BOOL isExecuting = [x boolValue];
        
        if (isExecuting) {
            NSLog(@"正在执行");
        } else {
            NSLog(@"执行完成");
        }
    }];
    
    //    [command.executing subscribeNext:^(NSNumber * _Nullable x) {
    //
    //        BOOL isExecuting = [x boolValue];
    //
    //        if (isExecuting) {
    //            NSLog(@"正在执行");
    //        } else {
    //            NSLog(@"执行完成");
    //        }
    //
    //    }];
    //    [command.executionSignals subscribeNext:^(id  _Nullable x) {
    //
    //        NSLog(@"%@",x);
    //
    //        [x subscribeNext:^(id  _Nullable x) {
    //            NSLog(@"%@",x);
    //        }];
    //
    //    }];
    
    // 执行execute 就会执行
    RACReplaySubject *subject = [command execute:@1];
    
    [subject subscribeNext:^(id  _Nullable x) {
        
    }];
    // 怎么订阅command内部信号
    //    [[command execute:@1] subscribeNext:^(id  _Nullable x) {
    //        NSLog(@"%@",x);
    //    }];
    
}
@end
