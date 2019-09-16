//
//  TestViewController15.m
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/9/5.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "TestViewController15.h"

@interface TestViewController15 ()

@end

@implementation TestViewController15

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RAC(rac_liftSelector)";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test1];
}

/**
 rac_liftSelector:
 主要应用的场景就是，一个页面如果有多个请求，然后又要等到数据全部请求到，在刷新的时候，或者类似于这样子的场景就可以使用。
 需要注意的是，block在主线程，如果有耗时操作，最好还是放在子线程运行。
 */
- (void)test1 {
    RACSignal * signal1 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"我是图片1"];
        return nil;
        
    }];
    
    RACSignal * signal2 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"我是图片2"];
        return nil;
        
    }];
    
    RACSignal * signal3 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"我是图片3"];
        return nil;
        
    }];
    
    [self rac_liftSelector:@selector(updateUIPic:pic2:pic3:) withSignalsFromArray:@[signal1,signal2,signal3]];

}

- (void)updateUIPic:(id)pic1 pic2:(id)pic2 pic3:(id)pic3{
    
    NSLog(@"我要加载了 : pic1 - %@ pic2 - %@ pic3 - %@",pic1,pic2,pic3);
    
}
@end
