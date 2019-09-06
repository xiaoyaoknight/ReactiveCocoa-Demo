//
//  TestViewController4.m
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/9/5.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "TestViewController4.h"
#import "FlagItem.h"

@interface TestViewController4 ()

@end

@implementation TestViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RAC集合";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test];
    [self test1];
}

- (void)test {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:filePath];
    
    NSArray *newArray = [NSArray new];
    newArray = [[dataArray.rac_sequence map:^id _Nullable(id  _Nullable value) {
        return [FlagItem itemWithDict:value];
    }] array];
    NSLog(@"-------------%@", newArray);
    
    // 转化成RAC集合(RACSequence) 不能直接更新UI
    //    [datas.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
    //
    ////        NSLog(@"%@",x);
    //        // 更新UI
    //        FlagItem *item = [FlagItem itemWithDict:x];
    //        [arrM addObject:item];
    //    } completed:^{
    //
    //        NSLog(@"%@",arrM);
    //        NSLog(@"%@",[NSThread currentThread]);
    //        // 不管使用谁的框架,一定要记得确认线程,UI界面不显示,可能线程问题
    //
    //    }];
}

- (void)test1 {
    NSDictionary *dict = @{
                           @"name" : @"wangsicong",
                           @"money": @100000000
                           };
    
    // RACTuple:元组
    [dict.rac_sequence.signal subscribeNext:^(RACTuple * _Nullable x) {
        
        // 把元组解析出来
        RACTupleUnpack(NSString *key,id value) = x;
        
        /*
         NSString *key = x[0]
         id value = x[1]
         */
        
        NSLog(@"%@ %@",key,value);
    }];
    
    // 把值包装成元组
    RACTuple *tuple = RACTuplePack(@1,@3,@3);
    
    NSLog(@"%@",tuple);
    
}
@end
