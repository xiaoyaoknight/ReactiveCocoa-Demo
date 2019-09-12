//
//  TestViewController13.m
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/9/5.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "TestViewController13.h"

@interface TestViewController13 ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation TestViewController13

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RAC-通知";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test];
}

- (void)test {

    //监听文本框
    [[self.textField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"监听文本框:%@",x);
    }];
}
@end
