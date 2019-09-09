//
//  TestViewController10.m
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/9/5.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "TestViewController10.h"

@interface TestViewController10 ()

@end

/*
 1.监听某个方法有没有调用(rac_signalForSelector:判断有没有调用某个方法)
 2.代替KVO
 3.监听事件
 4.代替通知
 5.监听文本框文字改变
 6.处理一个界面,多个请求的问题
 */
@implementation TestViewController10


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"rac_signalForSelector";
    self.view.backgroundColor = [UIColor whiteColor];
    [[self rac_signalForSelector:@selector(touchesBegan:withEvent:)] subscribeNext:^(RACTuple * _Nullable x) {
        NSLog(@"点击了view");
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

}
@end
