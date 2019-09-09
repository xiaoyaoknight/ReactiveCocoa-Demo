//
//  TestViewController9.m
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/9/5.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "TestViewController9.h"

@interface TestViewController9 ()

@end

/*
 RACCommand基本使用:
 RACCommand原理:
 
 RACCommand:
 监听按钮点击,网络请求
 */
@interface TestViewController9 ()

@property (strong, nonatomic) UIButton *loginButton;

@end

@implementation TestViewController9

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"RACCommand场景";
    self.view.backgroundColor = [UIColor whiteColor];

    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginButton.frame = CGRectMake(100, 100, 200, 200);
    self.loginButton.backgroundColor = [UIColor blueColor];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:self.loginButton];
 
    
//    [self test];
    [self test1];
}

- (void)test {
    _loginButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        // comandBlock
        NSLog(@"点击了按钮%@",input);
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            // 信号Block
            [subscriber sendNext:input];
            
            return nil;
        }];
    }];
}

- (void)test1 {
    RACSubject *enableSignal = [RACSubject subject];
    _loginButton.rac_command = [[RACCommand alloc] initWithEnabled:enableSignal signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        // comandBlock
        NSLog(@"点击了按钮%@",input);
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            // 信号Block
            [subscriber sendNext:input];
            
            // 请求完成的时候去调用
            [subscriber sendCompleted];
            
            return nil;
        }];
    }];
    
    [[_loginButton.rac_command.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        BOOL executing = [x boolValue];
        [enableSignal sendNext:@(!executing)];
    }];
    
    // 监听
    [_loginButton.rac_command.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
}
@end
