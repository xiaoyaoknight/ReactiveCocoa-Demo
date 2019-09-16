//
//  TestViewController14.m
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/9/5.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "TestViewController14.h"
#import <ReactiveObjC/UITextField+RACSignalSupport.h>

@interface TestViewController14 ()

@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (nonatomic, strong) RACSubject *oneSubejct;
@end

@implementation TestViewController14

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RAC(绑定信号)";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.textField1.rac_newTextChannel subscribe:self.textField2.rac_newTextChannel];
    [self.textField2.rac_newTextChannel subscribe:self.textField1.rac_newTextChannel];
}

/**
 多个新号绑定成一个新的新号
 */
- (void)test1 {
    
    self.oneSubejct = [RACSubject subject];
    RACSubject *baseSignal = [RACSubject subject];
    [[RACSignal combineLatest:@[baseSignal,self.oneSubejct]]subscribeNext:^(id x) {
        // 点击的话，收到的值是 abc testBac
        NSLog(@"信号发送combineLatest");
    }];
    [baseSignal sendNext:@"testBac"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.oneSubejct sendNext:@"abc"];
}
@end
