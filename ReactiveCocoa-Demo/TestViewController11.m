//
//  TestViewController11.m
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/9/5.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "TestViewController11.h"
#import <ReactiveObjC/NSObject+RACKVOWrapper.h>
#import "Person.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
@interface TestViewController11 ()

@property (weak, nonatomic) IBOutlet UIView *myView;

@property (nonatomic, strong) Person *person;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation TestViewController11

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RAC-KVO";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test];
}

- (IBAction)buttonAction:(id)sender {
    int x = arc4random() % 100;
    self.person.name = [NSString stringWithFormat:@"aaa%d", x];
}

- (void)test {
    self.person = [[Person alloc] init];
    __weak typeof(self) weakSelf = self;
    RACSignal *currentSignal = [self.person rac_valuesAndChangesForKeyPath:@"name" options:NSKeyValueObservingOptionNew observer:self];
    [currentSignal subscribeNext:^(RACTuple *x) {
        // 只要监听的属性一改变调用
        typeof(self) strongSelf = weakSelf;
        strongSelf.label.text = strongSelf.person.name;
        strongSelf.myView.backgroundColor = randomColor;
    }];
}

@end
