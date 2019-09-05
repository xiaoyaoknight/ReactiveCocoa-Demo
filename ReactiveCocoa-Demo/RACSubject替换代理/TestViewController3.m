//
//  TestViewController3.m
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/9/4.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "TestViewController3.h"
#import "TestView.h"

@interface TestViewController3 ()

@end

@implementation TestViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"RACSubject替换代理";
    self.view.backgroundColor = [UIColor whiteColor];
    
    TestView *testv = [[TestView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:testv];
    testv.backgroundColor = [UIColor redColor];
    
    RACSubject *subject = [RACSubject subject];
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    testv.racSubject = subject;
    
}


@end
